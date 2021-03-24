import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({tags: true, width: "100%"})
  .on("select2:unselecting", function(e) {
    var self = $('.select2');
    setTimeout(function() {
      self.select2('close');
    }, 0);
  });
}

export { initSelect2 }
