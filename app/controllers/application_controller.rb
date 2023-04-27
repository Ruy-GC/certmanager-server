class ApplicationController < ActionController::API
    #all controllers can access this method
    def encode_token(payload)
        JWT.encode(payload,'secret')
    end
end
