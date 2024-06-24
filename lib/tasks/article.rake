namespace :article do
  desc "notify new articles everyday"
  task :notify_new_article => :environment do
    articles = Article.created_after(1.day.ago).limit(5)
    service = LatestArticleNotifier.new(articles)
    service.call
  end

end
