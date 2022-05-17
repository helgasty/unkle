module ContractsHelper

  def format(contract)
    {
      id: contract.id,
      numero: contract.numero,
      details: contract.details,
      status: contract.status,
      begin_date: contract.begin_date,
      end_date: contract.end_date,
      subscriptions: contract.subscriptions.valid_subscriptions,
      users: contract.users,
      options: contract.options
    }
  end

  def format_collection(collection)
    result = []
    collection.each do |contract|
      result << format(contract)
    end

    result
  end
end
