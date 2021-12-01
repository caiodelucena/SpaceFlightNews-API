module Api
  module V1
    class IndexController < ApplicationController
      def index
        render json: { status: '200', message: 'Back-end Challenge 2021 🏅 - Space Flight News' }, status: :ok
      end
    end
  end
end