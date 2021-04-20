const dropDown = () => {
  const menuList = document.querySelectorAll('.User-Dropdown li');
  // Toggle
  $('.User-avtar').click(function(){
    $(".User-Dropdown").toggle("U-open");
  });
  //Animate li
  menuList.forEach((link, index) => {
    link.style.animation = `menuListProfile 0.5s ease forwards ${index / 7 + .25}s`
  });
}

export { dropDown }
