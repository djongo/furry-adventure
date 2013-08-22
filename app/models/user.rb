class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  attr_accessible :email, :password, :password_confirmation, :name, :hbsc_member, :roles

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0 "} }


  # new roles MUST be added to the end of the array since it is a bit mask
  ROLES = %w[publication_group author]

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end
  
  def role_symbols
    roles.map(&:to_sym)
  end 
end
