# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'nokogiri'

# puts 'Creating recipes...'
# Recipe.create!({
#   title: "Tacos",
#   description: "Un taco est un antojito de la cuisine mexicaine qui se compose d'une tortilla de maïs repliée ou enroulée sur elle-même contenant presque toujours une garniture le plus souvent à base de viande, de sauce, d'oignon et de coriandre fraiche hachée",
#   number_of_persons: 6,
#   difficulty: "facile",
#   cost: "éco",
#   preparation: "Etape 1
# A la poêle, faire dorer l'oignon émincé dans un peu d'huile d'olive.
# Etape 2
# Rajouter la viande, assaisonner et laisser cuire 5 min.
# Etape 3
# Laver les feuilles de laitue.
# Etape 4
# Couper les tomates et le poivron en petits dés.
# Etape 5
# Incorporer le tout à la poêlée avec le coulis de tomate, et poursuivre la cuisson pendant 5 min.
# Etape 6
# Egoutter les haricots rouges et les ajouter 2 min avant la fin de cuisson.
# Etape 7
# Hors du feu, ajuster l'assaisonnement et saupoudrer généreusement de cumin; on peut aussi rajouter quelques gouttes de Tabasco.
# Etape 8
# Garnir les tortillas de préparation et les refermer en les roulant comme des crêpes. Disposer 1 feuille de laitue sur chaque tacos avant de servir.",
#   total_time: "00:20",
#   season: "été",
#   ustensils: "1 poêle, 1 pinceau, 1 couteau"
# })
# Recipe.create!({
#   title: "Guacamole",
#   description: "Le guacamole est une préparation culinaire d'origine mexicaine faite à base d’avocat, de piment frais, de coriandre fraîche, d'oignons, de tomates, de jus de lime ou de citron, de sel et de poivre",
#   number_of_persons: 5,
#   difficulty: "facile",
#   cost: "éco",
#   preparation: "Etape 1
# Pelez les avocats, puis réduisez-les en purée.
# Etape 2
# Hachez l'oignon et les piments. Mélangez la purée avec l'oignon et les piments, en ajoutant une pincée de sel.",
#   total_time: "00:10",
#   season: "été",
#   ustensils: "1 saladier
# })
# puts 'Finished!'

puts "Cleaning the DB..."

User.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
Dose.destroy_all
Like.destroy_all

puts "Database cleaned !"

puts "Creating user"
u1 = User.create!({
  email: "contact@mathilderobert.com",
  prenom: "Mathilde",
  nom: "Robert",
  surnom: "Titilde",
  password: "5656vbui",
  admin: true
})

puts "Creating recipes..."
r1 = Recipe.create({
  title: "Tacos de pollo pibil",
  description: "Blancs de volaille marinés à la sauce pibil servi sur une tortilla de maïs.",
  difficulty: "facile",
  number_of_persons: 3,
  cost: "€",
  season: "Été",
  ustensils: "1 couteau, 1 poêle",
  total_time: "2000-01-01 00:40:00",
  kitchen_type: "Mexicain",
  step1: "Préchauffer le four à 240°. Presser le jus de l'orange, le citron vert et le pamplemousse et mixer avec le laurier, l'origan, le roucou, le vinaigre balsamique blanc, la cannelle, le cumin et le demi oignon.
Mariner la viande. Griller les feuilles de bananier des deux côtés pour les assouplir.
Disposer les feuilles dans un plat de cuisson et ajouter les suprêmes de volaille. Fermer les feuilles et arroser avec un filet d'huile pour éviter le dessèchement, couvrir d'aluminium.
et enfourner pendant 25 min.",
  step2: "Presser le jus du citron vert, mélanger avec le vinaigre d'alcool, l'eau, le sel et l'origan. Émincer les oignons et les plonger dans la marinade obtenue.",
  step3: "Mélanger la farine de maïs avec le sel et l'eau et malaxer. A l'aide d'un rouleau pâtissier, étaler la pâte entre deux feuilles de papier sulfurisé d'une épaississeur de 3mm ou utiliser la presse à tortilla. Découper des cercles avec un emporte pièce ronde et cuire la tortilla dans une poêle antiadhésive, tourner de temps en temps pour que la pâte cuise."
})
photo_tacos = URI.open("https://source.unsplash.com/JiRSy0GfqPA")
r1.photos.attach(io: photo_tacos, filename: 'photo_tacos.jpg', content_type: 'image/jpg')
photo_tacos2 = URI.open("https://source.unsplash.com/ZQf4jzkpz1k")
r1.photos.attach(io: photo_tacos2, filename: 'photo_tacos2.jpg', content_type: 'image/jpg')
r1.user = u1
r1.save!
r2 = Recipe.create({
  title: "Salade de poulpe aux poivrons et citrons confits",
  description: "Une belle salade de poulpe fraiche aux poivrons et citron confits. La poulpe est d'abord cuit dans du vin blanc et refroidi avant d'être agrémenter des légumes du soleil et d'une sauce pesto de verts de cébettes.",
  difficulty: "moyen",
  number_of_persons: 5,
  cost: "€€",
  season: "Été",
  ustensils: "planche, couteau, grande casserole, robot, poêle",
  total_time: "2000-01-01 00:30:00",
  kitchen_type: "Mexicain",
  step1: "Nettoyer le poulpe, enlever le bec et bien rincer. Le sécher et le placer dans un plat. Le congéler pendant au moins 6 heures pour l'attendrir.
Le sortir du congélateur une heure avant cuisson.
Laver et sécher la carotte et poireau. Laver et zester le citron. Eplucher et émincer l'oignon. Emincer le blanc de poireau et la carotte. Ecraser la gusse d'ail en chemise.
Chauffer l'huile d'olive dans une cocotte et faire revenir le poulpe 2 minutes. Saler. Ajouter l'oignon, cuire sans coloration et ajouter la carotte, poireau et gousse d'ail, le zeste de citron et le thym. Bien mélanger. Mouiller avec le vin blanc, porter à ébullution, baisser et cuire à frémissement 30 minutes. Laisser refroidir le poulpe dans la cuisson et réserver.",
  step2: "Eplucher les poivrons et les tailler en julienne.
Laver les cives, séparer le vert et tailler le blanc en biseaux.
Tailler le citron confit en quartiers, enlever le coeur et tailler la peau en julienne. Tailler les tomates confites en julienne.
Chauffer un peu d'huile d'olive dans une poêle et faire sauter les poivrons quelques minutes. Saler, poivrer. Débarrasser.",
  step3: "Mixer le vert des cives, le persil et l'huile d'olive au blender. Réserver.",
  step4: "Récuperer le poulpe refroidi.
Séparer la tête des tentacules. Tailler les tentacules en fines tranches, réserver la tête pour une autre utilisation.
Dans un saladier, melanger le poulpe, les poivrons, le citron et tomates confites. Assaisonner, bien mélanger et réserver au frais."
})
photo_poulpe = URI.open("https://source.unsplash.com/8YhMxwhuyQM")
r2.photos.attach(io: photo_poulpe, filename: 'photo_poulpe.jpg', content_type: 'image/jpg')
photo_poulpe2 = URI.open("https://source.unsplash.com/LxC1Qx1qulc")
r2.photos.attach(io: photo_poulpe2, filename: 'photo_poulpe2.jpg', content_type: 'image/jpg')
r2.user = u1
r2.save!
r3 = Recipe.create({
  title: "Pot-au-feu",
  description: "Le pot-au-feu est une recette de cuisine traditionnelle emblématique historique de la cuisine française, et du repas gastronomique des Français, à base de viande de bœuf cuisant longuement à feu très doux dans un bouillon de légumes.",
  difficulty: "moyen",
  number_of_persons: 6,
  cost: "€€",
  season: "Hiver",
  ustensils: "Un four, un écumoire, une casserole, une louche",
  total_time: "2000-01-01 04:30:00",
  kitchen_type: "Français",
  step1: "Ficelez les morceaux de viande pour qu'ils se maintiennent en forme pendant la cuisson et, s'il y en a, coupez la queue de boeuf en tronçons.",
  step2: "Épluchez les carottes, les poireaux et la branche de céleri, puis lavez-les.",
  step3: "Piquez un oignon avec les clous de girofle et faites dorer le second, à sec, au four : il colorera le bouillon (pour colorer le bouillon, ajouter 1/2 cuillerée à café d’arôme Patrelle).",
  step4: "Mettez dans un faitout tous les morceaux de viande et l’os à moelle, préalablement enveloppé dans une mousseline pour éviter que la moelle ne se répande. Mouillez avec 5 litres d'eau froide.",
  step5: "Salez au gros sel. Portez à ébullition et laissez bouillir, en ayant soin d'écumer souvent, jusqu'à ce qu'il ne se forme plus d'écume.",
  step6: "Ajoutez-y les oignons, les carottes, les poireaux (liés en botte), le céleri branche, l’ail et le bouquet garni, préalablement ficelé. Ajoutez 12 grains de poivre.",
  step7: "Portez de nouveau à ébullition, puis laissez cuire, à couvert (la vapeur doit pouvoir s'échapper sur le côté), sur feu très doux, pendant au moins 4 heures.",
  step8: "Dégraisser en cours de cuisson avec une petite louche.",
  step9: "Le bouillon du pot-au-feu se consomme chaud ou tiède, en précédant les viandes et les légumes ou seul. Il peut aussi être la base de divers potages.",
  step10: "Quant aux morceaux de viande et aux légumes, retirez-les du bouillon et dressez-les dans un plat chaud. Servez-les aussitôt, avec des cornichons, du gros sel et de la moutarde forte."
})
photo_pot = URI.open("https://source.unsplash.com/498g2U3_n_U")
r3.photos.attach(io: photo_pot, filename: 'photo_pot.jpg', content_type: 'image/jpg')
photo_pot2 = URI.open("https://source.unsplash.com/FoHTUTU8SzE")
r3.photos.attach(io: photo_pot2, filename: 'photo_pot2.jpg', content_type: 'image/jpg')
r3.user = u1
r3.save!
r4 = Recipe.create({
  title: "Risotto au vin blanc",
  description: "Le risotto est une réduction d'un bouillon de riz cuit avec divers ingrédients. On lui donne généralement comme origine le nord de l'Italie.",
  difficulty: "moyen",
  number_of_persons: 3,
  cost: "€",
  season: "Automne",
  ustensils: "Un four, un écumoire, une casserole, une louche",
  total_time: "2000-01-01 00:35:00",
  kitchen_type: "Italien",
  step1: "Dans une poêle, faites chauffer un filet d'huile d'olive. Pendant ce temps, émincez votre oignon et faites-le revenir quelques minutes quand la poêle est chaude. Baissez à feu moyen.",
  step2: "Une fois les oignons caramélisés ajoutez le riz et mélangez jusqu'à ce qu'il devienne translucide. ",
  step3: "Versez la moitié du vin blanc sur le riz et tournez-le jusqu'à ce qu'il soit absorbé. ",
  step4: "Une fois que le vin a été absorbé, ajoutez la dernière moitié et mélangez à nouveau jusqu'à totale absorption.",
  step5: "Versez du bouillon jusqu'à ce que le risotto devienne crémeux. Comptez une vingtaine de minutes environ. ",
  step6: "Assaisonnez avec le sel et le poivre et ajoutez le parmesan râpé."
  })
photo_risotto = URI.open("https://source.unsplash.com/qIPRTMulc-g")
r4.photos.attach(io: photo_risotto, filename: 'photo_risotto.jpg', content_type: 'image/jpg')
photo_risotto2 = URI.open("https://source.unsplash.com/luTXE_Rj1dY")
r4.photos.attach(io: photo_risotto2, filename: 'photo_risotto2.jpg', content_type: 'image/jpg')
r4.user = u1
r4.save!

puts "Creating ingredients for a page 1..."
  url = "https://www.marmiton.org/recettes/index/ingredient"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished a page 1!"

puts "Creating ingredients for a page 2..."
  url = "https://www.marmiton.org/recettes/index/ingredient/2"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished a page 2!"

puts "Creating ingredients for a page 3..."
  url = "https://www.marmiton.org/recettes/index/ingredient/3"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished a page 3!"

puts "Creating ingredients for a page 4..."
  url = "https://www.marmiton.org/recettes/index/ingredient/4"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished a page 4!"

puts "Creating ingredients for b page 1..."
  url = "https://www.marmiton.org/recettes/index/ingredient/b"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished b page 1!"

puts "Creating ingredients for b page 2..."
  url = "https://www.marmiton.org/recettes/index/ingredient/b/2"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished b page 2!"

puts "Creating ingredients for b page 3..."
  url = "https://www.marmiton.org/recettes/index/ingredient/b/3"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished b page 3!"

puts "Creating ingredients for b page 4..."
  url = "https://www.marmiton.org/recettes/index/ingredient/b/4"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished b page 4!"

puts "Creating ingredients for b page 5..."
  url = "https://www.marmiton.org/recettes/index/ingredient/b/5"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished b page 5!"

puts "Creating ingredients for b page 6..."
  url = "https://www.marmiton.org/recettes/index/ingredient/b/6"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished b page 6!"

puts "Creating ingredients for c page 1..."
  url = "https://www.marmiton.org/recettes/index/ingredient/c/1"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished c page 1!"

puts "Creating ingredients for c page 2..."
  url = "https://www.marmiton.org/recettes/index/ingredient/c/2"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished c page 2!"

puts "Creating ingredients for c page 3..."
  url = "https://www.marmiton.org/recettes/index/ingredient/c/3"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished c page 3!"

puts "Creating ingredients for c page 4..."
  url = "https://www.marmiton.org/recettes/index/ingredient/c/4"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished c page 4!"

puts "Creating ingredients for c page 5..."
  url = "https://www.marmiton.org/recettes/index/ingredient/c/5"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished c page 5!"

puts "Creating ingredients for c page 6..."
  url = "https://www.marmiton.org/recettes/index/ingredient/c/6"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished c page 6!"

puts "Creating ingredients for c page 7..."
  url = "https://www.marmiton.org/recettes/index/ingredient/c/7"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished c page 7!"

puts "Creating ingredients for c page 8..."
  url = "https://www.marmiton.org/recettes/index/ingredient/c/8"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished c page 8!"

puts "Creating ingredients for c page 9..."
  url = "https://www.marmiton.org/recettes/index/ingredient/c/9"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished c page 9!"

puts "Creating ingredients for c page 10..."
  url = "https://www.marmiton.org/recettes/index/ingredient/c/10"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished c page 10!"

puts "Creating ingredients for c page 11..."
  url = "https://www.marmiton.org/recettes/index/ingredient/c/11"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished c page 11!"

puts "Creating ingredients for c page 12..."
  url = "https://www.marmiton.org/recettes/index/ingredient/c/12"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished c page 12!"

puts "Creating ingredients for d page 1..."
  url = "https://www.marmiton.org/recettes/index/ingredient/d/"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished d page 1!"

puts "Creating ingredients for e page 1..."
  url = "https://www.marmiton.org/recettes/index/ingredient/e/"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished e page 1!"

puts "Creating ingredients for e page 2..."
  url = "https://www.marmiton.org/recettes/index/ingredient/e/2"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished e page 2!"

puts "Creating ingredients for e page 3..."
  url = "https://www.marmiton.org/recettes/index/ingredient/e/3"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished e page 3!"

puts "Creating ingredients for f page 1..."
  url = "https://www.marmiton.org/recettes/index/ingredient/f/"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished f page 1!"


puts "Creating ingredients for f page 2..."
  url = "https://www.marmiton.org/recettes/index/ingredient/f/2"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished f page 2!"


puts "Creating ingredients for f page 3..."
  url = "https://www.marmiton.org/recettes/index/ingredient/f/3"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished f page 3!"


puts "Creating ingredients for f page 4..."
  url = "https://www.marmiton.org/recettes/index/ingredient/f/4"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished f page 4!"


puts "Creating ingredients for f page 5..."
  url = "https://www.marmiton.org/recettes/index/ingredient/f/5"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished f page 5!"

puts "Creating ingredients for g page 1..."
  url = "https://www.marmiton.org/recettes/index/ingredient/g"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished g page 1!"

puts "Creating ingredients for g page 2..."
  url = "https://www.marmiton.org/recettes/index/ingredient/g/2"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished g page 2!"

puts "Creating ingredients for g page 3..."
  url = "https://www.marmiton.org/recettes/index/ingredient/g/3"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished g page 3!"

puts "Creating ingredients for g page 4..."
  url = "https://www.marmiton.org/recettes/index/ingredient/g/4"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished g page 4!"

puts "Creating ingredients for g page 5..."
  url = "https://www.marmiton.org/recettes/index/ingredient/g/5"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished g page 5!"

puts "Creating ingredients for h page 1..."
  url = "https://www.marmiton.org/recettes/index/ingredient/h"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished h page 1!"

puts "Creating ingredients for h page 2..."
  url = "https://www.marmiton.org/recettes/index/ingredient/h/2"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished h page 2!"

puts "Creating ingredients for i page 1..."
  url = "https://www.marmiton.org/recettes/index/ingredient/i"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished i page 1!"

puts "Creating ingredients for j page 1..."
  url = "https://www.marmiton.org/recettes/index/ingredient/j"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished j page 1!"

puts "Creating ingredients for j page 2..."
  url = "https://www.marmiton.org/recettes/index/ingredient/j/2"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished j page 2!"

puts "Creating ingredients for k page 1..."
  url = "https://www.marmiton.org/recettes/index/ingredient/k"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished k page 1!"

puts "Creating ingredients for l page 1..."
  url = "https://www.marmiton.org/recettes/index/ingredient/l/1"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished l page 1!"

puts "Creating ingredients for l page 2..."
  url = "https://www.marmiton.org/recettes/index/ingredient/l/2"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished l page 2!"

puts "Creating ingredients for l page 3..."
  url = "https://www.marmiton.org/recettes/index/ingredient/l/3"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished l page 3!"

puts "Creating ingredients for m page 1..."
  url = "https://www.marmiton.org/recettes/index/ingredient/m/1"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished m page 1!"

puts "Creating ingredients for m page 2..."
  url = "https://www.marmiton.org/recettes/index/ingredient/m/2"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished m page 2!"

puts "Creating ingredients for m page 3..."
  url = "https://www.marmiton.org/recettes/index/ingredient/m/3"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished m page 3!"

puts "Creating ingredients for m page 4..."
  url = "https://www.marmiton.org/recettes/index/ingredient/m/4"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished m page 4!"

puts "Creating ingredients for m page 5..."
  url = "https://www.marmiton.org/recettes/index/ingredient/m/5"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished m page 5!"

puts "Creating ingredients for m page 6..."
  url = "https://www.marmiton.org/recettes/index/ingredient/m/6"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished m page 6!"

puts "Creating ingredients for n page 1..."
  url = "https://www.marmiton.org/recettes/index/ingredient/n/"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished n page 1!"

puts "Creating ingredients for n page 2..."
  url = "https://www.marmiton.org/recettes/index/ingredient/n/2"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished n page 2!"

puts "Creating ingredients for o page 1..."
  url = "https://www.marmiton.org/recettes/index/ingredient/o"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished o page 1!"

puts "Creating ingredients for o page 2..."
  url = "https://www.marmiton.org/recettes/index/ingredient/o/2"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished o page 2!"

puts "Creating ingredients for p page 1..."
  url = "https://www.marmiton.org/recettes/index/ingredient/p"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished p page 1!"

puts "Creating ingredients for p page 2..."
  url = "https://www.marmiton.org/recettes/index/ingredient/p/2"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished p page 2!"

puts "Creating ingredients for p page 3..."
  url = "https://www.marmiton.org/recettes/index/ingredient/p/3"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished p page 3!"

puts "Creating ingredients for p page 4..."
  url = "https://www.marmiton.org/recettes/index/ingredient/p/4"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished p page 4!"

puts "Creating ingredients for p page 5..."
  url = "https://www.marmiton.org/recettes/index/ingredient/p/5"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished p page 5!"

puts "Creating ingredients for p page 6..."
  url = "https://www.marmiton.org/recettes/index/ingredient/p/6"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished p page 6!"

puts "Creating ingredients for p page 7..."
  url = "https://www.marmiton.org/recettes/index/ingredient/p/7"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished p page 7!"

puts "Creating ingredients for p page 8..."
  url = "https://www.marmiton.org/recettes/index/ingredient/p/8"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished p page 8!"

puts "Creating ingredients for p page 9..."
  url = "https://www.marmiton.org/recettes/index/ingredient/p/9"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished p page 9!"

puts "Creating ingredients for p page 10..."
  url = "https://www.marmiton.org/recettes/index/ingredient/p/10"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished p page 10!"

puts "Creating ingredients for q page 1..."
  url = "https://www.marmiton.org/recettes/index/ingredient/q/"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished q page 1!"

puts "Creating ingredients for r page 1..."
  url = "https://www.marmiton.org/recettes/index/ingredient/r/"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished r page 1!"

puts "Creating ingredients for r page 2..."
  url = "https://www.marmiton.org/recettes/index/ingredient/r/2"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished r page 2!"

puts "Creating ingredients for r page 3..."
  url = "https://www.marmiton.org/recettes/index/ingredient/r/3"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished r page 3!"

puts "Creating ingredients for s page 1..."
  url = "https://www.marmiton.org/recettes/index/ingredient/s/1"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished s page 1!"

puts "Creating ingredients for s page 2..."
  url = "https://www.marmiton.org/recettes/index/ingredient/s/2"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished s page 2!"

puts "Creating ingredients for s page 3..."
  url = "https://www.marmiton.org/recettes/index/ingredient/s/3"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished s page 3!"

puts "Creating ingredients for s page 4..."
  url = "https://www.marmiton.org/recettes/index/ingredient/s/4"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished s page 4!"

puts "Creating ingredients for s page 5..."
  url = "https://www.marmiton.org/recettes/index/ingredient/s/5"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished s page 5!"

puts "Creating ingredients for s page 6..."
  url = "https://www.marmiton.org/recettes/index/ingredient/s/6"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished s page 6!"

puts "Creating ingredients for s page 7..."
  url = "https://www.marmiton.org/recettes/index/ingredient/s/7"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished s page 7!"

puts "Creating ingredients for s page 8..."
  url = "https://www.marmiton.org/recettes/index/ingredient/s/8"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished s page 8!"

puts "Creating ingredients for t page 1..."
  url = "https://www.marmiton.org/recettes/index/ingredient/t"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished t page 1!"

puts "Creating ingredients for t page 2..."
  url = "https://www.marmiton.org/recettes/index/ingredient/t/2"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished t page 2!"

puts "Creating ingredients for t page 3..."
  url = "https://www.marmiton.org/recettes/index/ingredient/t/3"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished t page 3!"

puts "Creating ingredients for v page 1..."
  url = "https://www.marmiton.org/recettes/index/ingredient/v"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished v page 1!"

puts "Creating ingredients for v page 2..."
  url = "https://www.marmiton.org/recettes/index/ingredient/v/2"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished v page 2!"


puts "Creating ingredients for w page 1..."
  url = "https://www.marmiton.org/recettes/index/ingredient/w"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished w page 1!"

puts "Creating ingredients for x page 1..."
  url = "https://www.marmiton.org/recettes/index/ingredient/x"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished x page 1!"

puts "Creating ingredients for y page 1..."
  url = "https://www.marmiton.org/recettes/index/ingredient/y"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished y page 1!"

puts "Creating ingredients for z page 1..."
  url = "https://www.marmiton.org/recettes/index/ingredient/z"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.index-item-card-name').each do |element|
    name = element.text.strip
    ingredient = Ingredient.new(name: name)
    ingredient.save!
  end
puts "Finished z page 1!"

