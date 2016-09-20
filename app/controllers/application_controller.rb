class ApplicationController < ActionController::Base
  before_action :authorize #eseguo il controllo della sessione prima di permettere qualsiasi azione
  	protect_from_forgery with: :exception

  	protected
#controllo che la sessione sia valida altrimenti rimando al login
  		def authorize
  			unless User.find_by(id: session[:user_id])
  				redirect_to login_url, notice: "Prima fai il log in"
  			end
  		end
end
