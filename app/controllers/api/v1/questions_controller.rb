module Api
  module V1
    class QuestionsController < ApiController      
      
      def show
        @question = Question.from_param(params[:id])
        raise SecurityTransgression unless @api_user.can_read?(@question)
      end
      
    end
  end
end