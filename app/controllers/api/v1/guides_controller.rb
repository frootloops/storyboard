class Api::V1::GuidesController < Api::ApiController
  before_filter :verify_authenticity_token

  def index
    render json: current_user.guides.published, each_serializer: GuideSerializer, root: false
  end

  def create
    guide = current_user.guides.new guide_params

    if guide.save
      render status: :created, json: guide, serializer: GuideSerializer
    else
      render status: :bad_request, json: {}
    end
  end

  def update
    guide = current_user.guides.find(params[:id])
    if guide.update_attributes guide_params
      render json: guide, serializer: GuideSerializer
    else
      render status: :bad_request, json: {}
    end
  end

  private
  def guide_params
    ActionController::Parameters.new(params)
                                .permit(:title, :description, :slug, :supply, :topic_id)
  end
end