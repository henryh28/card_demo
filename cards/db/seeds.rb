# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

starting = Deck.create(name: "starting", deck_type: "player")
starting.cards.create(card_type: "equipment", effect: "movement", modifier: "1", flavor_text: "starting engine", cost: "0")
starting.cards.create(card_type: "equipment", effect: "movement", modifier: "1", flavor_text: "starting engine", cost: "0")
starting.cards.create(card_type: "equipment", effect: "movement", modifier: "1", flavor_text: "starting engine", cost: "0")
starting.cards.create(card_type: "resource", effect: "credit", modifier: "1000", flavor_text: "You found some money", cost: "0")
starting.cards.create(card_type: "resource", effect: "credit", modifier: "1000", flavor_text: "You found some money", cost: "0")
starting.cards.create(card_type: "resource", effect: "credit", modifier: "1000", flavor_text: "You found some money", cost: "0")
starting.cards.create(card_type: "resource", effect: "credit", modifier: "2000", flavor_text: "You found more money", cost: "0")
starting.cards.create(card_type: "resource", effect: "credit", modifier: "2000", flavor_text: "You found more money", cost: "0")
starting.cards.create(card_type: "combat", effect: "attack", modifier: "1", flavor_text: "Lasers!  pew pew!", cost: "0")
starting.cards.create(card_type: "combat", effect: "attack", modifier: "1", flavor_text: "Lasers!  pew pew!", cost: "0")
starting.cards.create(card_type: "combat", effect: "attack", modifier: "1", flavor_text: "Lasers!  pew pew!", cost: "0")
starting.cards.create(card_type: "combat", effect: "defense", modifier: "1", flavor_text: "Shields up!", cost: "0")
starting.cards.create(card_type: "combat", effect: "defense", modifier: "1", flavor_text: "Shields up!", cost: "0")
starting.cards.create(card_type: "resource", effect: "energy", modifier: "1", flavor_text: "Danged rusty engines", cost: "0")
starting.cards.create(card_type: "resource", effect: "energy", modifier: "1", flavor_text: "Danged rusty engines", cost: "0")
starting.cards.create(card_type: "resource", effect: "energy", modifier: "1", flavor_text: "Danged rusty engines", cost: "0")
starting.cards.create(card_type: "resource", effect: "energy", modifier: "1", flavor_text: "Danged rusty engines", cost: "0")

main = Deck.create(name: "main", deck_type: "event")
main.cards.create(card_type: "combat", effect: "enemy", modifier: "1", flavor_text: "a_weak_pirate_01", cost: "0")
main.cards.create(card_type: "combat", effect: "enemy", modifier: "1", flavor_text: "a_weak_pirate_01", cost: "0")
main.cards.create(card_type: "combat", effect: "enemy", modifier: "1", flavor_text: "a_weak_pirate_01", cost: "0")
main.cards.create(card_type: "combat", effect: "enemy", modifier: "1", flavor_text: "a_weak_pirate_01", cost: "0")
main.cards.create(card_type: "combat", effect: "enemy", modifier: "1", flavor_text: "a_weak_pirate_01", cost: "0")
main.cards.create(card_type: "combat", effect: "enemy", modifier: "2", flavor_text: "I want yer loot!", cost: "0")
main.cards.create(card_type: "combat", effect: "enemy", modifier: "2", flavor_text: "I want yer loot!", cost: "0")
main.cards.create(card_type: "combat", effect: "enemy", modifier: "2", flavor_text: "I want yer loot!", cost: "0")
main.cards.create(card_type: "combat", effect: "enemy", modifier: "2", flavor_text: "I want yer loot!", cost: "0")
main.cards.create(card_type: "combat", effect: "enemy", modifier: "3", flavor_text: "Your money and your life", cost: "0")
main.cards.create(card_type: "combat", effect: "enemy", modifier: "3", flavor_text: "Your money and your life", cost: "0")
main.cards.create(card_type: "combat", effect: "enemy", modifier: "3", flavor_text: "Your money and your life", cost: "0")
main.cards.create(card_type: "peace", effect: "none", modifier: "blank", flavor_text: "Enjoy it while you can", cost: "0")
main.cards.create(card_type: "peace", effect: "none", modifier: "blank", flavor_text: "Enjoy it while you can", cost: "0")
main.cards.create(card_type: "peace", effect: "none", modifier: "blank", flavor_text: "Enjoy it while you can", cost: "0")
main.cards.create(card_type: "peace", effect: "none", modifier: "blank", flavor_text: "Enjoy it while you can", cost: "0")
main.cards.create(card_type: "peace", effect: "none", modifier: "blank", flavor_text: "Enjoy it while you can", cost: "0")
main.cards.create(card_type: "bonus", effect: "credit", modifier: "1000", flavor_text: "Guess someone dropped this", cost: "0")
main.cards.create(card_type: "bonus", effect: "credit", modifier: "1000", flavor_text: "Guess someone dropped this", cost: "0")
main.cards.create(card_type: "bonus", effect: "credit", modifier: "1000", flavor_text: "Guess someone dropped this", cost: "0")
main.cards.create(card_type: "penalty", effect: "energy", modifier: "-1", flavor_text: "Regular engine maintenance could have prevented this", cost: "0")
main.cards.create(card_type: "penalty", effect: "energy", modifier: "-1", flavor_text: "Regular engine maintenance could have prevented this", cost: "0")
main.cards.create(card_type: "penalty", effect: "credit", modifier: "-1000", flavor_text: "Space IRS.  It's a thing.", cost: "0")
main.cards.create(card_type: "penalty", effect: "credit", modifier: "-1000", flavor_text: "Space IRS.  It's a thing.", cost: "0")

buy = Deck.create(name: "buy", deck_type: "upgrades")
buy.cards.create(card_type: "combat", effect: "attack", modifier: "2", flavor_text: "Green lasers!", cost: "4000")
buy.cards.create(card_type: "combat", effect: "attack", modifier: "2", flavor_text: "Green lasers!", cost: "4000")
buy.cards.create(card_type: "combat", effect: "attack", modifier: "2", flavor_text: "Green lasers!", cost: "4000")
buy.cards.create(card_type: "combat", effect: "attack", modifier: "3", flavor_text: "Purple lasers!", cost: "8000")
buy.cards.create(card_type: "combat", effect: "attack", modifier: "3", flavor_text: "Purple lasers!", cost: "8000")
buy.cards.create(card_type: "combat", effect: "defense", modifier: "2", flavor_text: "Rainbow happy shield", cost: "5000")
buy.cards.create(card_type: "combat", effect: "defense", modifier: "2", flavor_text: "Rainbow happy shield", cost: "5000")
buy.cards.create(card_type: "resource", effect: "energy", modifier: "2", flavor_text: "I think it's working!", cost: "7000")
buy.cards.create(card_type: "resource", effect: "energy", modifier: "2", flavor_text: "I think it's working!", cost: "7000")
buy.cards.create(card_type: "resource", effect: "energy", modifier: "3", flavor_text: "How'd it do that?!", cost: "15000")
buy.cards.create(card_type: "resource", effect: "energy", modifier: "3", flavor_text: "How'd it do that?!", cost: "15000")



