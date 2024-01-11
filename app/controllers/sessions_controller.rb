class SessionsController < ApplicationController
   
    def new
    
    end

    def create 
        #if params[:session].present? && params[:session][:email].present? && params[:session][:password].present?
            user = User.find_by(email: params[:session][:email].downcase)
        
            if user && user.authenticate(params[:session][:password])
                flash[:success] = "Félicitations pour cette connexion"
                session[:user_id] = user.id 
                redirect_to user_path(user)
        
            else
                flash.now[:danger] = "Identifiants incorrects"
                render 'new'
            end
        #end
    end

    def destroy

    end
end