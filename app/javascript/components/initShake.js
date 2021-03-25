const Shake = require('shake.js');

const myShakeEvent = new Shake({
  threshold: 15, // optional shake strength threshold
  timeout: 1000 // optional, determines the frequency of event generation
});
const initShake = () => {
  const form = document.querySelector("#shake-form")
  if (form) {
    myShakeEvent.start();
    window.addEventListener('shake', () => {
      const modal = document.querySelector(".shake-modal")
      if (modal) {
        modal.style.display = "block";
        setTimeout(function () {
          form.submit();
        }, 3000);
      }
    })
  }
}
export { initShake }
