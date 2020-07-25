class SessionsController < ApplicationController


    def create
        user = User.find_by(email: params["user"]["email"]).try(:authenticate, params["user"]["password"])

        if user
            session[:user_id] = user.id
            remder json: {
                status: :created, 
                logged_in: true, 
                user: user
            }
        else 
            # 401 is universal unathorized code
            render json: {status: 401}
        end 
    end 


end 