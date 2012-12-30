$(function(){
  $("#cropbox").Jcrop({
    onChange: update_crop,
    onSelect: update_crop,
    minSize: [640, 339],
    maxSize: [640, 339],
    setSelect: [0,0,640,339]
  });
});

function update_crop(coords){
  $("#crop_x").val(coords.x);
  $("#crop_y").val(coords.y);
  $("#crop_w").val(coords.w);
  $("#crop_h").val(coords.h);
}