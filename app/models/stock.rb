class Stock < ApplicationRecord
   has_many :user_stocks
   has_many :users, through: :user_stocks


 
    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(publishable_token: 
                                    Rails.application.credentials.iex_client[:iex_api_key],
                                    secret_token: 'sk_7d4983a3f6a54fd08d1dff51b82be876',
                                    endpoint: 'https://cloud.iexapis.com/v1')
        begin
          respnose = new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol)) 
          {success: true, data: response, message: "Successfully Fetched!!!"}
        rescue => e
          {success: false, data: nil, message: e}

        end
    end

    

end
