# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.new
user.first_name = 'alex'
user.email = 'agarzon@princeton.edu'
user.password = 'asdfasdf'
user.password_confirmation = 'asdfasdf'
user.admin = true
user.save!
#User.create(first_name: 'Alex', email:"asdf@asdf.adsf",  admin: true);

user = User.new
user.first_name = 'eddie'
user.email = 'yc4@princeton.edu'
user.password = 'asdfasdf'
user.password_confirmation = 'asdfasdf'
user.admin = false
user.save!

user = User.new
user.first_name = 'zhengyang'
user.email = 'zc2@princeton.edu'
user.password = 'asdfasdf'
user.password_confirmation = 'asdfasdf'
user.admin = false
user.save!

cat = Category.new
cat.name = 'Laundry'
cat.save!

cat = Category.new
cat.name = 'Food'
cat.save!

cat = Category.new
cat.name = '(Wo)Manpower'
cat.save!

cat = Category.new
cat.name = 'Misc'
cat.save!
