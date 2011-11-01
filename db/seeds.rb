# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: 'vmiklos', password: 'foo', email: 'vmiklos@vmiklos.hu')
User.create(username: 'akarki', password: 'akarmi', email: 'akarki@mail.bme.hu')

u = User.find_by_username 'akarki'

Todo.create(deadline: Time.now, todo: 'Fix bugs', done: false, user: u, public: true)
Todo.create(deadline: Time.now, todo: 'Read RSS', done: false, user: u, public: true)
