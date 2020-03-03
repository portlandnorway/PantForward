import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import Noty from 'noty';

import { initMapbox }         from '../plugins/init_mapbox';
import { initModals }         from '../plugins/init_modal';
import { initAutocomplete }   from '../plugins/init_autocomplete';
import { initScroll }         from '../plugins/init_scroll_btn';
import { initConfirmModals }  from '../plugins/init_confirm_modal';
import { initGlide }          from '../plugins/init_slider';

window.showNotification = (link, options = {}) => {
  const defaultOptions = {
    theme: 'nest',
    timeout: 5000,
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
initModals();
initAutocomplete();
initScroll();
initConfirmModals();
initGlide();
