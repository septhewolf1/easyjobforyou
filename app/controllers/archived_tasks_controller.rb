class ArchivedTasksController < ApplicationController
  	def index
		if params[:search]
			@archived_task = ArchivedTask.search(params[:search]).order("data_chiusura") #ricerco e ordino per stato
		else
			@archived_task = ArchivedTask.all.order("data_chiusura") #ordino i task per "data_chiusura")
		end
  	end

  	def edit
  		@archived_task = ArchivedTask.find(params[:id])
  	end

  	def update
		@archived_task = ArchivedTask.find(params[:id])
		
		if params[:archived_task][:stato] != 'FATTO'

			@task = Task.new(params.require(:archived_task).permit(:data_apertura, :stato, :chi, :note))
			@task.save

			@archived_task.destroy #elimino la task dall'archivio

			redirect_to tasks_path

		else
			render 'edit'
		end
   	end

	def destroy
	  	@archived_task = ArchivedTask.find(params[:id])
	 	@archived_task.destroy
	 
	  	redirect_to tasks_path
	end

end