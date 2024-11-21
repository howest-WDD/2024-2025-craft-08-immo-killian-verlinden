'use strict';

import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

let mymap
const showMap = function(){

  mapboxgl.accessToken = import.meta.env.VITE_SECRET_KEY_MAPBOX; //keep it secret in GitHub!
  mymap = new mapboxgl.Map({
    container: 'map-id', // container ID
    // Choose from Mapbox's core styles, or make your own style with Mapbox Studio
    style: 'mapbox://styles/mapbox/streets-v12', // style URL
    center: [4.35735646652748, 50.845687598666984], // starting position [lng, lat]
    zoom: 7, // starting zoom
  });

}

const showMarkers = function(){


}

document.addEventListener('DOMContentLoaded', function() {
	console.log('DOM geladen');
	showMap();
	showMarkers();
});