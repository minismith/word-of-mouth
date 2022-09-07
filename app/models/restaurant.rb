class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :reviewers, through: :reviews, source: :user

  validates :name, presence: true
  validates :address, presence: true
  validates :cuisine, presence: true
  validates :price, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_name_and_address,
                  against: [ :name, :address ],
                  using: {
                    tsearch: { prefix: true }
                  }
end
