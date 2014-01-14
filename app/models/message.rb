class Message < ActiveRecord::Base
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  validates :body, presence: true, length: { maximum: 1000 }
  validates :recipient, presence: { message: "doesn't exist" }

end
