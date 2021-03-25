const changeTitle = () => {
  $('#shake-form').on("select2:selecting", function(e) {
    const title = document.querySelector('.fridge-title');
    title.innerHTML = `Shake your phone`;
  });
  // $('#shake-form').on("select2:unselect", function(e) {
  //   console.log(e);
  //   const title = document.querySelector('.fridge-title');
  //   title.innerHTML = `Your fridge is empty`;
  // });
}

export { changeTitle }

