class User < ActiveRecord::Base

  has_many :sent_messages, foreign_key: :sender_id, class_name: "Message"
  has_many :received_messages, foreign_key: :recipient_id, class_name: "Message"
  belongs_to :group

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  before_save { self.email = email.downcase }
  before_save { self.points = 0 }

  before_create :create_remember_token

  validates :name, presence: true, length: { in: 4..20 },
            format: { with: /\A\w+/, message: " must be one word" },
            uniqueness: {case_sensitive: false }

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6, allow_nil: true } #allow nil for creating groups

  has_secure_password


  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

    private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end
