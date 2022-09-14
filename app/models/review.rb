class Review < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many_attached :photos
  belongs_to :user
  belongs_to :restaurant
  serialize :perfect_for, Array

  validates :title, presence: true
  validates :content, presence: true
  validates :emoji, presence: true

  EMOJIS = {'😍' => "amazing", '😊' => "nice", '😐' => "average", '😡' => "angry", '🤢' => "gross"}
  PERFECT_FOR = ["Date night", "Parents in town", "Boozing", "Friend catch-up", "Cheap eats", "Pay day", "Birthday dinner", "Group hang", "Wasting money", "Second date"]
end
