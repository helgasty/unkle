class User < ApplicationRecord
  devise :database_authenticatable

  has_and_belongs_to_many :contracts
  enum role: [:user, :admin]
end
