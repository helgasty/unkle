class Contract < ApplicationRecord
  enum status: %w(pending active finished)

  has_and_belongs_to_many :options, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions

  validates :begin_date, presence: true
  validates :numero, uniqueness: true

  before_save :check_numero

  private

  def check_numero
    self.numero = "#" + SecureRandom.hex(2) if numero.blank?
  end
end
