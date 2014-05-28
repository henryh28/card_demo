$(document).ready(function(){
  bindEvent();
  bindStationEvent();
});


function bindEvent() {
  $('.enemy_cards').click(function(event){
    event.preventDefault();
    processEvent(this);
  });

  $('.cargo_cards').click(function(event){
    event.preventDefault();
    lootCargo(this);
  })

  $('.space_cargos').click(function(event){
    event.preventDefault();
    jettisonCargo(this);
  })

  $('.shield_charger_card').click(function(event){
    rechargeShield(this);
  })


};


function bindStationEvent(){
  $('.buyable_cards').click(function(event){
    event.preventDefault();
    buyCard(this);
  });

  $('.station_cargos').click(function(event){
    event.preventDefault();
    sellCargo(this);
  })
};


// ************* Space Events ****************
function processEvent(card) {
  var cardId = $(card).find("#card_id").val();
  $.ajax({
    url: '/games/event',
    type: 'get',
    data: { card: cardId }
  })
}


function lootCargo(card) {
  var cardId = $(card).find("#card_id").val();
  $.ajax({
    url: '/games/cargo',
    type: 'get',
    data: { card: cardId }
  })
}


function jettisonCargo(card) {
  var cardId = $(card).find("#card_id").val();
  $.ajax({
    url: '/games/jettison',
    type: 'get',
    data: { card: cardId }
  })
}


function rechargeShield(card) {
  var cardId = $(card).find("#card_id").val();
  $.ajax({
    url: '/games/shield_up',
    type: 'get',
    data: { card: cardId }
  })
}


// ************* Station Events ****************
function buyCard(card) {
  var cardId = $(card).find("#card_id").val();
  $.ajax({
    url: '/games/buy',
    type: 'get',
    data: { card: cardId }
  })
};


function sellCargo(card) {
  var cardId = $(card).find("#card_id").val();
  $.ajax({
    url: '/games/sell',
    type: 'get',
    data: { card: cardId }
  })
}
