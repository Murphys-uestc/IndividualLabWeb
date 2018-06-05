  $(document).ready(function()
    {
        /*轮播*/
        var index = 0;
        var jdlis = $('.jiaodiandiv li'); /*焦点li元素集合*/
       var timer;
       var liWidth = $('#DynamicImg').width();
       var len = $("#DynamicImg ul li").length;
      //左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
       $("#DynamicImg ul").css("width",liWidth * (len));
    
	   //显示文字介绍//
	    $(".slider_p_div").hide();
        $("#slider_p0").show();
	
        
 
      //上一张按钮
     $("#SlidePrev").click(function() {
      clearInterval(timer);
     index -= 1;
      if(index == -1) {index = len - 1;}
     showPic(index);
	 
	   $(".slider_p_div").hide();
		$("#slider_p"+index).show();
	 
       });
  
      //下一张按钮
      $("#SlideNext").click(function() {
     clearInterval(timer);
      index += 1;
     if(index == len) {index = 0;}
       showPic(index);
	   
	   //显示文字介绍//
	    $(".slider_p_div").hide();
		$("#slider_p"+index).show();
	   
       });
	   
	  
	   
      //轮播图像
     $('#DynamicImg').hover(
     function()
      {
         clearInterval(timer); /*停止动画*/
      $('.slideshortcut a').show().css('opacity','0.4');
	  $('.slide_p_div').show().css('opacity','0.4');
       },
      function()
      {
           $('.slideshortcut a').hide();
          timer=setInterval(function() {
          showPic(index);
		  
		  	  
	   //轮播显示文字介绍//
	    $(".slider_p_div").hide();
		$("#slider_p"+index).show();
		
           index++;
          if(index == len) {index = 0;}
        },2000);
       }).trigger("mouseleave");
	     
	   
       /*显示index图片*/
       function showPic(index){
       var nowLeft = -index*liWidth;
       jdlis.eq(index).css('backgroundColor','#6C6C6C');  
       jdlis.not(jdlis.eq(index)).css('backgroundColor','#B7B7B7');
      $("#DynamicImg ul").stop(true,false).animate({"left":nowLeft},300);	
      /*$('#loginimg').hide().fadeIn(1000);*/
	  
       }
	   
	   
      $('.slideshortcut a').mouseover(function()
       {
         $('.slideshortcut a').show();
      });
      $('.prev').mouseover(
     function()
     {
        $(this).css({opacity:'0.95',cursor:'pointer'});
      });
      $('.next').mouseover(
       function()
      {
       $(this).css({opacity:'0.95',cursor:'pointer'});
       });
      /*点击焦点区的div显示对应图*/
     jdlis.click(
     function(){
       clearInterval(timer);
       index = jdlis.index(this);
        showPic(index);
		
		 /*点击焦点区的div显示对应图的文字介绍*/
		$(".slider_p_div").hide();
		$("#slider_p"+index).show();
		
     });
   });