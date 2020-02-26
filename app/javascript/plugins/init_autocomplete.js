import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('collection_address');
  if (addressInput) {
    places({ container: addressInput }).configure({
      countries: ['no']
    });
  }
};

export { initAutocomplete };
