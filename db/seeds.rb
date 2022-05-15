# flush datas
User.destroy_all
Option.destroy_all
Contract.destroy_all
Contract.destroy_all

# create user with role 'user'
user = User.create(email: 'user@example.com', password: 'fz8rrFUs3d@', password_confirmation: 'fz8rrFUs3d@', role: :user)
# create user with role 'admin'
admin = User.create(email: 'admin@example.com', password: 'fz8rrFUs3d@', password_confirmation: 'fz8rrFUs3d@', role: :admin)

# create options
Option.create(code: 'tout_risque', description: 'Formule tout risque')
Option.create(code: 'vol_uniquement', description: 'Option vol')
Option.create(code: 'incendie', description: 'Option incendie')
Option.create(code: 'degat_eau', description: 'Option dégâts des eaux')
Option.create(code: 'cambiolage', description: 'Option cambiolage')
Option.create(code: 'impaye', description: 'Option loyer impayé')
Option.create(code: 'degradation', description: 'Option dégradation')

# create contracts
contract1 = Contract.create(numero: '#00001', details: 'Lorem ipsum dolor...', options: Option.where(code: 'tout_risque'), amount: '1250.32')
contract2 = Contract.create(numero: '#00002', details: 'Lorem ipsum dolor...', options: Option.where(code: ['incendie', 'degradation', 'impaye']), amount: '960.23')
user.contracts << contract1
admin.contracts << contract2



