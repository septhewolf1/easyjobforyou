class SessionsController < ApplicationController
  skip_before_action :authorize #l'unica azione che permetto è il login

  def new
  end

  def create
	user = User.find_by(name: params[:name])
	if user and user.authenticate(params[:password])
		session[:user_id] = user.id
		redirect_to admin_index_url
	else
		redirect_to login_url, alert: "Nome utente o password non validi"
	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to login_url, notice: "Logged out"
  end
end
