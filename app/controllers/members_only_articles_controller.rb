class MembersOnlyArticlesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    articles = Article.where(is_member_only: true).includes(:user).order(created_at: :desc)
    render json: articles, each_serializer: ArticleListSerializer
  end

  def show
    article = Article.find_by(id: params[:id], is_member_only: true)
    if article
      render json: article
    else
      record_not_found
    end
  end

  private

  def record_not_found
    render json: { error: "Article not found" }, status: :not_found
  end
end
class MembersOnlyArticlesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    articles = Article.where(is_member_only: true).includes(:user).order(created_at: :desc)
    render json: articles, each_serializer: ArticleListSerializer
  end

  def show
    article = Article.find_by(id: params[:id], is_member_only: true)
    if article
      render json: article
    else
      record_not_found
    end
  end

  private

  def record_not_found
    render json: { error: "Article not found" }, status: :not_found
  end
end
