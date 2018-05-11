$(document).ready(function() {
  var platform = new H.service.Platform({
    'app_id': '0jlbpiZs18Eh52AdfTqO',
    'app_code': 'THjSpTiTnmQB6kWjfgTtIQ'
  });

  function calculateRouteFromAtoB (platform) {
    var router = platform.getRoutingService(),
      routeRequestParams = {
        mode: 'fastest;car',
        representation: 'display',
        routeattributes : 'waypoints,summary,shape,legs',
        maneuverattributes: 'direction,action',
        waypoint0: '52.5160,13.3779',
        waypoint1: '52.5206,13.3862'
      };

    router.calculateRoute(
      routeRequestParams,
      onSuccess,
      onError
    );
  }

  function onSuccess(result) {
    var route = result.response.route[0];
    addRouteShapeToMap(route);
    addManueversToPanel(route);
  }

  function onError(error) {
    alert('Ooops!');
  }

  var mapContainer = document.getElementById('map');
  var defaultLayers = platform.createDefaultLayers();

  var map = new H.Map(mapContainer,
    defaultLayers.normal.map,{
      center: {lat:52.5160, lng:13.3779},
      zoom: 13
    });

  var behavior = new H.mapevents.Behavior(new H.mapevents.MapEvents(map));

  var ui = H.ui.UI.createDefault(map, defaultLayers);


  function addRouteShapeToMap(route){
    var strip = new H.geo.Strip(),
      routeShape = route.shape,
      polyline;

    routeShape.forEach(function(point) {
      var parts = point.split(',');
      strip.pushLatLngAlt(parts[0], parts[1]);
    });

    polyline = new H.map.Polyline(strip, {
      style: {
        lineWidth: 4,
        strokeColor: 'rgba(0, 128, 255, 0.7)'
      }
    });
    // Add the polyline to the map
    map.addObject(polyline);
    // And zoom to its bounding rectangle
    map.setViewBounds(polyline.getBounds(), true);
  }




  calculateRouteFromAtoB (platform);


});
