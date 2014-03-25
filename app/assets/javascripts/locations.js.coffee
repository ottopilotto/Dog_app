$ ->
  mapDiv = $('#map')
  lat = mapDiv.data('latitude')
  lng = mapDiv.data('longitude')
  map = L.map('map').setView([lat,lng], 13)
  

  L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors' 
  }).addTo(map)

  onMapClick = (e) ->
    popup.setLatLng(e.latlng).setContent("You clicked the map at " + e.latlng.toString()).openOn map
    return
  popup = L.popup()
  map.on "click", onMapClick