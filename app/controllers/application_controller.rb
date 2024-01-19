class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in? #essentiel pour avoir les restrictions user dans les views

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id] 
    end

    def logged_in?
        !!current_user
    end

    def require_user
        unless logged_in? 
            flash[:danger] = "Vous devez être connectés pour cette action"
            redirect_to root_path
        end
    end
end