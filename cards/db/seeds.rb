# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
# cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# Mayor.create(name: 'Emanuel', city: cities.first)

starting = Deck.create(name: "starting", deck_type: "player")
4.times { starting.cards.create(card_type: "equipment", effect: "energy", modifier: "1", flavor_text: "Stock power plant", cost: "0") }
3.times { starting.cards.create(card_type: "equipment", effect: "attack", modifier: "1", flavor_text: "Stock coolant for weapons system", cost: "0") }
3.times { starting.cards.create(card_type: "equipment", effect: "shield", modifier: "1", flavor_text: "Stock shield regenerator", cost: "0") }


main_easy = Deck.create(name: "main_easy", deck_type: "event")
11.times { main_easy.cards.create(card_type: "enemy", effect: "hull", modifier: "-1", flavor_text: "You cut me off! Space road rage!", cost: "1000") }
9.times { main_easy.cards.create(card_type: "enemy", effect: "hull", modifier: "-2", flavor_text: "a_space_pirate_01 appears!", cost: "2000") }
4.times { main_easy.cards.create(card_type: "enemy", effect: "hull", modifier: "-3", flavor_text: ".....", cost: "3000") }
5.times { main_easy.cards.create(card_type: "peace", effect: "none", modifier: "0", flavor_text: "Radar clear!", cost: "0") }
2.times { main_easy.cards.create(card_type: "penalty", effect: "energy", modifier: "-2", flavor_text: "Regular engine maintenance could have prevented this", cost: "0") }
1.times { main_easy.cards.create(card_type: "penalty", effect: "time", modifier: "-1", flavor_text: "Detained by border patrol. Lose a turn", cost: "0") }
2.times { main_easy.cards.create(card_type: "penalty", effect: "credit", modifier: "-500", flavor_text: "Toll charge for Jumpgate useage", cost: "1500") }
2.times { main_easy.cards.create(card_type: "bonus", effect: "cargo", modifier: "1", flavor_text: "Medical supplies", cost: "300") }
2.times { main_easy.cards.create(card_type: "bonus", effect: "cargo", modifier: "1", flavor_text: "Retail goods", cost: "100") }
1.times { main_easy.cards.create(card_type: "bonus", effect: "cargo", modifier: "3", flavor_text: "Replacement ship parts", cost: "700") }
1.times { main_easy.cards.create(card_type: "bonus", effect: "cargo", modifier: "1", flavor_text: "Contraband holodiscs", cost: "200") }


main_medium = Deck.create(name: "main_medium", deck_type: "event")
8.times { main_medium.cards.create(card_type: "enemy", effect: "hull", modifier: "-1", flavor_text: "You cut me off! Space road rage!", cost: "1000") }
9.times { main_medium.cards.create(card_type: "enemy", effect: "hull", modifier: "-2", flavor_text: "a_space_pirate_01 appears!", cost: "2000") }
7.times { main_medium.cards.create(card_type: "enemy", effect: "hull", modifier: "-3", flavor_text: ".....", cost: "3000") }
4.times { main_medium.cards.create(card_type: "enemy", effect: "hull", modifier: "-4", flavor_text: "There's a bounty on your head. Sorry.", cost: "4000") }
2.times { main_medium.cards.create(card_type: "peace", effect: "none", modifier: "0", flavor_text: "Radar clear!", cost: "0") }
2.times { main_medium.cards.create(card_type: "penalty", effect: "credit", modifier: "-1500", flavor_text: "Space IRS. It's a thing.", cost: "0") }
2.times { main_medium.cards.create(card_type: "penalty", effect: "time", modifier: "-1", flavor_text: "Detained by border patrol. Lose a turn", cost: "0") }
2.times { main_medium.cards.create(card_type: "penalty", effect: "energy", modifier: "-2", flavor_text: "Regular engine maintenance could have prevented this", cost: "0") }
2.times { main_medium.cards.create(card_type: "penalty", effect: "credit", modifier: "-500", flavor_text: "Toll charge for Jumpgate useage", cost: "1500") }
1.times { main_medium.cards.create(card_type: "bonus", effect: "cargo", modifier: "2", flavor_text: "Blackmarket weaponry", cost: "500") }
1.times { main_medium.cards.create(card_type: "bonus", effect: "cargo", modifier: "1", flavor_text: "Contraband holodiscs", cost: "200") }
2.times { main_medium.cards.create(card_type: "bonus", effect: "cargo", modifier: "1", flavor_text: "Medical supplies", cost: "300") }
2.times { main_medium.cards.create(card_type: "bonus", effect: "cargo", modifier: "3", flavor_text: "Replacement ship parts", cost: "700") }
1.times { main_medium.cards.create(card_type: "bonus", effect: "cargo", modifier: "5", flavor_text: "An archaeological artifact!", cost: "2000") }


main_hard = Deck.create(name: "main_hard", deck_type: "event")
5.times { main_hard.cards.create(card_type: "enemy", effect: "hull", modifier: "-2", flavor_text: "a_space_pirate_01 appears!", cost: "2000") }
7.times { main_hard.cards.create(card_type: "enemy", effect: "hull", modifier: "-3", flavor_text: ".....", cost: "3000") }
7.times { main_hard.cards.create(card_type: "enemy", effect: "hull", modifier: "-4", flavor_text: "There's a bounty on your head. Sorry.", cost: "4000") }
5.times { main_hard.cards.create(card_type: "enemy", effect: "hull", modifier: "-5", flavor_text: "Goodbye.", cost: "5000") }
2.times { main_hard.cards.create(card_type: "bonus", effect: "cargo", modifier: "2", flavor_text: "Blackmarket weaponry", cost: "500") }
2.times { main_hard.cards.create(card_type: "bonus", effect: "cargo", modifier: "1", flavor_text: "Contraband holodiscs", cost: "200") }
2.times { main_hard.cards.create(card_type: "bonus", effect: "cargo", modifier: "1", flavor_text: "Medical supplies", cost: "300") }
2.times { main_hard.cards.create(card_type: "bonus", effect: "cargo", modifier: "3", flavor_text: "Replacement ship parts", cost: "700") }
2.times { main_hard.cards.create(card_type: "bonus", effect: "cargo", modifier: "5", flavor_text: "An archaeological artifact!", cost: "2000") }
4.times { main_hard.cards.create(card_type: "penalty", effect: "credit", modifier: "-1500", flavor_text: "Space IRS. It's a thing.", cost: "0") }
2.times { main_hard.cards.create(card_type: "penalty", effect: "energy", modifier: "-2", flavor_text: "Regular engine maintenance could have prevented this", cost: "0") }
2.times { main_hard.cards.create(card_type: "penalty", effect: "time", modifier: "-1", flavor_text: "Detained by border patrol. Lose a turn", cost: "0") }
3.times { main_hard.cards.create(card_type: "peace", effect: "none", modifier: "0", flavor_text: "Radar clear!", cost: "0") }

boss = Deck.create(name: "bosses", deck_type: "event")
1.times { boss.cards.create(card_type: "boss", effect: "hull", modifier: "-7", flavor_text: "The one you've been chasing.", cost: "10000") }
1.times { boss.cards.create(card_type: "boss", effect: "hull", modifier: "-6", flavor_text: "The one you've been chasing.", cost: "7500") }


# weapon efficiency format = heat generated : energy used : bonus to hit )
# shield efficiency format = unit charged : energy used : shield capacity )
# engine efficiency format = energy generated per turn : weapons battery : energy capacity )

buy = Deck.create(name: "buy", deck_type: "upgrades")
3.times { buy.cards.create(card_type: "equipment", effect: "attack", modifier: "2", flavor_text: "Liquid Hydrogen Coolant System", cost: "2000") }
2.times { buy.cards.create(card_type: "equipment", effect: "attack", modifier: "3", flavor_text: "Solid Helium Coolant System", cost: "5000") }
3.times { buy.cards.create(card_type: "equipment", effect: "shield", modifier: "2", flavor_text: "Mark II Shield Recharger", cost: "3000") }
2.times { buy.cards.create(card_type: "equipment", effect: "shield", modifier: "2", flavor_text: "Mark III Shield Recharger", cost: "7000") }
3.times { buy.cards.create(card_type: "equipment", effect: "energy", modifier: "2", flavor_text: "Anti-Matter Power Plant", cost: "4000") }
2.times { buy.cards.create(card_type: "equipment", effect: "energy", modifier: "3", flavor_text: "Unobtainium Converter", cost: "10000") }
2.times { buy.cards.create(card_type: "equipment", effect: "energy", modifier: "4", flavor_text: "0.01 Point Energy Generator", cost: "15000") }
3.times { buy.cards.create(card_type: "ship_upgrade", effect: "hull", modifier: "7", flavor_text: "Amorphic Meta-diamonoid reactive foam, with raspberry scent", cost: "4000") }
2.times { buy.cards.create(card_type: "ship_upgrade", effect: "hull", modifier: "10", efficiency: "1",flavor_text: "Wishalloy Armored Hull Plating", cost: "10000") }
3.times { buy.cards.create(card_type: "ship_upgrade", effect: "crew", modifier: "5", flavor_text: "Bunkbeds Deluxe", cost: "3500") }
2.times { buy.cards.create(card_type: "ship_upgrade", effect: "crew", modifier: "6", flavor_text: "Space foldout couch", cost: "7500") }
1.times { buy.cards.create(card_type: "ship_upgrade", effect: "crew", modifier: "7", flavor_text: "'Space-RV' Trailer Pod", cost: "15000") }
2.times { buy.cards.create(card_type: "ship_upgrade", effect: "weapon", modifier: "2", efficiency: "2:1:3", flavor_text: "Particle Beam Projector", cost: "3500")}
# 2.times { buy.cards.create(card_type: "ship_upgrade", effect: "weapon", modifier: "0", efficiency: "0:0:10", flavor_text: "Missile Launcher", cost: "3000")}
2.times { buy.cards.create(card_type: "ship_upgrade", effect: "weapon", modifier: "3", efficiency: "3:2:2", flavor_text: "Angry cannon", cost: "8500")}
2.times { buy.cards.create(card_type: "ship_upgrade", effect: "shield", modifier: "2", efficiency: "2:1:10", flavor_text: "Energy Barrier", cost: "5000")}
2.times { buy.cards.create(card_type: "ship_upgrade", effect: "shield", modifier: "3", efficiency: "1:1:15", flavor_text: "Energy Disperser", cost: "10000")}
2.times { buy.cards.create(card_type: "ship_upgrade", effect: "engine", modifier: "3", efficiency: "3:10:15", flavor_text: "General Neutronics Mk. VI", cost: "7500") }
2.times { buy.cards.create(card_type: "ship_upgrade", effect: "engine", modifier: "4", efficiency: "2:15:20", flavor_text: "Astro T-38", cost: "15000") }


penalty = Deck.create(name: "debuff", deck_type: "penalty")
35.times { penalty.cards.create(card_type: "malfunction", effect: "none", modifier: "0", flavor_text: "It's repairable.... Maybe?", cost: "2000") }

