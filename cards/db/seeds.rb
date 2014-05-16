# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

starting = Deck.create(name: "starting", deck_type: "player")
starting.cards.create(card_type: "equipment", effect: "movement", modifier: "1", flavor_text: "starting engine")
starting.cards.create(card_type: "equipment", effect: "movement", modifier: "1", flavor_text: "starting engine")
starting.cards.create(card_type: "equipment", effect: "movement", modifier: "1", flavor_text: "starting engine")
starting.cards.create(card_type: "resource", effect: "credit", modifier: "1000", flavor_text: "You found some money")
starting.cards.create(card_type: "resource", effect: "credit", modifier: "1000", flavor_text: "You found some money")
starting.cards.create(card_type: "resource", effect: "credit", modifier: "1000", flavor_text: "You found some money")
starting.cards.create(card_type: "resource", effect: "credit", modifier: "2000", flavor_text: "You found more money")
starting.cards.create(card_type: "resource", effect: "credit", modifier: "2000", flavor_text: "You found more money")
starting.cards.create(card_type: "combat", effect: "attack", modifier: "1", flavor_text: "Lasers!  pew pew!")
starting.cards.create(card_type: "combat", effect: "attack", modifier: "1", flavor_text: "Lasers!  pew pew!")
starting.cards.create(card_type: "combat", effect: "attack", modifier: "1", flavor_text: "Lasers!  pew pew!")
starting.cards.create(card_type: "combat", effect: "defense", modifier: "1", flavor_text: "Shields up!")
starting.cards.create(card_type: "combat", effect: "defense", modifier: "1", flavor_text: "Shields up!")
starting.cards.create(card_type: "resource", effect: "energy", modifier: "1", flavor_text: "Danged rusty engines")
starting.cards.create(card_type: "resource", effect: "energy", modifier: "1", flavor_text: "Danged rusty engines")
starting.cards.create(card_type: "resource", effect: "energy", modifier: "2", flavor_text: "I think it's working!")
starting.cards.create(card_type: "resource", effect: "energy", modifier: "3", flavor_text: "How'd it do that?!")

