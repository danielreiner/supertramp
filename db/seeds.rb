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

puts 'SETTING UP THIRD NON ADMIN DEFAULT USER LOGIN'
user = User.create! :name => 'Tester', :email => 'diesagichnich@gmail.com', :password => 'test110', :password_confirmation => 'test110'
user.confirm!
puts 'New user created: ' << user.name

[
  {:title => "Metal Bands",  :user_id => 3},
  {:title => "Panzer",       :user_id => 3},
  {:title => "Flugzeuge",    :user_id => 1}
].each do |attributes|
  Theme.find_or_create_by_title(attributes)
end

[
  {:title => "Kiss",          :theme_id => 1,   :position => 1,   :user_id => 3},
  {:title => "Metallica",     :theme_id => 1,   :position => 2,   :user_id => 3},
  {:title => "Helmet",        :theme_id => 1,   :position => 3,   :user_id => 1},
  {:title => "ACDC",          :theme_id => 1,   :position => 4,   :user_id => 1},
  {:title => "Alice Cooper",  :theme_id => 1,   :position => 5,   :user_id => 1},
  {:title => "Iron Maiden",   :theme_id => 1,   :position => 6,   :user_id => 1},
  {:title => "Judas Priest",  :theme_id => 1,   :position => 7,   :user_id => 2},
  {:title => "Led Zeppelin",  :theme_id => 1,   :position => 8,   :user_id => 2},
  {:title => "Motorhead",     :theme_id => 1,   :position => 9,   :user_id => 2},
  {:title => "Slayer",        :theme_id => 1,   :position => 10,  :user_id => 2}
].each do |attributes|
  Card.find_or_create_by_title(attributes)
end

[
  {:title => "Alter",               :theme_id => 1,   :position => 1,   :user_id => 3},
  {:title => "tote Besucher",       :theme_id => 1,   :position => 2,   :user_id => 2},
  {:title => "Erfolg",              :theme_id => 1,   :position => 3,   :user_id => 1},
  {:title => "Wiedervereinigungen", :theme_id => 1,   :position => 4,   :user_id => 1},
  {:title => "Welttouneen",         :theme_id => 1,   :position => 5,   :user_id => 1}
].each do |attributes|
  Category.find_or_create_by_title(attributes)
end

[
  {:title => "62 Jahre",                  :theme_id => 1,   :card_id => 1,   :category_id => 1,   :position => 1,   :user_id => 3},
  {:title => "15",                        :theme_id => 1,   :card_id => 1,   :category_id => 2,   :position => 2,   :user_id => 2},
  {:title => "> 100 Mio verkaufte Alben", :theme_id => 1,   :card_id => 1,   :category_id => 3,   :position => 3,   :user_id => 1},
  {:title => "1",                         :theme_id => 1,   :card_id => 1,   :category_id => 4,   :position => 4,   :user_id => 1},
  {:title => "2,5",                       :theme_id => 1,   :card_id => 1,   :category_id => 5,   :position => 5,   :user_id => 1}
].each do |attributes|
  Content.find_or_create_by_title(attributes)
end

puts "Success: seed data loaded"
