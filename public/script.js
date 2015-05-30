function getVideo(){
  //ajax request
  $.ajax({
    type: 'GET',
    url: '/videos',
    data: {title: title, description: description, url: url, genre: genre},
    dataType: 'json'
  }).done(function(data){
    console.log('i shot the sherrif')

  })//end of .done
}//end of getVideo


function createVideo(){
  var title = $('#title').val();
  var description = $('#description').val();
  var url = $('#url').val();
  var genre =$('#genre').val();
 $.ajax({
  type: 'POST',
  url: '/videos'
  data: {title: title, description: description, url: url, genre: genre},
  dataType: 'json'
 }).done(function(data){
  console.log('fuuuuuuck')
 })
}


//event listeners
$('.submit').on('click', createVideo)