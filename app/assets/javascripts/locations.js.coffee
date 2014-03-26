$ ->
  mapDiv = $('#map')
  lat = mapDiv.data('latitude')
  lng = mapDiv.data('longitude')
  add = mapDiv.data('address')
  name = mapDiv.data('name')
  window.map = L.map('map').setView([lat,lng], 15)
  

  L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors' 
  }).addTo(map)

  L.marker([lat, lng]).addTo(map)
    .bindPopup(name + '<br>' + add)
    .openPopup();

  onMapClick = (e) ->
    popup.setLatLng(e.latlng).setContent("You clicked the map at " + e.latlng.toString()).openOn map
    return
  popup = L.popup()
  map.on "click", onMapClick