document.addEventListener("turbolinks:load", () =>{
  $.getJSON('trips.json', (trips) => {
    //<!--$("#trips_count").html("matkoja: " + trips.length)-->

    const trip_list = [];
    trips.forEach( (trip) =>{
      trip_list.push('<li>' + trip['start'] +'</li>')
    });

    $("#trips").html('<ul>' + trip_list.join('') + '</ul>')
  });
})
