/*
 * SlideTabs - Touch Extension
 *
 * @version 1.0
 * 
 */
(function($)
	{
	$.extend($.stCore,
		{
		tabs_initTouch:function()
			{
			if(this.val.isTouch)
				{
				this.tabs_setSwipeLength();
				this.tabs.maxXY=0+this.conf.offsetBR;
				this.tabs_bindTouch();
				this.tabs.isAnim=false;
				this.tabs.dist=0
			}
		}
		,tabs_setSwipeLength:function()
			{
			var a=this.tabs_getTotalLength(),limitXY=(a-this.val.tabsSlideLength);
			this.tabs.minXY=-limitXY-this.conf.offsetTL
		}
		,tabs_bindTouch:function()
			{
			var a=this;
			a.$a.unbind('dragstart').bind('dragstart',function()
				{
				return false
			}
			);
			a.$tabsInnerCont.unbind('touchstart').bind('touchstart',function(e)
				{
				a.tabs_touchStart(e)
			}
			)
		}
		,tabs_unbindTouch:function()
			{
			this.$tabsInnerCont.unbind('touchstart')
		}
		,tabs_touchStart:function(a)
			{
			if(this.tabs.isAnim)
				{
				a.preventDefault();
				return false
			}
			var b=this,te=a.originalEvent.touches;
			if(te&&te.length==1)
				{
				b.e=te[0]
			}
			else
				{
				return false
			}
			b.$doc.bind('touchmove',function(e)
				{
				b.tabs_touchMove(e)
			}
			);
			b.$doc.bind('touchend',function(e)
				{
				b.tabs_touchEnd(e)
			}
			);
			if(b.val.useWebKit)
				{
				b.$tabs.css('-webkit-transition-duration','0')
			}
			b.tabs.eXY=b.tabs.start=b.e[b.val.clientXY];
			if(b.val.useWebKit)
				{
				b.tabs.startXY=b.tabs_WebKitPosition(b.$tabs,b.val.arrPos)
			}
			else
				{
				b.tabs.startXY=parseInt(b.$tabs.css(b.val.css))
			}
			b.tabs.minMouseXY=b.tabs.eXY-b.tabs.startXY+b.tabs.minXY;
			b.tabs.maxMouseXY=b.tabs.minMouseXY+b.tabs.maxXY-b.tabs.minXY;
			b.tabs.acc=b.tabs.startXY;
			b.tabs.startTs=Date.now();
			return false
		}
		,tabs_touchMove:function(a)
			{
			a.preventDefault();
			var b=a.originalEvent.touches;
			if(b.length>1)
				{
				return false
			}
			this.e=b[0];
			var c=this.tabs.end=this.e[this.val.clientXY];
			c=Math.max(c,this.tabs.minMouseXY);
			c=Math.min(c,this.tabs.maxMouseXY);
			this.tabs.lastPos=this.tabs.currPos;
			this.tabs.dist=(c-this.tabs.eXY);
			if(this.tabs.lastPos!=this.tabs.dist)
				{
				this.tabs.currPos=this.tabs.dist
			}
			this.tabs.newXY=this.tabs.startXY+this.tabs.dist;
			if(Math.abs(this.tabs.end-this.tabs.eXY)>0)
				{
				this.tabs_setIsAnim(true,'pause')
			}
			this.$tabs.css(this.val.css,this.val.pre+this.tabs.newXY+this.val.px);
			var d=Date.now();
			if(d-this.tabs.startTs>350)
				{
				this.tabs.startTs=d;
				this.tabs.acc=this.tabs.startXY+this.tabs.dist
			}
			return false
		}
		,tabs_touchEnd:function(a)
			{
			this.$doc.unbind('touchmove').unbind('touchend');
			if(this.val.useWebKit)
				{
				this.tabs.endXY=this.tabs_WebKitPosition(this.$tabs,this.val.arrPos)
			}
			else
				{
				this.tabs.endXY=parseInt(this.$tabs.css(this.val.css))
			}
			this.tabs.endXY=(isNaN(this.tabs.endXY))?0:this.tabs.endXY;
			this.margin=Math.abs(this.tabs.endXY);
			var b=this,dist=Math.abs(this.tabs.dist);
			if(dist==0)
				{
				if(this.margin==0+this.conf.offsetTL)
					{
					setTimeout(function()
						{
						b.tabs.isAnim=false
					}
					,100)
				}
				else if(this.margin==Math.abs(this.tabs.minXY))
					{
					setTimeout(function()
						{
						b.tabs.isAnim=false
					}
					,100)
				}
				return false
			}
			var c=Math.max(40,(Date.now())-this.tabs.startTs),accDist=Math.abs(this.tabs.acc-this.tabs.endXY),speed=accDist/c,subtDist=Math.abs(this.val.tabsSlideLength-dist);
			this.tabs.swipeSpeed=Math.max((subtDist)/speed,200);
			this.tabs.swipeSpeed=Math.min(this.tabs.swipeSpeed,600);
			this.tabs.swipeSpeed=(isNaN(this.tabs.swipeSpeed))?300:this.tabs.swipeSpeed;
			if(this.margin==0)
				{
				if(this.conf.buttonsFunction=='slide'&&!this.conf.tabsLoop)
					{
					this.tabs_disableButton(this.$prev);
					this.tabs_enableButton(this.$next)
				}
				setTimeout(function()
					{
					b.tabs_setIsAnim(false,'resume')
				}
				,100);
				return false
			}
			else if(this.margin==Math.abs(this.tabs.minXY))
				{
				if(this.conf.buttonsFunction=='slide'&&!this.conf.tabsLoop)
					{
					this.tabs_disableButton(this.$next);
					this.tabs_enableButton(this.$prev)
				}
				setTimeout(function()
					{
					b.tabs_setIsAnim(false,'resume')
				}
				,100);
				return false
			}
			if(dist>30)
				{
				if(this.tabs.start>this.tabs.end)
					{
					if(this.tabs.lastPos<this.tabs.currPos)
						{
						this.tabs_slideBack(this.tabs.swipeSpeed);
						return false
					}
					this.tabs_slideNext(this.tabs.swipeSpeed)
				}
				else if(this.tabs.start<this.tabs.end)
					{
					if(this.tabs.lastPos>this.tabs.currPos)
						{
						this.tabs_slideBack(this.tabs.swipeSpeed);
						return false
					}
					this.tabs_slidePrev(this.tabs.swipeSpeed)
				}
				else
					{
					this.tabs_slideBack(200)
				}
			}
			else
				{
				this.tabs_slideBack(200)
			}
			this.tabs.dist=0;
			return false
		}
		,tabs_slideBack:function(a)
			{
			var b=this;
			if(b.val.useWebKit)
				{
				b.tabs_bindWebKitCallback();
				b.$tabs.css(
					{
					'-webkit-transition-duration':a+'ms','-webkit-transition-timing-function':'ease-out'
				}
				).css(b.val.css,b.val.pre+b.tabs.startXY+b.val.px)
			}
			else
				{
				if(b.conf.orientation=='horizontal')
					{
					b.$tabs.animate(
						{
						'marginLeft':b.tabs.startXY+'px'
					}
					,a,'easeOutSine',function()
						{
						b.tabs_setIsAnim(false,'resume')
					}
					)
				}
				else
					{
					b.$tabs.animate(
						{
						'marginTop':b.tabs.startXY+'px'
					}
					,a,'easeOutSine',function()
						{
						b.tabs_setIsAnim(false,'resume')
					}
					)
				}
			}
			b.margin=Math.abs(b.tabs.startXY)
		}
		,content_initTouch:function()
			{
			if(this.val.isTouch)
				{
				if(this.$a.length>1&&this.content.animIsSlide)
					{
					this.content.isTouch=true;
					this.content.startEvent='touchstart';
					this.content.moveEvent='touchmove';
					this.content.endEvent='touchend';
					this.content.cancelEvent='touchcancel';
					this.content_bindTouch()
				}
			}
		}
		,content_bindTouch:function()
			{
			var b=this;
			b.$contentCont.find('.'+b.conf.classNoTouch).unbind('mousedown').unbind('touchstart').bind('mousedown touchstart',function(a)
				{
				a.stopImmediatePropagation()
			}
			);
			b.$views.unbind(this.content.startEvent).bind(this.content.startEvent,function(e)
				{
				b.content_touchStart(e)
			}
			)
		}
		,content_unbindTouch:function()
			{
			this.content.isTouch=false;
			this.$views.unbind(this.content.startEvent)
		}
		,content_slideBack:function(a)
			{
			this.content.isAnim=true;
			var b=this;
			if(b.val.useWebKit)
				{
				b.content_bindWebKitCallback(true);
				b.$currentView.css(
					{
					'-webkit-transition-duration':a+'ms','-webkit-transition-timing-function':'ease-out'
				}
				).css(b.content.css,b.content.pre+'0'+b.content.px);
				b.$prevView.css(
					{
					'-webkit-transition-duration':a+'ms','-webkit-transition-timing-function':'ease-out'
				}
				).css(b.content.css,b.content.pre+ -b.content.slideLength+b.content.px);
				b.$nextView.css(
					{
					'-webkit-transition-duration':a+'ms','-webkit-transition-timing-function':'ease-out'
				}
				).css(b.content.css,b.content.pre+b.content.slideLength+b.content.px)
			}
			else
				{
				if(b.conf.contentAnim=='slideV')
					{
					b.$prevView.animate(
						{
						'top':-b.content.slideLength+'px'
					}
					,a,'easeOutSine');
					b.$nextView.animate(
						{
						'top':b.content.slideLength+'px'
					}
					,a,'easeOutSine');
					b.$currentView.animate(
						{
						'top':'0px'
					}
					,a,'easeOutSine',function()
						{
						b.content_setIsAnim(false,'resume');
						b.content_slideBackRePos()
					}
					)
				}
				else
					{
					b.$prevView.animate(
						{
						'left':-b.content.slideLength+'px'
					}
					,a,'easeOutSine');
					b.$nextView.animate(
						{
						'left':b.content.slideLength+'px'
					}
					,a,'easeOutSine');
					b.$currentView.animate(
						{
						'left':'0px'
					}
					,a,'easeOutSine',function()
						{
						b.content_setIsAnim(false,'resume');
						b.content_slideBackRePos()
					}
					)
				}
			}
		}
		,content_slideBackRePos:function()
			{
			if(this.val.useWebKit)
				{
				this.$prevView.css('-webkit-transition-duration','0ms');
				this.$nextView.css('-webkit-transition-duration','0ms')
			}
			this.$prevView.css(this.content.css,this.content.pre+this.conf.viewportOffset+this.content.px);
			this.$nextView.css(this.content.css,this.content.pre+this.conf.viewportOffset+this.content.px)
		}
		,content_touchStart:function(a)
			{
			if(this.content.isAnim||this.tabs.isAnim||this.tabs.xhr)
				{
				return false
			}
			if(this.content.isMoving)
				{
				return false
			}
			var b=this,te=a.originalEvent.touches;
			if(te&&te.length>0)
				{
				this.e=te[0];
				this.content.isMoving=true
			}
			else
				{
				return false
			}
			if(this.conf.autoplay==true)
				{
				this.autoplay_pause(false)
			}
			this.content.dirCheck=false;
			this.$doc.bind(this.content.moveEvent,function(e)
				{
				b.content_touchMove(e)
			}
			);
			this.$doc.bind(this.content.endEvent,function(e)
				{
				b.content_touchEnd(e)
			}
			);
			this.$prevView=this.$currentView.prev('div');
			this.$nextView=this.$currentView.next('div');
			var c=parseInt(b.$contentCont.css(this.content.wh));
			this.content.minXY=-c;
			this.content.maxXY=c;
			this.content.prevViewWH=-this.$prevView[this.content.owh](false);
			this.content.nextViewWH=this.$contentCont[this.content.wh]();
			if(this.val.useWebKit)
				{
				this.$currentView.css('-webkit-transition-duration','0');
				this.$prevView.css('-webkit-transition-duration','0');
				this.$nextView.css('-webkit-transition-duration','0')
			}
			this.content.eX=this.e.pageX;
			this.content.eY=this.e.pageY;
			this.content.eXY=this.content.start=this.e[this.content.clientXY];
			this.content.startXY=parseInt(this.$currentView.css(this.content.css));
			this.content.startXY=(isNaN(this.content.startXY))?0:this.content.startXY;
			this.content.minMouseXY=this.content.eXY-this.content.startXY+this.content.minXY;
			this.content.maxMouseXY=this.content.minMouseXY+this.content.maxXY-this.content.minXY;
			this.content.acc=this.content.startXY;
			this.content.startTs=Date.now()
		}
		,content_touchMoveReturn:function()
			{
			this.$currentView.css(this.content.css,this.content.pre+0+this.content.px);
			this.$prevView.css(this.content.css,this.content.pre+this.content.prevViewWH+this.content.px);
			this.$nextView.css(this.content.css,this.content.pre+this.content.nextViewWH+this.content.px);
			this.content_setIsAnim(false,'resume')
		}
		,content_touchDir:function(e,a)
			{
			var b=(Math.abs(e.pageX-this.content.eX)-Math.abs(e.pageY-this.content.eY))-(a?-5:5);
			if(b>5)
				{
				return'x'
			}
			else if(b<-5)
				{
				return'y'
			}
		}
		,content_touchMove:function(a)
			{
			if(this.content.dirBlock)
				{
				return
			}
			var b=a.originalEvent.touches;
			if(b.length>1)
				{
				this.content_touchEnd(a);
				return
			}
			else
				{
				this.e=b[0]
			}
			if(!this.content.dirCheck)
				{
				var c=(this.conf.contentAnim=='slideH')?true:false,dir=this.content_touchDir(this.e,c);
				if(dir=='x')
					{
					if(c)
						{
						a.preventDefault()
					}
					else
						{
						this.content.dirBlock=true;
						this.content_touchEnd(this.e,true)
					}
					this.content.dirCheck=true
				}
				else if(dir=='y')
					{
					if(c)
						{
						this.content.dirBlock=true;
						this.content_touchEnd(this.e,true)
					}
					else
						{
						a.preventDefault()
					}
					this.content.dirCheck=true
				}
				return
			}
			a.preventDefault();
			var d=this.content.end=this.e[this.content.clientXY];
			d=Math.max(d,this.content.minMouseXY);
			d=Math.min(d,this.content.maxMouseXY);
			this.content.lastPos=this.content.currPos;
			this.content.dist=(d-this.content.eXY);
			if(this.content.lastPos!=this.content.dist)
				{
				this.content.currPos=this.content.dist
			}
			if(!this.$prevView.length)
				{
				if(this.content.dist>0)
					{
					this.content_touchMoveReturn();
					return false
				}
			}
			else if(!this.$nextView.length)
				{
				if(this.content.dist<0)
					{
					this.content_touchMoveReturn();
					return false
				}
			}
			this.content.newXY=this.content.startXY+this.content.dist;
			var e=this.content.newXY+this.content.prevViewWH,nextXY=this.content.newXY+this.content.nextViewWH;
			this.$currentView.css(this.content.css,this.content.pre+this.content.newXY+this.content.px);
			this.$prevView.css(this.content.css,this.content.pre+e+this.content.px);
			this.$nextView.css(this.content.css,this.content.pre+nextXY+this.content.px);
			var f=Date.now();
			if(f-this.content.startTs>350)
				{
				this.content.startTs=f;
				this.content.acc=this.content.startXY+this.content.dist
			}
		}
		,content_touchEnd:function(a,b)
			{
			this.$doc.unbind(this.content.moveEvent).unbind(this.content.endEvent);
			this.content.isMoving=false;
			this.content.dirBlock=false;
			this.content.dirCheck=false;
			if(b)
				{
				return
			}
			this.content.slideLength=this.$contentCont[this.content.wh]();
			var c=Math.abs(this.content.dist),endXY;
			if(this.val.useWebKit)
				{
				endXY=this.tabs_WebKitPosition(this.$currentView,this.content.arrPos)
			}
			else
				{
				endXY=parseInt(this.$currentView.css(this.content.css))
			}
			endXY=(isNaN(endXY))?0:endXY;
			if(c==0||endXY==0)
				{
				this.content_slideBackRePos();
				return false
			}
			var d=Math.max(40,(Date.now())-this.content.startTs),accDist=Math.abs(this.content.acc-this.content.dist),speed=accDist/d,subtDist=Math.abs(this.content.slideLength-c);
			var e=this;
			this.content.swipeSpeed=Math.max((subtDist)/speed,200);
			this.content.swipeSpeed=Math.min(this.content.swipeSpeed,600);
			this.content.swipeSpeed=(isNaN(this.content.swipeSpeed))?300:this.content.swipeSpeed;
			if(c>60)
				{
				var f;
				if(this.content.start>this.content.end)
					{
					if(this.content.lastPos<this.content.currPos)
						{
						this.content_slideBack(this.content.swipeSpeed);
						return false
					}
					f=this.$tab.parent('li').next('li').children('a')
				}
				else if(this.content.start<this.content.end)
					{
					if(this.content.lastPos>this.content.currPos)
						{
						this.content_slideBack(this.content.swipeSpeed);
						return false
					}
					f=this.$tab.parent('li').prev('li').children('a')
				}
				if(f&&f.length)
					{
					this.tabs_click(f,true,this.content.swipeSpeed)
				}
				else
					{
					this.content_slideBack(200)
				}
				if(c==this.content.maxXY)
					{
					this.content_setIsAnim(false,'resume');
					this.content_rePositionView()
				}
			}
			else
				{
				this.content_slideBack(200)
			}
			this.content.dist=0;
			return false
		}
	}
	);
	$.stExtend.tabsTouch=$.stCore.tabs_initTouch;
	$.stExtend.contentTouch=$.stCore.content_initTouch
}
)(jQuery);
