document.addEventListener("turbolinks:load", () =>{
  $.getJSON('trips.json', (trips) => {
    matkat = trips
    $("#trips").html("matkoja: " + trips.length)
  })
})
