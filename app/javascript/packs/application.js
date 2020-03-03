import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';


import { initMapbox }         from '../plugins/init_mapbox';
import { initMapboxShow }     from '../plugins/init_mapbox_show';
import { initModals }         from '../plugins/init_modal';
import { initAutocomplete }   from '../plugins/init_autocomplete';
import { initScroll }         from '../plugins/init_scroll_btn';
import { initConfirmModals }  from '../plugins/init_confirm_modal';
import { initGlide }          from '../plugins/init_slider';
import { drawCharts }         from '../plugins/init_charts';

initMapbox();
initMapboxShow();
initModals();
initAutocomplete();
initScroll();
initConfirmModals();
//initGlide();
drawCharts();
