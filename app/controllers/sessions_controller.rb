class SessionsController < ApplicationController
   
    def new
    
    end

    def create 
            user = User.find_by(email: params[:session][:email].downcase)
        
            if user && user.authenticate(params[:session][:password])
                flash[:success] = "Félicitations pour cette connexion"
                session[:user_id] = user.id 
                redirect_to user_path(user)
        
            else
                flash.now[:danger] = "Identifiants incorrects"
                render 'new'
            end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "Au revoir et à bientôt!"
        redirect_to root_path
    end
end