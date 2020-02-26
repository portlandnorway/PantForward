import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';


import { initMapbox }       from '../plugins/init_mapbox';
import { modalOnBtnClick }  from '../plugins/init_modal';
import { initAutocomplete } from '..plugins/init_autocomplete'

initMapbox();
modalOnBtnClick();
initAutocomplete();
