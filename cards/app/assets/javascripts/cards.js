$(document).ready(function(){
  bindEvent();
});


function bindEvent(){
  $('.card').click(function(event){
    event.preventDefault()
    testFunction(this);
  });
};


function testFunction(card) {
  console.log(card)
  console.log(this.credit > this.cost);
};

