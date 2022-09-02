class StocksController < ApplicationController

	

  	def search
        if	params[:stock].present?
        	@stock = Stock.new_lookup(params[:stock])
        
			#if  params[:stock] == @stock[:ticker]

				if 	@stock[:success]
					flash[:alert] = "Success"
					redirect_to my_portfolio_path
				
				else
					flash[:alert] = @stock[:message]
					redirect_to my_portfolio_path
				end
							
      	else
            flash[:alert] = "Please enter a symbol to search"
            redirect_to my_portfolio_path
        end
  	end

end
  