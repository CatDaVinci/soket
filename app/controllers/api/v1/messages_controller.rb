module Api
  module V1
    class MessagesController < Api::V1::ApplicationController
      def index
        @messages = User.find(params[:user_id]).messages
        render_success(@messages, 200, root: 'messages')
      end

      def create
        @message = Message.new(message_params)
        if @message.save
          render_success(@message, :created)
        else
          render_errors(@message.errors, :unprocessable_entity)
        end
      end

      private

      def message_params
        params.require(:message).permit(:body, :user_id)
      end
    end
  end
end
