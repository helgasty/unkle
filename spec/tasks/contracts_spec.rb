require 'rails_helper'

Rails.application.load_tasks

describe "Update contracts status" do

  context "check update status ok" do

    it "it does foo behaviour" do
      Contract.delete_all
      contract1 = create(:contract, begin_date: Date.today + 1.day, end_date: nil)
      contract2 = create(:contract, begin_date: Date.today - 1.day, end_date: nil)
      contract3 = create(:contract, begin_date: Date.today, end_date: nil)
      contract4 = create(:contract, begin_date: Date.today - 20.days, end_date: Date.today - 1.day)
      contract5 = create(:contract, begin_date: Date.today - 20.days, end_date: Date.today)

      Rake::Task["contracts:update_status"].invoke

      expect(contract1.reload.status).to eq("pending")
      expect(contract2.reload.status).to eq("active")
      expect(contract3.reload.status).to eq("active")
      expect(contract4.reload.status).to eq("finished")
      expect(contract5.reload.status).to eq("active")
    end
  end
end