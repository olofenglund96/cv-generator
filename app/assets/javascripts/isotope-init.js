$(document).ready(function(){
  var $isotopeGrid= $('.js-isotope-grid').isotope({
    // options...
    itemSelector: '.js-isotope-grid-item'
   
  });
  
  // filter with selects and checkboxes
  var $checkboxes = $('.js-isotope-filter-button');
  
  $checkboxes.change( function() {
    console.log('sho')
    // map input values to an array
    var inclusives = [];
    // inclusive filters from checkboxes
    $checkboxes.each( function( i, elem ) {
      // if checkbox, use value if checked
      if ( elem.checked ) {
        inclusives.push( elem.value );
      }
    });
  
    // combine inclusive filters
    var filterValue = inclusives.length ? inclusives.join(', ') : '*';
  
    $isotopeGrid.isotope({ filter: filterValue })
  });

});



