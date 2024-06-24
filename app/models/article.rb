class Article < ApplicationRecord
  include Visible
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true, length: {minimum: 10}
  def after_create(article)
    MailJob.perform_async(article.id)
  end

  scope :created_after, ->(time) { where(created_at: time...)}
end
