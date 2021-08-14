import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('incident_place');
  
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
