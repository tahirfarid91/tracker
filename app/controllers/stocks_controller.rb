class StocksController < ApplicationController


    def search
        if params[:stock].present?
            @stock = Stock.new_lookup(params[:stock])
            if @stock
                flash[:alert] = "The requested data is not available to free tier accounts. Please upgrade for access to this data."
                redirect_to my_portfolio_path
                #render 'users/my_portfolio'
            else
                flash[:alert] = "Please enter a valid symbol to search"
                redirect_to my_portfolio_path
            end
        else
            flash[:alert] = "Please enter a symbol to search"
            redirect_to my_portfolio_path
        end
    end

end
