import counterUp from 'counterup2';

// Start counting, do this on DOM ready or with Waypoints.
const setupCounterUp = () => {
  const counterDiv = document.querySelector('.counter');

  if (!counterDiv) {
    return;
  }

  counterUp(counterDiv, {
    duration: 1400,
    delay: 16,
  });
}

export { setupCounterUp }
