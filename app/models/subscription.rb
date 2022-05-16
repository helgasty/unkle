class Subscription < ApplicationRecord
  belongs_to :contract
  belongs_to :user

  scope :valid_subscriptions, -> { where("end_subscription_at is null OR end_subscription_at > #{Date.today}") }
  validate :validate_subscription_date

  private

  def validate_subscription_date
    if end_subscription_at.present? && end_subscription_at < subscribed_at
      errors.add('vadidate_subscription_date', I18n.t('api.subscriptions.unsubscribe.date_error'))
    end
  end
end
