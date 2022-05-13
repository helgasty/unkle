# create user with role 'user'
User.create(email: 'user@example.com', password: 'fz8rrFUs3d@', password_confirmation: 'fz8rrFUs3d@', role: :user)
# create user with role 'admin'
User.create(email: 'admin@example.com', password: 'fz8rrFUs3d@', password_confirmation: 'fz8rrFUs3d@', role: :admin)

# create options
Option.create(code: 'tout_risque', description: 'Formule tout risque')
Option.create(code: 'vol_uniquement', description: 'Option vol')
Option.create(code: 'incendie', description: 'Option incendie')
Option.create(code: 'degat_eau', description: 'Option dégâts des eaux')
Option.create(code: 'cambiolage', description: 'Option cambiolage')
Option.create(code: 'impaye', description: 'Option loyer impayé')
Option.create(code: 'degradation', description: 'Option dégradation')