import Glide from '@glidejs/glide'
import '@glidejs/glide/dist/css/glide.core.min.css';

const initGlide = () => {
  const glideContainer = document.querySelector('.glide');

  if (glideContainer) {
    new Glide('.glide').mount({Controls});
  }
};

export { initGlide };
