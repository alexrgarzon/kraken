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

task = Task.new
task.description= 'Seeking someone to pickup a pack of Claritin from CVS from me. Paying $10! I am desperate! Deliver to Spelman 66.'
task.title= 'Allergy Help'
task.user_id = '1'
task.payment_description= '$10.00'
task.runner_id = '0'
task.status = '0'
task.latitude = '40.348295'
task.longitude = '-74.6565931'
task.address= 'mccosh princeton'
task.category_id='4'
task.save!

task = Task.new
task.description= 'Please bring me the order under my name! To Frist 308 between 9:30-10:00pm!'
task.title= 'EPS corner takeout'
task.user_id = '1'
task.payment_description= '$6.00'
task.runner_id = '0'
task.status = '0'
task.latitude = '40.3521167'
task.longitude = '-74.6521813'
task.address= '238 Nassau St'
task.category_id='2'
task.save!

task = Task.new
task.description= 'Get my Ivy Crab Burger with extra anchovies on the side. Cup of tomatoe juice. Deliver to Dillon gym 10:30-11:00pm.'
task.title= 'Ivy Inn burger run'
task.user_id = '1'
task.payment_description= '$4.00'
task.runner_id = '0'
task.status = '0'
task.latitude = '40.3523672 '
task.longitude = '-74.6515505'
task.address= '248 Nassau St'
task.category_id='2'
task.save!

task = Task.new
task.description= 'Laundry is sitting outside Brown 502! Please have it washed, dried, folded, back at door in bag by tomorrow morning!'
task.title= 'Laundry By Tonight!'
task.user_id = '1'
task.payment_description= '$10.00'
task.runner_id = '0'
task.status = '0'
task.latitude = '40.346466'
task.longitude = '-74.6578891'
task.address= 'brown princeton'
task.category_id='1'
task.save!

task = Task.new
task.description= 'We need some buff guys to bring us some heavy props up from the UHaul outside into the 3rd floor theatre. 15mins expected. Not responsible for bodily injury.'
task.title= 'PCT Theatre Prop Moving'
task.user_id = '2'
task.payment_description= '$6.00'
task.runner_id = '0'
task.status = '0'
task.latitude = '40.3468512'
task.longitude = '-74.6552762'
task.address= 'frist campus center'
task.category_id='3'
task.save!

task = Task.new
task.description= '~20 Chinese tourists are coming. They need assistance and a knowledgable tour guide 1-3pm, $50 for your time.!'
task.title= 'Chinese Museum Tour Guide'
task.user_id = '1'
task.payment_description= '$50.00'
task.runner_id = '0'
task.status = '0'
task.latitude = '40.3471473'
task.longitude = '-74.6578299'
task.address= 'mccormick princeton'
task.category_id='4'
task.save!

task = Task.new
task.description= 'Please bring me a 20 pack of Welsh Fruit Snacks from Ustore to 210 Witherspoon Hall! I will be here all day today, Thursday!'
task.title= 'Ustore run'
task.user_id = '2'
task.payment_description= '$3.00'
task.runner_id = '0'
task.status = '0'
task.latitude = '40.3471419'
task.longitude = '-74.6615842'
task.address= 'university store princeton'
task.category_id='2'
task.save!

task = Task.new
task.description= 'Professional photographer for Fall 2015 Lawn Parties on Saturday 12-12:30pm, $30 for your time.'
task.title= 'Photographer'
task.user_id = '2'
task.payment_description= '$30.00'
task.runner_id = '0'
task.status = '0'
task.latitude = '40.3466258'
task.longitude = '-74.6564919'
task.address= 'prospect garden princeton'
task.category_id='3'
task.save!

task = Task.new
task.description= 'Please bring 3 rugby balls from dillon down to poe field. ASAP! Extra tip for speed!'
task.title= 'Rugby Balls Needed'
task.user_id = '1'
task.payment_description= '$6.00'
task.runner_id = '0'
task.status = '0'
task.latitude = '40.3433387'
task.longitude = '-74.6550335'
task.address= 'poe field princeton'
task.category_id='4'
task.save!


 