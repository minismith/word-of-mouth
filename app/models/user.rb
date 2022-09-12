class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :friendships, dependent: :destroy
  has_many :pending_friendships, -> { where confirmed: false }, class_name: 'Friendship', foreign_key: "friend_id"
  has_many :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :avatar

  validates :first_name, presence: true
  validates :last_name, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_first_and_last_name,
                  against: [ :first_name, :last_name],
                  using: {
                    tsearch: { prefix: true }
                  }



def friends
    friends_i_sent_invitation = Friendship.where(user_id: id, confirmed: true).pluck(:friend_id)
    friends_i_got_invitation = Friendship.where(friend_id: id, confirmed: true).pluck(:user_id)
    ids = friends_i_sent_invitation + friends_i_got_invitation
    User.where(id: ids)
end

  def friend_with?(user)
    Friendship.confirmed_record?(id, user.id)
  end

  def send_invitation(user)
    friendships.create(friend_id: user.id)
  end
end
