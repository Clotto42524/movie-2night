# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning DB"

Event.destroy_all

puts "adding events"

Event.create(name: "2nite's party", address: "Hauptbahnhof", user: User.first)
Event.create(name: "2morrow's party", address: "Ostbahnhof", user: User.first)
Event.create(name: "3nite's party", address: "Nordbahnhof", user: User.last)
Event.create(name: "3morrow's party", address: "Südbahnhof", user: User.last)

puts "done!"


puts "Cleaning DB"

Invitation.destroy_all

puts "adding invitations"

Invitation.create(event: Event.first, user: User.last)
Invitation.create(event: Event.last, user: User.first)

Movie.create(title: "Something", overview: "Something longer", release_date: "1994")


SelectedMovie.create(event: Event.first, movie: Movie.first)

puts "done!"
