var toggler = document.getElementsByClassName("caret");
var i;
for (i = 0; i < toggler.length; i++) {
  toggler[i].addEventListener("click", function() {
    this.parentElement.querySelector(".nested").classList.toggle("active");
    this.classList.toggle("caret-down");
  });
}

let ingeklapt=true
function toggleDisplay(anchor){
  if(ingeklapt===true){
    $(".nested").attr("style","display:block")
    ingeklapt=false
  }else{
//  $(".nested").attr("style","display:none")//Stylesheet overruled
    $(".nested").attr("style","display:")
    ingeklapt=true
  }
  moveTo(anchor)
}

function moveTo(anchor){
  var url = location.href             //Save down the URL without hash.
  location.href = "#"+anchor          //Go to the target element.
  history.replaceState(null,null,url) //Don't like hashes. Changing it back.
}


