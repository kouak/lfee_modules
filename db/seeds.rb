# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

puts "Création des secteurs ..."
["2F", "3E", "4R", "FIR", "3H", "4N"].each do |secteur|
  puts "#{secteur} ..."
  Secteur.find_or_create_by_name(secteur)
end
puts "Ok !"

puts "Création des équipes ..."
(1..12).each do |equipe|
  puts "#{equipe} ..."
  Equipe.find_or_create_by_equipe(equipe)
end
puts "Ok !"