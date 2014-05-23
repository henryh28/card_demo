$(document).ready(function(){
  bindEvent();

  $('.player_card').draggable( {
    cursor: 'crosshair',
    stack: $('.player_card')
  });

  $('.enemy_cards').droppable( {
    drop: handleAttack
  });


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
};


function buyCard(card) {
  // console.log(card)
  var cardId = $(card).find("#card_id").val()
  $.ajax({
    url: '/games/buy',
    type: 'get',
    data: {card: cardId }
  })
};


function processEvent(card) {
  var cardId = $(card).find('#card_id').val()
  console.log(cardId)
  $.ajax({
    url: '/games/event',
    type: 'get',
    data: {card: cardId }
  })
}


function handleAttack( event, ui ) {
  var draggable = ui.draggable;
  console.log( 'process attack ' )
}


