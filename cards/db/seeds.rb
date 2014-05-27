# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

starting = Deck.create(name: "starting", deck_type: "player")
4.times { starting.cards.create(card_type: "equipment", effect: "energy", modifier: "1", flavor_text: "starting engine", cost: "0") }
4.times { starting.cards.create(card_type: "attack", effect: "attack", modifier: "1", flavor_text: "Lasers!  pew pew!", cost: "0") }
4.times { starting.cards.create(card_type: "equipment", effect: "shield", modifier: "1", flavor_text: "Shields up!", cost: "0") }


main_easy = Deck.create(name: "main_easy", deck_type: "event")
6.times { main_easy.cards.create(card_type: "enemy", effect: "hull", modifier: "-1", flavor_text: "You cut me off!  Space road rage!", cost: "500") }
6.times { main_easy.cards.create(card_type: "enemy", effect: "hull", modifier: "-2", flavor_text: "a_space_pirate_01 appears!", cost: "1000") }
3.times { main_easy.cards.create(card_type: "enemy", effect: "hull", modifier: "-3", flavor_text: "You'll never take me alive copper!", cost: "1500") }
5.times { main_easy.cards.create(card_type: "peace", effect: "none", modifier: "0", flavor_text: "Radar clear!", cost: "0") }
2.times { main_easy.cards.create(card_type: "penalty", effect: "energy", modifier: "-3", flavor_text: "Regular engine maintenance could have prevented this", cost: "0") }
2.times { main_easy.cards.create(card_type: "penalty", effect: "credit", modifier: "-1500", flavor_text: "Space IRS.  It's a thing.", cost: "1500") }
2.times { main_easy.cards.create(card_type: "bonus", effect: "cargo", modifier: "1", flavor_text: "Medical supplies", cost: "300") }
2.times { main_easy.cards.create(card_type: "bonus", effect: "cargo", modifier: "1", flavor_text: "Retail goods", cost: "100") }
1.times { main_easy.cards.create(card_type: "bonus", effect: "cargo", modifier: "3", flavor_text: "Replacement ship parts", cost: "700") }
1.times { main_easy.cards.create(card_type: "bonus", effect: "cargo", modifier: "1", flavor_text: "Contraband holodiscs", cost: "200") }


main_medium = Deck.create(name: "main_medium", deck_type: "event")
5.times { main_medium.cards.create(card_type: "enemy", effect: "hull", modifier: "-1", flavor_text: "You cut me off!  Space road rage!", cost: "500") }
7.times { main_medium.cards.create(card_type: "enemy", effect: "hull", modifier: "-2", flavor_text: "a_space_pirate_01 appears!", cost: "1000") }
5.times { main_medium.cards.create(card_type: "enemy", effect: "hull", modifier: "-3", flavor_text: "Your money and your life", cost: "2500") }
3.times { main_medium.cards.create(card_type: "peace", effect: "none", modifier: "0", flavor_text: "Radar clear!", cost: "0") }
3.times { main_medium.cards.create(card_type: "penalty", effect: "credit", modifier: "-500", flavor_text: "A service charge from ", cost: "0") }
1.times { main_medium.cards.create(card_type: "bonus", effect: "cargo", modifier: "2", flavor_text: "Blackmarket weaponry", cost: "500") }
1.times { main_medium.cards.create(card_type: "bonus", effect: "cargo", modifier: "1", flavor_text: "Contraband holodiscs", cost: "200") }
2.times { main_medium.cards.create(card_type: "bonus", effect: "cargo", modifier: "1", flavor_text: "Medical supplies", cost: "300") }
2.times { main_medium.cards.create(card_type: "bonus", effect: "cargo", modifier: "3", flavor_text: "Replacement ship parts", cost: "700") }
1.times { main_medium.cards.create(card_type: "bonus", effect: "cargo", modifier: "5", flavor_text: "An archaeological artifact!", cost: "2000") }


buy = Deck.create(name: "buy", deck_type: "upgrades")
3.times { buy.cards.create(card_type: "attack", effect: "attack", modifier: "2", flavor_text: "Liquid Hydrogen Coolant System", cost: "4000") }
3.times { buy.cards.create(card_type: "attack", effect: "attack", modifier: "3", flavor_text: "Solid Helium Coolant System", cost: "8000") }
3.times { buy.cards.create(card_type: "equipment", effect: "shield", modifier: "2", flavor_text: "Mark II Shield Recharger", cost: "5000") }
3.times { buy.cards.create(card_type: "equipment", effect: "shield", modifier: "2", flavor_text: "Mark III Shield Recharger", cost: "10000") }
3.times { buy.cards.create(card_type: "resource", effect: "energy", modifier: "2", flavor_text: "Anti-Matter Power Plant", cost: "7000") }
3.times { buy.cards.create(card_type: "resource", effect: "energy", modifier: "3", flavor_text: "Liquid Schwartz Generator", cost: "15000") }
3.times { buy.cards.create(card_type: "resource", effect: "energy", modifier: "4", flavor_text: "0.01 Point Energy Generator", cost: "25000") }


penalty = Deck.create(name: "debuff", deck_type: "penalty")
20.times { penalty.cards.create(card_type: "malfunction", effect: "none", modifier: "0", flavor_text: "It's repairable.... Maybe?", cost: "2000") }



