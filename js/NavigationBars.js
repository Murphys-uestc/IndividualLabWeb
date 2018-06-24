window.onload=function(){
  var menu=document.getElementById("menu");
  var as=menu.getElementsByTagName("a");
   
  for(var i=0;i<as.length;i++){
    as[i].onclick=function(){
      for(var i=0;i<as.length;i++){
        as[i].className="";
      }
      this.className="current";
    }
  }
}