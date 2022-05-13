class Contract < ApplicationRecord
  enum status: [:pending, :active, :finished]
  has_and_belongs_to_many :options, dependent: :destroy
  has_and_belongs_to_many :users, dependent: :destroy


  validates [:numero, :status, :begin_date, :end_date], presence: true
end
