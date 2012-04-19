class Contact < ActiveRecord::Base
	validates :name, :cellphone, :email, :presence => true
	validates_format_of     :email,
	                        :with       => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
	                        :message    => ' must be a valid E-mail'
end