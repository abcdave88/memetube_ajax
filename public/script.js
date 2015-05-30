function getVideo(){
  //ajax request
  $.ajax({
    type: 'GET',
    url: '/videos',
    dataType: 'json'
  }).done(function(data){
    console.log('i shot the sherrif')

  })//end of .done
}//end of getVideo


function createVideo(){
 $.ajax({
  type: 'POST',
  url: '/videos'
  dataType: 'json'
 }).done(function(data){
  console.log('fuuuuuuck')
 })
}


//event listeners
$('.submit').on('click', createVideo)