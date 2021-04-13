const animation = () => {
  $(document).ready(function() {
    var counter = 0;

    // Start the changing images
    setInterval(function() {
      if(counter === 4) {
        counter = 0;
      }

      changeImage(counter);
      counter++;
    }, 200);

    // Set the percentage off
  });
}

function changeImage(counter) {
  var images = [
    '<i class="fas fa-egg"></i>',
    '<i class="fas fa-lemon"></i>',
    '<i class="fas fa-cheese"></i>',
    '<i class="fas fa-bacon"></i>',
  ];

  $(".image").html(""+ images[counter] +"");
}

export { animation }
