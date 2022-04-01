// window.onload = function () {
//     var map = L.map('map');
//     var layer = Tangram.leafletLayer({
//       scene: 'scene.yaml',
//       attribution: '<a href="https://mapzen.com/tangram" target="_blank">Tangram</a> | &copy; OSM contributors | <a href="https://mapzen.com/" target="_blank">Mapzen</a>'
//     });
//     layer.addTo(map);
//     map.setView([40.70531887544228, -74.00976419448853], 15);
// }

$(function () {
    function initializeMap(data) {
      var posts = $.parseJSON(data);
      var geoJSON = L.geoJSON(posts);
      
      var map = L.map('map');
      var layer = Tangram.leafletLayer({
        scene: 'scene.yaml',
        attribution: '<a href="https://mapzen.com/tangram" target="_blank">Tangram</a> | &copy; OSM contributors | <a href="https://mapzen.com/" target="_blank">Mapzen</a>'
      });
  
      layer.addTo(map);
      geoJSON.addTo(map);
  
      map.setView(posts[0].geometry.coordinates.reverse(), 15);
    };
  
    $.ajax({
      url: '/posts.json',
      dataType: 'text',
      success: initializeMap
    });
  });