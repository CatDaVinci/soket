module Api
  module V1
    class ApplicationController < ActionController::Base
      def render_success(object = {}, status = :ok, options = {})
        render options.merge({:json => object, :status => status})
      end

      def render_errors(object, status = :bad_request, options = {})
        render options.merge({:json => {:errors => object}, :status => status})
      end
    end
  end
end
