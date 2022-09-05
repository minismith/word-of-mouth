class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :reviewers, through: :reviews, source: :user

  validates :name, presence: true
  validates :address, presence: true
  validates :cuisine, presence: true
  validates :price, presence: true
end
