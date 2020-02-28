import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';


import { initMapbox }         from '../plugins/init_mapbox';
import { initModals }         from '../plugins/init_modal';
import { initAutocomplete }   from '../plugins/init_autocomplete';
import { initScroll }         from '../plugins/init_scroll_btn';
import { initConfirmModals }  from '../plugins/init_confirm_modal';

initMapbox();
initModals();
initAutocomplete();
initScroll();
initConfirmModals();
