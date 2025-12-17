

$(document).ready(function () {
    mapInitialize(properties);
});

function mapInitialize(properties) {
    window.activeMap && window.activeMap.remove();
    var markers = [];
    var l = !0,
        p = mapStyle,
        o = !0;
    var defaultCoordinates = [51.505, -0.09]; // Default coordinates (e.g., London)
    var defaultZoom = 3;

    if ($('#main-map').length) {
        map = L.map('main-map', {
            scrollWheelZoom: o,
            tap: !L.Browser.mobile
        });


        var t = L.tileLayer('//{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}', {

            maxZoom: 20,
            subdomains: ['mt0', 'mt1', 'mt2', 'mt3']
        }).addTo(map);
        var clusters = L.markerClusterGroup();
        if (properties.length > 0) {
            properties.forEach(element => {
                var s = '<div class="marker-container"><div class="marker-card"><div class="front face"> <i class="fal fa-' + (element.type == 'commercial' ? 'building' : 'home') + '"></i> </div><div class="marker-arrow"></div></div></div>',
                    a = L.marker([element.latitude, element.longitude], {
                        icon: L.divIcon({
                            html: s,
                            className: 'open_steet_map_marker google_marker',
                            iconSize: [40, 46],
                            popupAnchor: [1, -35],
                            iconAnchor: [20, 46],
                        })
                    });
                let propertyUrl = baseURL + '/property/' + element.slug;
                a.bindPopup('<div class="product-default p-0"> <figure class="product-img"> <a href="' + propertyUrl + '" class="lazy-container ratio ratio-1-1"> <img class="lazyload" src="assets/images/placeholder.png" data-src="' + baseURL + '/assets/img/property/featureds/' + element.featured_image + '" alt="Product"> </a></figure><div class="product-details"><h6 class="product-title"><a href="' + propertyUrl + '">' + element.title + '</a></h6><span class="product-location icon-start"><i class="fal fa-map-marker-alt"></i>' + element.address + '</span></div><span class="label text-capitalize">' + element.purpose + '</span></div>', jpopup_customOptions);
                clusters.addLayer(a);
                markers.push(a);
                map.addLayer(clusters);
            });

            if (markers.length) {
                var e = [];
                for (var i in markers) {
                    if (typeof markers[i]['_latlng'] == 'undefined') continue;
                    var c = [markers[i].getLatLng()];
                    e.push(c)
                };
                var r = L.latLngBounds(e);
                map.fitBounds(r)
            };
            if (!markers.length) { }
        } else {
            map.setView(defaultCoordinates, defaultZoom);
        }
    }
    window.activeMap = map;

    var timerMap, ad_galleries, firstSet = !1,
        mapRefresh = !0,
        loadOnTab = !0,
        zoomOnMapSearch = 9,
        clusterConfig = null,
        markerOptions = null,
        mapDisableAutoPan = !1,
        rent_inc_id = '55',
        scrollWheelEnabled = !1,
        myLocationEnabled = !0,
        rectangleSearchEnabled = !0,
        mapSearchbox = !0,
        mapRefresh = !0,
        map_main, styles, mapStyle = [{
            'featureType': 'landscape',
            'elementType': 'geometry.fill',
            'stylers': [{
                'color': '#fcf4dc'
            }]
        }, {
            'featureType': 'landscape',
            'elementType': 'geometry.stroke',
            'stylers': [{
                'color': '#c0c0c0'
            }, {
                'visibility': 'on'
            }]
        }];

    var jpopup_customOptions = {
        'maxWidth': 'initial',
        'width': 'initial',
        'className': 'popupCustom'
    };

}
