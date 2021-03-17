import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({tags: true, width: "100%"});
}

export { initSelect2 }
