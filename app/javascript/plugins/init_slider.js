import Glide from '@glidejs/glide'
import '@glidejs/glide/dist/css/glide.core.min.css';

const initGlide = () => {
  new Glide('.glide').mount();
};

export { initGlide };
