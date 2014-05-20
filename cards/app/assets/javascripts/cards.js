$(document).ready(function(){
  bindEvent();
});


function bindEvent(){
  $('.buyable_cards').click(function(event){
    event.preventDefault()
    testFunction(this);
  });
};


function testFunction(card) {
  // console.log(card)
  var cardId = $(card).find("#card_id").val()
  $.ajax({
    url: '/games/buy',
    type: 'get',
    data: {card: cardId }
  })
};

