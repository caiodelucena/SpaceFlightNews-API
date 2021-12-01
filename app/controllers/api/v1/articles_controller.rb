module Api
  module V1
    class ArticlesController < ApplicationController
      include Paginable

      before_action :set_article, only: [:show, :update, :destroy]

      def index
        @articles = Article.page(current_page).per(per_page)
        render :json =>  {:articles => @articles, :meta => meta_attributes(@articles)}
      end 

      def show
        render json: @article
      end

      def create
        @article = Article.new(article_params)
        if @article.save 
          render json: @article, status: :created
        else 
          render json: { errors: @article.errors.full_messages }
        end
      end

      def update
        if @article.update(article_params) 
          render json: @article, status: :accepted
        else 
          render json: { errors: @article.errors.full_messages }, status: :bad_request 
        end
      end

      def destroy
        if @article.destroy
          render json: @article, status: :accepted
        else
          render json: { errors: @article.errors.full_messages }, status: :bad_request 
        end
      end

      private

      def set_article
        @article = Article.find(params[:id])
      end

      def article_params
        params.require(:article).permit(:id, :title, :featured, :url, :imageUrl, :newsSite, :summary, :publishedAt, launches: [:id, :provider], events: [:id, :provider])
      end

    end
  end
end