const TRIPS = {}

TRIPS.show = () => {
  $("#triptable tr:gt(0)").remove()
  const table = $("#triptable")
  let isAsc = false

  TRIPS.list.forEach((trip) =>{
    table.append('<tr>'
    + '<td>' + trip['start'] +'</td>'
    + '<td>' + trip['end'] +'</td>'
    + '<td>' + trip['elo'] +'</td>'
    + '<td>' + trip['length'] +'</td>'
    + '</tr>')
  })
}

TRIPS.sort_by_start = ()=>{
    TRIPS.list.sort((a,b) =>{
      return a.start.toUpperCase().localeCompare(b.start.toUpperCase());
    })
}
TRIPS.sort_by_end = ()=>{
    TRIPS.list.sort((a,b) =>{
      return a.end.toUpperCase().localeCompare(b.end.toUpperCase());
    })
}
TRIPS.sort_by_elo = ()=>{
    TRIPS.list.sort((a,b) =>{
      return ('' + a.elo).toUpperCase().localeCompare(('' + b.elo).toUpperCase());
    })
}
TRIPS.sort_by_length = ()=>{
    TRIPS.list.sort((a,b) =>{
      return ('' + a.length).toUpperCase().localeCompare((''+b.length).toUpperCase());
    })
}
TRIPS.asc = () =>{
  if (TRIPS.isAsc) {
    TRIPS.list.reverse()
    TRIPS.isAsc = false;
  }else{
    TRIPS.isAsc = true;
  }
}
