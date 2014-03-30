$(function() {

  // var showMap = function(position) {
  //   var latitude = position.coors.latitude
  //   var longitude = position.coors.longitude
  // }

  // if (navigator.geolocation)
  // {
  //   navigator.geolocation.getCurrentPosition(showMap);

  // }

  $("body.locations").each(function(){
    var add, lat, lng, mapDiv, name, onMapClick, popup, localink;
    mapDiv = $('#map');
    lat = mapDiv.data('latitude');
    lng = mapDiv.data('longitude');
    add = mapDiv.data('address');
    name = mapDiv.data('name');
    mapId = mapDiv.data('id');
    mapDes = mapDiv.data('description');
    mapImage = mapDiv.data('image');
    window.map = L.map('map').setView([lat, lng], 14);
    // localink = "<a href='/locations'" + mapId +" >" + name + add +"</a>"

    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    L.marker([lat, lng]).addTo(map).bindPopup(name + "<br>" + mapDes).openPopup();

    onMapClick = function(e) {
      window.e = e
      link = "<a href='/locations/new?lat=" + e.latlng.lat+";&lng="+ e.latlng.lng +"'>Add location</a>"
      popup.setLatLng(e.latlng).setContent(link).openOn(map);
    };

    popup = L.popup();
    return map.on("click", onMapClick);
  });


  $("td[data-link]").click(function() {
  window.location = $(this).data("link")
})
});