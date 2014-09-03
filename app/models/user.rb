class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :name
  validates :name, length: { minimum: 4, maximum: 12 }
  validates_uniqueness_of :name

  validates_presence_of :email
  validates_uniqueness_of :email
  validates :email, length: { minimum: 6, maximum: 32 }

end
