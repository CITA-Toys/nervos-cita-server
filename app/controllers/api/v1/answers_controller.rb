class Api::V1::AnswersController < Api::ApplicationController
  # create a answer
  # post /api/v1/answers
  # @params {
  #   content: JSON
  # }
  def create
    @answer = Answer.new(content: params[:content])
    if @answer.save
      render json: {
        status: SUCCESS_STATUS,
        data: @answer
      }
    else
      render json: {
        status: ERROR_STATUS,
        message: @answer.errors.full_messages.join(", ")
      }
    end
  end
end
