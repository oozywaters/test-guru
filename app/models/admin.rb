class Admin < User
  validates :firstname, :lastname, presence: true
end
