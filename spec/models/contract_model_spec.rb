require 'rails_helper'

RSpec.describe Contract, type: :model do

  context 'validations' do
    it 'check numero uniqueness' do
      create(:contract, numero: 'test1')
      contract2 = build(:contract, numero: 'test1')
      expect(contract2.valid?).to be(false)
    end

    it 'check begin_date presence' do
      contract = build(:contract, begin_date: nil)
      expect(contract.valid?).to be(false)
    end
  end

  context 'before save' do
    it 'check numero generate if not present' do
      contract = create(:contract, numero: nil)
      expect(contract.numero).not_to eq('')
    end
  end
end