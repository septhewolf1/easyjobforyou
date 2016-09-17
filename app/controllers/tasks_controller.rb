class TasksController < ApplicationController

	def index
		if params[:search]
			@task = Task.search(params[:search]).order("stato")
		else
			@task = Task.all.order("stato") #ordino i task
		end
	end


	def new
	end

	def create
		#render plain: params[:task].inspect
		@task = Task.new(params.require(:task).permit(:stato, :chi, :note))

		@task.data_apertura = Date.today
	
		@task.save
		redirect_to tasks_path
	end
  

end
