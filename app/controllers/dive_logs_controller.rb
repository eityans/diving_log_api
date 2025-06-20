class DiveLogsController < SecuredController
  skip_before_action :authorize_request, only: [ :index ]

  def index
    dive_logs = DiveLog.all
    render json: dive_logs
  end

  def create
    dive_log = current_user.dive_logs.build(dive_log_params)
    if dive_log.save
      render json: dive_log, status: :created
    else
      render json: { errors: dive_log.errors }, status: :unprocessable_entity
    end
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
      :equipment
    )
  end
end
