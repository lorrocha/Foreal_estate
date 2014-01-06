class Owner < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_format_of :email, with: /\A[^@\.\s]+@[^@\.\s]+\.[a-zA-Z]+\z/
  has_many :buildings,
    inverse_of: :owner,
    dependent: :nullify
  def fullname
    "#{first_name} #{last_name}"
  end
end
