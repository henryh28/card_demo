$(document).ready(function(){
  bindEvent();
});


function bindEvent() {
  $('.buyable_cards').click(function(event){
    event.preventDefault();
    buyCard(this);
  });

  $('.event_cards').click(function(event){
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


$('.player_card').droppable


