class Contact < ActiveRecord::Base
	validates :name, :cellphone, :email, :presence => true
end