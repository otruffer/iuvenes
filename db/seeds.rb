# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ver = Verbindung.create({name: 'Bertholdia', ort: 'Burgdorf'})
User.new({cerevis: 'Pixel', name: 'Oskar Truffer', email:'oskar.truffer@gmail.com', admin: true, root: true, password: 'wdprl6', :password_confirmation => "111111", verbindung_id: ver.id }).save(:validate => false)
