$(document).ready(function(){
  bindEvent();

  // $('.player_card').draggable( {
  //   cursor: 'crosshair',
  //   stack: $('.player_card')
  // });

  // $('.enemy_cards').droppable( {
  //   drop: handleAttack
  // });


});


function bindEvent() {
  $('.buyable_cards').click(function(event){
    event.preventDefault();
    buyCard(this);
  });

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

  $('.station_cargos').click(function(event){
    event.preventDefault();
    sellCargo(this);
  })

  // $('.button_cargo').click(function(event){
  //   event.preventDefault();
  //   $('.cargo_area').slideToggle();
  //   return false;
  // })

};


function buyCard(card) {
  // console.log(card)
  var cardId = $(card).find("#card_id").val();
  $.ajax({
    url: '/games/buy',
    type: 'get',
    data: { card: cardId }
  })
};


function processEvent(card) {
  var cardId = $(card).find("#card_id").val();
  // console.log(cardId)
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


function sellCargo(card) {
  var cardId = $(card).find("#card_id").val();
  $.ajax({
    url: '/games/sell',
    type: 'get',
    data: { card: cardId }
  })
}

// function handleAttack( event, ui ) {
//   var draggable = ui.draggable;
//   console.log( 'process attack ' )
// }


