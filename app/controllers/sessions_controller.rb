class SessionsController < ApplicationController
    def index
    end

    def new
        render '/sessions/new'
    end

    def create
        lender = Lender.find_by(email: params[:email])
        borrower = Borrower.find_by(email: params[:email])        
        if lender && lender.authenticate(params[:password])
          session[:lender_id] = lender.id
          redirect_to "/lender/#{lender.id}"
        elsif (borrower && borrower.authenticate(params[:password]))
            session[:borrower_id] = borrower.id
            redirect_to "/borrower/#{borrower.id}"
        else
          flash[:errors] = 'Invalid email/password combination'
          redirect_to :back
        end
    end

    def destroy
        if session[:lender_id] = nil
            redirect_to '/login'
        else
            session[:borrower_id] = nil
            redirect_to '/login'
      end
    end


end
