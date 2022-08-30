class Stock < ApplicationRecord

    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:iex_api_key],
        secret_token: 'sk_7d4983a3f6a54fd08d1dff51b82be876',
        endpoint: 'https://cloud.iexapis.com/v1')
        client.price(ticker_symbol)
    end

end
