class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :comments, dependent: :destroy
  serialize :perfect_for, Array

  # acts_as_favoritable

  validates :title, presence: true
  validates :content, presence: true
  validates :emoji, presence: true

  EMOJIS = {'😍' => "amazing", '😊' => "nice", '😐' => "average", '😡' => "angry", '🤢' => "gross"}
  PERFECT_FOR = ["Date night", "Parents in town", "Boozing", "Friend catch-up", "Cheap eats", "Pay day", "Birthday dinner", "Group hang", "Wasting money", "Second date"]
end
