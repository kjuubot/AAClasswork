# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Todo.destroy_all

todo1 = Todo.create( title: 'shower the cats', body: 'on Sunday', done: true )
todo2 = Todo.create( title: 'dry the cats', body: 'on Wednesday', done: false )
todo3 = Todo.create( title: 'sleep in',  body: 'till 11am', done: false )