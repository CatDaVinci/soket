module Api
  module V1
    class UsersController < Api::V1::ApplicationController
      def show
        @user = User.find(params[:id])
        render_success(@user)
      end
    end
  end
end
