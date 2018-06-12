class Micropost < ApplicationRecord
  belongs_to :user

  mount_uploader :picture, PictureUploader

  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.max_content}
  validate  :picture_size

  default_scope ->{order(created_at: :desc)}
  # scope :user_posts, ->(id){where "user_id = ?", id}
  scope :user_follow_posts, ->(following_ids, id){where("user_id IN (?) OR user_id = ?", following_ids, id)}

  private

  def picture_size
    return unless picture.size > Settings.img_size.megabytes
    errors.add :picture, I18n.t("microposts.size_notice")
  end
end
