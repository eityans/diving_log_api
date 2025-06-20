class UsersController < SecuredController
  skip_before_action :authorize_request, only: [ :create ]

  def create
    user = AuthorizationService.new(request.headers).generate_user!
    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def me
    render json: { id: current_user.id, sub: current_user.sub, name: current_user.name }
  end
end
