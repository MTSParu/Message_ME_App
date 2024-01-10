class Message < ApplicationRecord
    belongs_to :user
    validates :body, presence: true
    has_many :messages

    has_many :participants, dependent: :destroy
  after_create_commit { broadcast_if_public }
  def broadcast_if_public
    broadcast_append_to "messages"
  end
end
