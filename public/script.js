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
 console.log(testicles)
}

