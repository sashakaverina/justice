class Api::V1::TagsController < Api::V1::BaseController
  skip_after_action :verify_authorized

  def create
    @text = params["text"]
    #to do: remove punctuation from text
    @tags = ActsAsTaggableOn::Tag.all.where(name: @text.downcase.split)
    render json: @tags.pluck(:name)
  end
end
