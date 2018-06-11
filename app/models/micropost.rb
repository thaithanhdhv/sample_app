class Micropost < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.max_content}
  validate  :picture_size

  default_scope ->{order(created_at: :desc)}
  scope :user_posts, ->(id){where "user_id = ?", id}

  private

  def picture_size
    return unless picture.size > Settings.img_size.megabytes
    errors.add :picture, I18n.t("microposts.size_notice")
  end
end
