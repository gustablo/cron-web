class Admin::JobsController < Admin::BaseController
  def initialize
    @cron_service = Cron::Service.new
    @dto = Cron::Dto.new
    super
  end

  def index
    response = @cron_service.list(@current_user.id)
    @jobs = response.present? ? response.map { |job| @dto.from_response(job) } : []
  end

  def new; end

  def create
    request = @dto.to_request(job_params.merge(user_id: @current_user.id))
    @cron_service.create(request)

    redirect_to admin_jobs_url
  end

  private

  def job_params
    params.permit(:name, :expression, :webhook_url)
  end
end
