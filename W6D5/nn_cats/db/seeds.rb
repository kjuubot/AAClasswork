# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.delete_all

cat1 = Cat.create([{ name: 'Carlos', birth_date: '2000/01/01', color: 'orange', sex: 'M', description: 'stretchycat'}])
cat2 = Cat.create([{ name: 'Minou', birth_date: '2015/07/01', color: 'black', sex: 'F', description: 'sweet and lazy'}])
cat3 = Cat.create([{ name: 'Jeffrey', birth_date: '2014/10/22', color: 'grey', sex: 'M', description: 'loves to eat' }])