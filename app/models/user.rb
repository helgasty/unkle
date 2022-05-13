class User < ApplicationRecord
  devise :database_authenticatable

  enum role: { user: 0, admin: 1 }
end
