import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('incident_place');
  
  if (addressInput) {
    places({ container: addressInput }).on('change', function(e) {
      addressInput.textContent = e.suggestion.value
    });
  }
};

export { initAutocomplete };