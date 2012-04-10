(function($){
	$.fn.cSlider = function(options){
		var defaults = {
			imgctr:'imgctr',
			/*
				ul.imgctr>li*3>img
			*/
			numctr:'numctr',
			/*
				div.numctr>a.active
			*/
			itvTime :5000,
			traTime :1000,
			debug	:false
		}
		var opts = $.extend(defaults, options);
		this.each(function(i,ele){
			var priVar = {};
			var $this   = $(ele);
			var $imgctr = $this.find('.' + opts.imgctr);
			var $numctr =  $this.find('.' + opts.numctr);
			priVar.cCount = $imgctr.find('li').length;
			priVar.interv = null;
			priVar.idxNxt = 0;
			priVar.idxCur = 0;
			$imgctr.find('li').hide();
			addController();
			priVar.interv = setInterval(changeIndex, opts.itvTime);

			function debug(info) {
				if (opts.debug && console.log) {
					console.log(info);
				}
			}
			function changeIndex() {
				$numctr.find('a').each(function(idx,ele){
					if ($(ele).hasClass('active')) {
						priVar.idxCur = idx;
					}
				})
				priVar.idxNxt = Number(priVar.idxCur + 1)
				if (priVar.idxNxt == priVar.cCount) {
					priVar.idxNxt = 0;
				}
				//console.log(idxNxt);
				$imgctr.find('li').fadeOut();
				$imgctr.find('li').eq(priVar.idxNxt).fadeIn();
				$numctr.find('a').removeClass('active');
				$numctr.find('a').eq(priVar.idxNxt).addClass('active');
			}

			function addController(){
				var htmlStr = '';
				for (var i = 1; i <= priVar.cCount; i++) {
					htmlStr += '<a>'+ i +'</a>';
				};
				$numctr.append(htmlStr);
				$numctr.find('a').eq(0).addClass('active');
				$imgctr.find('li').eq(0).fadeIn();
				$numctr.find('a').bind('mouseover',function(){
					clearInterval(priVar.interv);
					priVar.curIdx = $(this).index();
					$imgctr.find('li').fadeOut();
					$imgctr.find('li').eq(priVar.curIdx).fadeIn();
					$numctr.find('a').removeClass('active');
					$numctr.find('a').eq(priVar.curIdx).addClass('active');
				})
				$numctr.find('a').bind('mouseout',function(){
					interv = setInterval(changeIndex, opts.itvTime);
					//$this.find('li').eq(idxCur).fadeIn();

				})
			}
		})
	}
})(jQuery)





































// 自定义全局变量
if (typeof(Sys) == "undefined") {
	var Sys = {};
}
$(function() {
	// marked topnav
	$('#menu_'+Sys.topid).addClass('active');

	// marked sidebar
	$('#sideMenu_'+Sys.catid).addClass('active');
	//顶部导航
	$('nav>ul>li>.top-submenu').hide();
	$('nav>ul>li').hover(function(){
		$(this).find('.top-submenu').slideDown(200);
	},function(){
		$(this).find('.top-submenu').slideUp(100);
	})


	// 导航切换背景滚动
	$( "nav.top>ul>li[class!=active]>a" ).hover(function(){
		Sys.navBp = $( this ).backgroundPosition();
		$( this ).stop().animate( {backgroundPosition:"("+Sys.navBp.x+' '+(Sys.navBp.y+57)+")"}, {duration:200});
	} , function(){
		$( this ).stop().animate( {backgroundPosition:"("+Sys.navBp.x+' '+(Sys.navBp.y)+")"}, {duration:200});
	});

	// 年份选择效果
	$('#progressYearSelect>li').click(function(){
		$('#progressYearSelect>li').removeClass('active');
		$(this).addClass('active');
		Sys.assoc = $(this).attr('assoc');
		Sys.year  = $(this).text();
		$('#progressYear').text(Sys.year);
		$('#yearThings>.year-thing-item').hide()
		//debug(Sys.assoc);
		$('#'+Sys.assoc).show()
	})

	/*过程移动单元*/
	Sys.progressNavLen = $('#progressYearSelect>li').length;
	Sys.progressMoveUnit = $('#progressYearSelect>li').eq(0).outerWidth(true);
	Sys.ie6 = ($.browser.msie && $.browser.version == '6.0') ? true : false;
	Sys.progressOffset = 0;
	$('#progressNext').click(function(){
		//var offset = Sys.ie6 ? $('#progressYearSelect').position().left - 22 : $('#progressYearSelect').position().left;
		Sys.progressOffset = $('#progressYearSelect').position().left / Sys.progressMoveUnit;
		if(Sys.progressNavLen>10 && (Math.abs(Sys.progressOffset) < (Sys.progressNavLen-10))) {
			Sys.progressOffset--;
			$('#progressYearSelect').animate({'left':Sys.progressMoveUnit * Sys.progressOffset+'px'},300);

		}
	})
	$('#progressPrev').click(function(){
		Sys.progressOffset = $('#progressYearSelect').position().left / Sys.progressMoveUnit;
		//alert($('#progressYearSelect').position().left);
		if(Sys.progressNavLen>10 && Sys.progressOffset!=0 && (Sys.progressOffset < (Sys.progressNavLen-10))) {
			Sys.progressOffset++;
			$('#progressYearSelect').animate({'left':Sys.progressMoveUnit * Sys.progressOffset+'px'},300);
			//alert(Sys.progressMoveUnit);
		}
	})

	Sys.idxIntervalTime = 4000;
	Sys.idxIntervali    = 0;
	Sys.idxInterval = setInterval(toggleIndex,Sys.idxIntervalTime);
	Sys.idxIntervalLen = $('#idxBanner').length;
	$('#idxNewslist>li').hover(function(){
		$(this).parent('#idxNewslist').find('li').removeClass('active').addClass('noactive');
		$(this).removeClass('noactive').addClass('active')
	})

	$('.use-ctr').cSlider({imgctr:'use-imgctr',numctr:'num-count',debug:true});

	
})
function toggleIndex(){
	if (Sys.idxIntervali>Sys.idxIntervalLen) {
		Sys.idxIntervali = 0;
	} else {
		Sys.idxIntervali++;
	}
	debug(Sys.idxIntervali);
	$('#idxBanner>img').fadeOut(900);
	$('#idxBanner>img').eq(Sys.idxIntervali).fadeIn(600);
}

function locationTo(th){
	if ($(th).val() != '友情链接') {
		window.location.href = $(th).val();
	}
}
function debug(info){
	if(window.console != undefined) {
		console.log(info);
	}
}

