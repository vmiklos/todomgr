# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: 'vmiklos', password: 'foo', email: 'vmiklos@vmiklos.hu')
User.create(username: 'akarki', password: 'akarmi', email: 'akarki@mail.bme.hu')

u = User.find_by_username 'vmiklos'

month = 60*60*24*30

Todo.create(deadline: Time.now-(month*3)-1, todo: 'Download ruby book', done: true, user: u, public: true)
Todo.create(deadline: Time.now-(month*3), todo: 'Write slides', done: false, user: u, public: true)
Todo.create(deadline: Time.now-(month*2)-1, todo: 'Upgrade RSS reader', done: true, user: u, public: true)
Todo.create(deadline: Time.now-(month*2), todo: 'Read index', done: false, user: u, public: true)
Todo.create(deadline: Time.now-(month*1)-2, todo: 'Ride the bycicle', done: false, user: u, public: true)
Todo.create(deadline: Time.now-(month*1)-1, todo: 'Fix bugs', done: true, user: u, public: true)
Todo.create(deadline: Time.now-(month*1), todo: 'Take out the dog', done: false, user: u, public: true)


Todo.create(deadline: Time.now+(month*1), todo: 'Shopping', done: false, user: u, public: true)
Todo.create(deadline: Time.now+(month*1)+1, todo: 'Write specification', done: true, user: u, public: true)
Todo.create(deadline: Time.now+(month*1)+2, todo: 'Make some phone call', done: false, user: u, public: true)
Todo.create(deadline: Time.now+(month*2), todo: 'Arrange hotel reservation', done: false, user: u, public: true)
Todo.create(deadline: Time.now+(month*2)+1, todo: 'Buy cinema tickets', done: true, user: u, public: true)
Todo.create(deadline: Time.now+(month*3), todo: 'Attend ruby course', done: false, user: u, public: true)
Todo.create(deadline: Time.now+(month*3)+1, todo: 'Do the wasing up', done: true, user: u, public: true)
