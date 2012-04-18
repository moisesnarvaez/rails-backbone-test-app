# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Contact.create(:name => 'Moises', :lastname => 'Narvaez', :cellphone => '3012585860', :email => 'moises.narvaez@koombea.com')
Contact.create(:name => 'Natalia', :lastname => 'Franco', :cellphone => '3120438928', :email => 'natalia.franco@koombea.com')