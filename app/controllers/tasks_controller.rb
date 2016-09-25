class TasksController < ApplicationController

	def index
		if params[:search]
			@task = Task.search(params[:search]).order("stato")
		else
			#@task = Task.all.order("stato") #ordino i task
			@task = Task.where(user_id: session[:user_id]).order("stato")
		end
	end

	def show
		@task = Task.find(params[:id])
	end

	def new
	end

	def edit
		@task = Task.find(params[:id])
	end

	def create
		#render plain: params[:task].inspect
		@user = User.find_by(id: session[:user_id])
		@task = Task.new(params.require(:task).permit(:stato, :chi, :note))

		@task.data_apertura = Date.today
		@task.user_id = @user.id

		@task.save
		redirect_to tasks_path
	end

	def update
		@task = Task.find(params[:id])
		
		# !!!!!!!prendere un solo parametro
		if params[:task][:stato] == 'FATTO' #prendo lo stato e vedo se è uguale a FATTO
			
			#creo un oggetto archived_task in cui mi salvo i parametri da salvare nella nuova tabella
			@user = User.find_by(id: session[:user_id])
			@archived_task = ArchivedTask.new(params.require(:task).permit(:data_apertura, :stato, :chi, :note))
			
			@archived_task.data_chiusura = Date.today #salvo la data di chiusura della task da archiviara
			@archived_task.user_id = @user.id

			@archived_task.save

			@task.destroy #elimino la task che sposto in archivio

			redirect_to archived_tasks_path

		elsif @task.update(params.require(:task).permit(:data_apertura, :stato, :chi, :note))
			redirect_to tasks_path
		else
			render 'edit'
		end
	end

	def destroy
	  @task = Task.find(params[:id])
	  @task.destroy
	 
	  redirect_to tasks_path
	end

end
