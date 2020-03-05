import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import Noty from 'noty';

import { initMapbox }         from '../plugins/init_mapbox';
import { initMapboxShow }     from '../plugins/init_mapbox_show';
import { initAutocomplete }   from '../plugins/init_autocomplete';
import { initScroll }         from '../plugins/init_scroll_btn';
import { initConfirmModals }  from '../plugins/init_confirm_modal';
import { initGlide }          from '../plugins/init_slider';
import { drawCharts }         from '../plugins/init_charts';
import { fadeOut }            from '../plugins/init_timer'
import { setupCounterUp }     from '../plugins/init_counterUp'

window.showNotification = (link, options = {}) => {
  const defaultOptions = {
    theme: 'nest',
    timeout: 10000,
    closeWith: ['click'],
    callbacks: {
      onClick: () => {
        window.location = link;
      }
    }
  }

  new Noty({ ...defaultOptions, ...options }).show();
}

initMapbox();
initMapboxShow();
initAutocomplete();
initScroll();
initConfirmModals();
initGlide();
drawCharts();
setupCounterUp();

document.addEventListener("DOMContentLoaded", () => {
  fadeOut();
});
