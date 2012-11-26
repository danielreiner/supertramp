# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'David', :email => 'cliffsworld@gmail.com', :password => '4x4ist8', :password_confirmation => '4x4ist8'
user.confirm!
puts 'New user created: ' << user.name
user.add_role :admin

puts 'SETTING UP SECOND DEFAULT USER LOGIN'
user = User.create! :name => 'Fabian', :email => 'f.trinler@googlemail.com', :password => '1x1ist2', :password_confirmation => '1x1ist2'
user.confirm!
puts 'New user created: ' << user.name
user.add_role :admin
