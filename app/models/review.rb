class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
  validates :emoji, presence: true

  EMOJIS = {'😍' => "amazing", '😊' => "nice", '😐' => "average", '😡' => "angry", '🤢' => "gross"}
end
