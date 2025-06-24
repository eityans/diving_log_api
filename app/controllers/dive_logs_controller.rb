class DiveLogsController < SecuredController
  skip_before_action :authorize_request, only: [ :index, :user_logs, :show ]

  def index
    dive_logs = DiveLog.all
    render json: dive_logs
  end

  def show
    dive_log = DiveLog.find(params[:id])
    render json: dive_log
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Dive log not found" }, status: :not_found
  end

  def create
    dive_log = current_user.dive_logs.build(dive_log_params)
    if dive_log.save
      render json: dive_log, status: :created
    else
      render json: { errors: dive_log.errors }, status: :unprocessable_entity
    end
  end

  def user_logs
    user = User.find(params[:user_id])
    dive_logs = user.dive_logs
    render json: dive_logs
  rescue ActiveRecord::RecordNotFound
    render json: { error: "User not found" }, status: :not_found
  end

  def my_logs
    dive_logs = current_user.dive_logs.order(dive_number: :desc)
    render json: dive_logs
  end

  def destroy
    dive_log = current_user.dive_logs.find(params[:id])
    dive_log.destroy
    head :no_content
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Dive log not found or not authorized" }, status: :not_found
  end

  def update
    dive_log = current_user.dive_logs.find(params[:id])
    if dive_log.update(dive_log_params)
      render json: dive_log
    else
      render json: { errors: dive_log.errors }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Dive log not found or not authorized" }, status: :not_found
  end

  private

  def dive_log_params
    params.require(:dive_log).permit(
      :dive_number,
      :spot_name,
      :date,
      :entry_time,
      :exit_time,
      :guide_name,
      :max_temp,
      :min_temp,
      :max_depth,
      :average_depth,
      :weight,
      :equipment,
      :memo,
      :visibility,
      :air_remaining,
      :point_name,
      :tank_material,
      :tank_capacity,
      :shop_name
    )
  end
end
