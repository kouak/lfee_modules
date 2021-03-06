# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

puts "Création des secteurs ..."
["2F", "3E", "4R", "FIR", "3H", "4N"].each do |secteur|
  puts "#{secteur} ... Ok !" if Secteur.find_or_create_by_name(secteur)
end

puts "\nCréation des équipes ..."
(1..12).each do |equipe|
  puts "#{equipe} ... Ok !" if Equipe.find_or_create_by_equipe(equipe)
end

puts "\nCreation d'une promotion ..."
promo = Promotion.find_or_initialize_by_name('05D')
promo.affectation = Date.new(2007, 11, 21)
puts "Ok !" if promo.save!

puts "\nCreation des roles ..."
["Administrateur", "Utilisateur"].each do |r|
  puts "#{r} ... Ok !" if Role.find_or_create_by_name(r)
end

puts "\nCreation d'un utilisateur ..."
user = User.find_or_initialize_by_username('kouak')
user.nom = 'Beret'
user.prenom = 'Benjamin'
user.equipe = Equipe.find_by_equipe(11)
user.promotion = Promotion.find_by_name('05D')
user.email = "benjamin.beret@gmail.com"
user.password = "123456"
user.password_confirmation = user.password
user.role = Role.find_by_name('Administrateur')
puts "Ok !" if user.save!

puts "\nCreation d'un utilisateur ..."
user = User.find_or_initialize_by_username('SimpleUser')
user.nom = 'User'
user.prenom = 'Simple'
user.equipe = Equipe.find_by_equipe(3)
user.promotion = Promotion.find_by_name('05D')
user.email = "benjamin.beret0@gmail.com"
user.password = "123456"
user.password_confirmation = user.password
user.role = Role.find_by_name('Utilisateur')
puts "Ok !" if user.save!

puts "\nCreation d'utilisateurs multiples ..."
(1..10).each do |i|
  user = User.find_or_initialize_by_username("SimpleUser#{i}")
  user.nom = "User#{i}"
  user.prenom = 'Simple'
  user.equipe = Equipe.find_by_equipe(rand(12) + 1)
  user.promotion = Promotion.find_by_name('05D')
  user.email = "benjamin.beret#{i}@gmail.com"
  user.password = '123456'
  user.password_confirmation = user.password
  user.role = Role.find_by_name('Utilisateur')
  puts "#{i} Ok !" if user.save!
end