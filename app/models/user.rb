class User < ApplicationRecord
  devise :database_authenticatable, :trackable

  has_many :subscriptions, dependent: :destroy
  has_many :contracts, through: :subscriptions

  enum role: %w(user admin)

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  before_save :set_password_confirmation

  def is_admin?
    self.role == 'admin'
  end

  private

  def set_password_confirmation
    self.password_confirmation = self.password
  end
end
