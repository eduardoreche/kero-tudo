var what_list = [];

$(function(){
  $('.add_what_link').click(function(){
    var group = $(this).data("group");

    animate();
    
    if($.inArray(group,what_list) < 0){
      $(this).addClass("filter");
      what_list.push(group);
      console.log("add link");
    } else {
      $(this).removeClass("filter");
      what_list.splice(what_list.indexOf(group),1);
      console.log("del link");
    }
    
    $(this).prop("href",getWhatFilterLink());
    console.log($(this).prop("href"));
  });
  
  function getWhatFilterLink() {
    return "/gifts/filter?what="+ what_list.join(",");
  }
  
  function animate() {
    $('.pagination').hide();
    $('#portfolio').fadeOut().empty();
    $('#portfolio').hide();
    $('.waiting').fadeIn();
  }
  
});
