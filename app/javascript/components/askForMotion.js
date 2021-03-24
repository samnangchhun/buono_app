const askForMotion = () => {
  const trigger = document.querySelector("#trigger-req")
  if (trigger) {
    trigger.addEventListener('click', () => {
      if (typeof DeviceMotionEvent.requestPermission === 'function') {
        DeviceMotionEvent.requestPermission()
          .then(permissionState => {
            if (permissionState === 'granted') {
              console.log('Permission granted, shake enabled.')
            }
            window.location.href = "/fridge"
          })
          .catch(e => {
            window.location.href = "/fridge"
          })
      }
    })
  }
}
export { askForMotion }