// 自定义全局变量
$(function() {
    var ua = navigator.userAgent.toLowerCase();
    if (window.ActiveXObject)
        Sys.ie = ua.match(/msie ([\d.]+)/)[1]
    else if (document.getBoxObjectFor)
        Sys.firefox = ua.match(/firefox\/([\d.]+)/)[1]
    else if (window.MessageEvent && !document.getBoxObjectFor)
        Sys.chrome = ua.match(/chrome\/([\d.]+)/)[1]
    else if (window.opera)
        Sys.opera = ua.match(/opera.([\d.]+)/)[1]
    else if (window.openDatabase)
        Sys.safari = ua.match(/version\/([\d.]+)/)[1];
    
    /*添加首页hover*/
	$('#menu_'+Sys.topid).addClass('hover');
	$('#subcat_'+Sys.catid).addClass('active');
	/* 首页 新闻 效果*/
	$( ".index-news" ).hover(function(){
		$( this ).find('h2').stop().animate( {backgroundPosition:"(-320px 0px)"}, {duration:200});
		Sys.idx_news_bp = $( this ).find('a').backgroundPosition();
		$( this ).find('a').stop().animate( {backgroundPosition:"("+Sys.idx_news_bp.x+' '+(Sys.idx_news_bp.y+28)+")"}, {duration:200});
	} , function(){
		$( this ).find('h2').stop().animate( {backgroundPosition:"(0px 0px)"}, {duration:200});
		$( this ).find('a').stop().animate( {backgroundPosition:"("+Sys.idx_news_bp.x+' '+(Sys.idx_news_bp.y)+")"}, {duration:200});
	});

	/* 首页banner 滑过显示*/
	$('.index-banner .details').each(function () {
		//console.log($(this).width());
		$(this).append('<div class="mask" style="width:'+$(this).width()+'px;height:'+$(this).height()+'px;margin-top:-'+$(this).height()+'px"/>');
		$(this).css('margin-bottom', '-'+$(this).height()+'px');
	});

	$('.index-banner .mosaic').hover(function(){
			$(this).find('.details').animate({marginBottom:'0px'}, 300);
		}, function(){
			$(this).find('.details').animate({marginBottom:'-'+$(this).height()+'px'}, 300);
	});

	/* 首页banner 切换特效*/
	$('#index_big_cycle').cycle({
	    fx:    'fade',
	    speed:  2000
	 });
	$('#index_small_cycle').cycle({
	    fx:    'fade',
	    speed:  1500
	 });

	/* 首页规划图片特效*/
	$('.index-plan a').css('display', 'none');
	$('.index-plan>.ym-230>div').hover(function () {
		$(this).find('a').fadeTo(500,1,'easeInOutCirc');
	}, function () {
		$(this).find('a').fadeOut(200,0,'easeInOutCirc');
	});


	/*导航渐进*/
	$( "#nav>ul>li[class!=hover]>a" ).hover(function() {
		Sys.navpos = $(this).backgroundPosition();
		$( this ).stop().animate( {backgroundPosition:"("+Sys.navpos.x+' '+(Sys.navpos.y+19)+")"}, {duration:200});
	} , function(){
		$( this ).stop().animate( {backgroundPosition:"("+Sys.navpos.x+' '+Sys.navpos.y+")"}, {duration:200});
	});


	/*子菜单背景滑动*/
	$( ".submenu>ul>li" ).hover(function(){
		if ($(this).hasClass('active')){
			$(this).attr('woca', 'nnd');
		} else if ($(this).hasClass('normal')) {
			$( this ).removeClass('normal').addClass('normal')
			.stop().animate( {backgroundPosition:"(-642px -1870px)"}, {duration:200});
		} else if($(this).hasClass('normalnobg')) {
			$( this ).removeClass('normal').addClass('normalnobg')
			.stop().animate( {backgroundPosition:"(-642px -1870px)"}, {duration:200});
		}
	}, function(){
		if ($(this).hasClass('active')){
			$(this).attr('woca', 'ddn');
		} else if ($(this).hasClass('normal')) {
			$( this ).removeClass('normal').addClass('normal')
			.stop().animate( {backgroundPosition:"(-642px -1898px)"}, {duration:200});
		} else if($(this).hasClass('normalnobg')) {
			$( this ).removeClass('normalnobg').addClass('normalnobg')
			.stop().animate( {backgroundPosition:"(-642px -1842px)"}, {duration:200});
		}
	});

	/*子菜单plan背景效果*/
	$( ".plan>ul>li[class!=active]" ).hover(function(){
		if ($(this).hasClass('normal')) {
			$( this ).stop().animate( {backgroundPosition:"(-642px -992px)"}, {duration:200})
				.find('span').stop().animate( {backgroundPosition:"(-642px -1136px)"}, {duration:1})
		}
	}, function(){
		if ($(this).hasClass('normal')) {
			$( this ).stop().animate( {backgroundPosition:"(-642px -1022px)"}, {duration:200})
				.find('span').stop().animate( {backgroundPosition:"(-642px -1072px)"}, {duration:1});
		}
	});

	/*
		产品栏目页图片滑过
	*/
	$('#cat_product_slide li').eq(0).find('img').css('border', '1px solid #fe9903');
	$('#cat_product_slide>img').attr('src',$('#cat_product_slide li').eq(0).find('img').attr('bigsrc'));
	$('#cat_product_slide li').mouseover(function(){
		$('#cat_product_slide li').each(function(){
			$(this).find('img').css('border', '1px solid #ccc');
		})
		$(this).find('img').css('border', '1px solid #fe9903');
		var offsetLeft;
		if (Sys.ie=="6.0") {
			offsetLeft = 9;
		} else if(Sys.ie="7.0") {
			offsetLeft = 9;
		} else if(Sys.ie="8.0") {
			offsetLeft = 8;
		}else{
			offsetLeft = 8;
		}

		$('#cat_product_slide').find('.hover').stop().animate({top:$(this).position().top+51,left: offsetLeft}, 500);
		$('#cat_product_slide>img').fadeOut(200).stop().attr('src', $(this).find('img').attr('bigsrc')).fadeIn(500);
	})

	/*
		产品分类鼠标滑过显示
	*/
	$('#cat_product_nav>ul>li .cat-products-subnav').hide();
	$('#cat_product_nav>ul>li').hover(function(){
		$('#cat_product_nav>ul>li').css('z-index', 1);
		$(this).css('z-index', 333);
		$(this).find('.cat-products-subnav').show();
	},function(){
		$(this).find('.cat-products-subnav').hide();
	})

	/*
		列表页产品分类鼠标滑过显示
	*/

	$('#list_product_nav>li .list-show-pro-subnav').hide();
	$('#list_product_nav>li.nav').hover(function(){
		$('#list_product_nav>li').css('z-index', 1);
		$(this).css('z-index', 333);
		$(this).find('.list-show-pro-subnav').show();
	},function(){
		$(this).find('.list-show-pro-subnav').hide();
	})

	$('.cat-case-sucess').hover(function(){
		$(this).switchClass('cat-case-sucess', 'js-cat-case-sucess', 200)
	},function(){
		$(this).switchClass('js-cat-case-sucess', 'cat-case-sucess', 200)
	})

	/*产品滚动效果*/
	$(function(){
		 var indexs = 0;
		 var lens=$("#products_new > ul > li").length;
		 Sys.interval = setInterval('float_pros()', 3000);
		 $('#products_new').css({"margin-left": "0px"}, 400, "swing");
			$("#toright").click(function(){
				if (indexs >= (lens-6) ) {
					return
				} else {
					indexs++
				}
				animatelefts(indexs)
			});
			$("#toleft").click(function(){
				if (indexs <=0 ) {
					return
				} else {
					indexs--
				}
				animatelefts(indexs)
			})
			function animatelefts(indexs){
				var pro_width = $("#products_new > ul > li").width()+7;
				$("#products_new > ul").stop(true,false).animate({left :-pro_width*(indexs)},1000);
			}
			$("#toright").hover(function(){
				clearInterval(Sys.interval);
				$(this).addClass('s-cat-pro-right');
			},function () {
				$(this).removeClass('s-cat-pro-right');
				Sys.interval = setInterval('float_pros()', 3000);
			});
			$("#toleft").hover(function(){
				clearInterval(Sys.interval);
				$(this).addClass('s-cat-pro-left');
			}, function () {
				$(this).removeClass('s-cat-pro-left');
				Sys.interval = setInterval('float_pros()', 3000);
			})
			$('#products_new>ul>li').hover(function(){
				clearInterval(Sys.interval);
			}, function(){
				Sys.interval = setInterval('float_pros()', 3000);
			})
	});


	/*团队滚动效果*/
	$(function(){
		 var indexs = 0;
		 var lens=$("#cat_team_move > li").length;
		 Sys.teaminterval = setInterval('float_team()', 3000);
		 $('#cat_team_move').css({"margin-left": "0px"}, 400, "swing");
			$("#team_toright").click(function(){
				if (indexs >= (lens-4) ) {
					return
				} else {
					indexs++
				}
				animate_team(indexs)
			});
			$("#team_toleft").click(function(){
				if (indexs <=0 ) {
					return
				} else {
					indexs--
				}
				animate_team(indexs)
			})
			function animate_team(indexs){
				var pro_width = $("#cat_team_move > li").width()+17;
				//console.log(pro_width);
				$("#cat_team_move").stop(true,false).animate({left :-pro_width*(indexs)},1000);
			}
			$("#team_toright").hover(function(){
				clearInterval(Sys.teaminterval);
				$(this).addClass('s-cat-team-right');
			},function () {
				$(this).removeClass('s-cat-team-right');
				Sys.teaminterval = setInterval('float_team()', 3000);
			});
			$("#team_toleft").hover(function(){
				clearInterval(Sys.teaminterval);
				$(this).addClass('s-cat-team-left');
			}, function () {
				$(this).removeClass('s-cat-team-left');
				Sys.teaminterval = setInterval('float_team()', 3000);
			})
			$('#products_new>ul>li').hover(function(){
				clearInterval(Sys.teaminterval);
			}, function(){
				Sys.teaminterval = setInterval('float_team()', 3000);
			})
	});

	// 邮件订阅
	$('#mail_subscription').click(function(){
		$.blockUI({ 
            message: $('#mail_subscription_ctr'), 
            css: { top: '20%' } 
        }); 
	})

})

/* defined functions */
function float_pros(){
	var clens=$("#cat_pro_new > li").length;
	var idx = Number($('#cat_pro_new').attr('idx'));

	if (idx == (clens-6) ){
		Sys.toright = false;
	}
	if (idx == 0 ){
		Sys.toright = true;
	}
	if (Sys.toright) {
		idx++;
		$("#toright").trigger('click');
	} else {
		idx--;
		$("#toleft").trigger('click');
	}
	$('#cat_pro_new').attr('idx', idx);
}

function float_team(){
	var clens=$("#cat_team_move > li").length;
	var idx = Number($('#cat_team_move').attr('idx'));

	if (idx == (clens-4) ){
		Sys.team_toright = false;
	}
	if (idx == 0 ){
		Sys.team_toright = true;
	}
	if (Sys.team_toright) {
		idx++;
		$("#team_toright").trigger('click');
	} else {
		idx--;
		$("#team_toright").trigger('click');
	}
	$('#cat_team_move').attr('idx', idx);
}