class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :posts, dependent: :destroy
  has_many :courses, through: :posts
  has_many :messages, dependent: :destroy
  
  # has_many :sender_conversations, class_name: 'Conversation', foreign_key: 'sender_id'
  # has_many :recipient_conversations, class_name: 'Conversation', foreign_key: 'recipient_id'

  def conversations
    Conversation.where("sender_id = ? OR recipient_id = ?", id,id)
  end

end
