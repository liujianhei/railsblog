# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.new(name: "liujianhong", email: "jianheiliu@gmail.com", password: "123456", password_confirmation: "123456")
user.save
user = User.new(name: "admin", email: "admin", password: "123456", password_confirmation: "123456")
user.save
