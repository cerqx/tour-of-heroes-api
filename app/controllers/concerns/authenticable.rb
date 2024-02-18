module Authenticable
    private

    def authenticate_with_token
        @token ||= request.headers['Authorization'] 

        unless valid_token?
            render json: { errors: 'Token inválido'},
                   status: :unauthorized
        end
    end

    def valid_token? 
        @token.present?
    end
end