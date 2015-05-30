function getVideo(){
  console.log('videoKIlledTheRadioStar')
  //ajax request
  $.ajax({
    type: 'GET',
    url: '/videos',
    dataType: 'json'
  }).done(data){

  })//end of .done
}//end of getVideo