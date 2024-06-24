class ArticleObserver < ActiveRecord::Observer
  def after_create(article)
    MailJob.perform_async(article.id)
  end
end