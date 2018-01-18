class BorrowerController < ApplicationController
    def create
        puts borrower_params
        borrower = Borrower.new(borrower_params)
        if borrower.save && borrower.password_confirmation = params[:password_confirmation]
            flash[:borrower_success] = "You have successfully signed up! Please log in."
            redirect_to :back
        else
            flash[:borrower_errors] = borrower.errors.full_messages
            redirect_to :back
        end
    end

    def show
        @borrower = current_borrower
        @lent = Lender.joins(:histories).where("lender_id !=?", params[:borrower_id]).select("*")
    end

    private
    def borrower_params
        params.require(:borrower).permit(:first_name, :last_name, :email, :password, :money, :purpose, :description)
    end

end