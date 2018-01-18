class LenderController < ApplicationController
    def create
        puts lender_params
        lender = Lender.new(lender_params)
        if lender.save && lender.password_confirmation = params[:password_confirmation]
            flash[:lender_success] = "You have successfully signed up! Please log in."
            redirect_to :back
        else
            flash[:lender_errors] = lender.errors.full_messages
            redirect_to :back
        end
    end

    def show
        @lender=current_lender
        @all_borrowers = Borrower.all
    end

    private
    def lender_params
        params.require(:lender).permit(:first_name, :last_name, :email, :password, :money)
    end
end
