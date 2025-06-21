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
    max_dive_number = current_user.dive_logs.maximum(:dive_number) || 0
    render json: {
      id: current_user.id,
      sub: current_user.sub,
      name: current_user.name,
      max_dive_number: max_dive_number
    }
  end
end
