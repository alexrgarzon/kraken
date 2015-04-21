# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.new
user.first_name = 'asdf'
user.email = 'asdf@asdf.asdf'
user.password = 'asdfasdf'
user.password_confirmation = 'asdfasdf'
user.admin = true
user.save!
#User.create(first_name: 'Alex', email:"asdf@asdf.adsf",  admin: true);

user = User.new
user.first_name = 'aaa'
user.email = 'a@a.a'
user.password = 'asdfasdf'
user.password_confirmation = 'asdfasdf'
user.admin = false
user.save!

user = User.new
user.first_name = 'bbb'
user.email = 'b@b.b'
user.password = 'asdfasdf'
user.password_confirmation = 'asdfasdf'
user.admin = false
user.save!