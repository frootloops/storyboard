class Api::V1::StepsController < Api::ApiController
  before_filter :verify_authenticity_token

  #def index
  #  render json: current_user.guides.published, each_serializer: GuideSerializer, root: false
  #end
  #
  def create
    guide = current_user.guides.find params[:guide_id]
    step = Step.new(step_params) do |step|
      step.guide = guide
    end

    if step.save
      render status: :created, json: step, serializer: StepSerializer
    else
      render status: :bad_request, json: {}
    end
  end

  def update
    step = current_user.guides.find(params[:guide_id]).steps.find(params[:id])

    if step.update_attributes step_params
      render json: step, serializer: StepSerializer
    else
      render status: :bad_request, json: {}
    end
  end

  private
  def step_params
    ActionController::Parameters.new(params)
                                .permit(:title, :description)
  end
end