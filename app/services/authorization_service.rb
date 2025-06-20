class AuthorizationService
  def initialize(headers = {})
    @headers = headers
  end

  def authenticate_request!
    payload, _header = verify_token
    User.find_by!(sub: payload["sub"])
  end

  def generate_user!
    payload, _header = verify_token
    User.find_or_create_by(sub: payload["sub"])
  end

  private

  def http_token
    if @headers["Authorization"].present?
      @headers["Authorization"].split(" ").last
    end
  end

  def verify_token
    JsonWebToken.verify(http_token)
  end
end
