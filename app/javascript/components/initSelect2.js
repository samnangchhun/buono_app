import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  const $searchBar = $('.select2').select2({tags: true, width: "100%",allowClear: true, placeholder: "" })
  // .on("select2:unselecting", function(e) {
    // var self = $('.select2');
    // setTimeout(function() {
    //   self.select2('close');
    // }, 0);
  // });
  $searchBar.on("select2:selecting", function(e) {
    const title = document.querySelector('.fridge-title');
    title.classList.add('shake');
    title.innerHTML = `Shake your phone`;
  });
  $searchBar.on("select2:clear", function(e) {
    const title = document.querySelector('.fridge-title');
    title.classList.remove('shake');
    title.innerHTML = `Your fridge is empty`;
  });
  $searchBar.on("select2:unselect", function(e) {
    setTimeout(function() {
      $searchBar.select2('close');
    }, 0);
  });
}

export { initSelect2 }
