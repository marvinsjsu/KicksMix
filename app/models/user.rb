# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  username               :string(255)      not null
#  email                  :string(255)      not null
#  session_token          :string(255)      not null
#  password_digest        :string(255)      not null
#  created_at             :datetime
#  updated_at             :datetime
#  photo_url_file_name    :string(255)
#  photo_url_content_type :string(255)
#  photo_url_file_size    :integer
#  photo_url_updated_at   :datetime
#  description            :text
#  photo_url              :string(255)
#  role                   :string(255)      default("user")
#

class User < ActiveRecord::Base
  attr_reader :password, :role

  has_attached_file :photo_url, :styles => {
    :big => "600x600>",
    :small => "50x50#"
  }

  validates_attachment :photo_url, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  has_many :shoes, class_name: 'Shoe', foreign_key: :author_id, primary_key: :id
  has_many :comments, :as => :commentable
  has_many :my_comments, class_name: "Comment", foreign_key: :comments_by, primary_key: :id


  validates :username, :email, :session_token, :password_digest, presence: true
  validates :username, :email, :session_token, uniqueness: true
  validates :password, length: { minimum: 6 }, on: :create

  before_validation :ensure_session_token

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
