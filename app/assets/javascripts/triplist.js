const TRIPS = {}

TRIPS.show = () => {
  const trip_list = []

  TRIPS.list.forEach((trip) =>{
    trip_list.push('<li>' + trip['start'] +'</li>')
  })

  $("#trips").html('<ul>' + trip_list.join('') + '</ul>')
}

TRIPS.reverse = () =>{
  TRIPS.list.reverse()
}

document.addEventListener("turbolinks:load", () =>{
  $("#reverse").click((e) =>{
    e.preventDefault()
    TRIPS.reverse()
    TRIPS.show()
  })


  $.getJSON('trips.json', (trips) => {
    TRIPS.list = trips
    TRIPS.show()
  })
})
