const bedChoice = () => {
  $(document).ready(function(){
    $(".bed-choice").click(function(){
      $(this).toggleClass("active");
    });
  });
}

export {bedChoice};
