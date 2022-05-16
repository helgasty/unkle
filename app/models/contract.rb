class Contract < ApplicationRecord
  enum status: %w(pending active finished)

  attr_accessor :users, :options
  has_and_belongs_to_many :options
  has_many :subscriptions
  has_many :users, through: :subscriptions

  validates :begin_date, presence: true
  validates :numero, uniqueness: true

  before_save :set_numero

  private

  def set_numero
    self.numero = "#" + SecureRandom.hex(2) if numero.blank?
  end
end
