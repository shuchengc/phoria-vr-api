Knock::AuthTokenController.class_eval do

  def create
    token = auth_token.token
    payload = JWT.decode(token, Rails.application.secrets.secret_key_base, { algorithm: 'HS256' })
    render json: {
        jwt: token,
        payload: payload
      }, status: :created
  end

end