namespace :contracts do
  desc "Update contracts status"
  task update_status: :environment do
    # Get all contracts
    contracts = Contract.all

    contracts.each do |contract|
      if (contract.begin_date <= Date.today) && (contract.end_date.nil? || contract.end_date >= Date.today)
        contract.update(status: :active)
      elsif contract.end_date.present? && contract.end_date < Date.today
        contract.update(status: :finished)

        # end all contracts subscriptions
        contract.subscriptions.update_all(end_subscription_at: Date.today)
      else
        contract.update(status: :pending)
      end
    end
  end
end
