# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
Turtle.create [
    { :name => 'Bob', :description => 'A very lovely turtle, he likes to sing and eat tomatoes', :img_url => 'turtle1.jpg', :score => 10 },
    { :name => 'Pip', :description => 'A turtle with a sense of humor. However, don\'t make fun of his shell, it\'s a sensitive subject for him', :img_url => 'turtle2.jpg', :score => 15 },
              ]