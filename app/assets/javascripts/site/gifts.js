var what_list = [];
var who_list = [];

$(function(){
  $('.add_what_link').click(function(){
    var group = $(this).data("group");

    animate();
    
    if($.inArray(group,what_list) < 0){
      $(this).addClass("filter");
      what_list.push(group);
    } else {
      $(this).removeClass("filter");
      what_list.splice(what_list.indexOf(group),1);
    }
    
    $(this).prop("href",getFilterLink());
  });
  
  $('.add_who_link').click(function(){
    var tag = $(this).data("tag");

    animate();
    
    if($.inArray(tag,who_list) < 0){
      $(this).addClass("filter");
      who_list.push(tag);
    } else {
      $(this).removeClass("filter");
      who_list.splice(who_list.indexOf(tag),1);
    }
    
    $(this).prop("href",getFilterLink());
    
  })
    
  function getFilterLink() {
    return '/gifts/filter?what='+ what_list.join(",") +'&who='+ who_list.join(",");
  }
  
  function animate() {
    $('.pagination').hide();
    $('#portfolio').fadeOut().empty();
    $('#portfolio').hide();
    $('.waiting').fadeIn();    
  }
  
});

