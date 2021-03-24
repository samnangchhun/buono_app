const Shake = require('shake.js');

var myShakeEvent = new Shake({
    threshold: 15, // optional shake strength threshold
    timeout: 1000 // optional, determines the frequency of event generation
});



const shake = () => {
  myShakeEvent.start();
  window.addEventListener('click', () => {
    var modal = document.querySelector(".shake-modal")
    var form = document.querySelector("#shake-form")
    if (modal) {
          modal.style.display = "block";
    setTimeout(function() {
      form.submit();
    }, 2000);
    }
  });
}

export { shake }

