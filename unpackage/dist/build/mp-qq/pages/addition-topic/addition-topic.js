(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/addition-topic/addition-topic"],{"26ea":function(t,e,i){"use strict";i.r(e);var n=i("5908"),o=i("4e44");for(var s in o)"default"!==s&&function(t){i.d(e,t,function(){return o[t]})}(s);i("508a");var a=i("2877"),c=Object(a["a"])(o["default"],n["a"],n["b"],!1,null,null,null);e["default"]=c.exports},"4e44":function(t,e,i){"use strict";i.r(e);var n=i("e1ca"),o=i.n(n);for(var s in n)"default"!==s&&function(t){i.d(e,t,function(){return n[t]})}(s);e["default"]=o.a},5908:function(t,e,i){"use strict";var n=function(){var t=this,e=t.$createElement;t._self._c},o=[];i.d(e,"a",function(){return n}),i.d(e,"b",function(){return o})},e1ca:function(t,e,i){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var n=a(i("66fd")),o=i("7469"),s=i("2f62");function a(t){return t&&t.__esModule?t:{default:t}}function c(t){for(var e=1;e<arguments.length;e++){var i=null!=arguments[e]?arguments[e]:{},n=Object.keys(i);"function"===typeof Object.getOwnPropertySymbols&&(n=n.concat(Object.getOwnPropertySymbols(i).filter(function(t){return Object.getOwnPropertyDescriptor(i,t).enumerable}))),n.forEach(function(e){r(t,e,i[e])})}return t}function r(t,e,i){return e in t?Object.defineProperty(t,e,{value:i,enumerable:!0,configurable:!0,writable:!0}):t[e]=i,t}var l=i("1541"),u={data:function(){return{title:"",content:"",isInput:!1,selectImageList:[],imageUrlList:[],isDisplayLocation:!0,isAnonymity:!1,scroll_height:700,showToast:!1,toastContent:"",displayTextarea:!1,displayContent:"对问题进行补充说明..."}},computed:c({},(0,s.mapState)({location:function(t){return t.UserLocation}})),onShareAppMessage:function(t){return{title:"我发布了新的话题，快来围观～～",path:"/pages/index/index",imageUrl:"/static/user/shareImage.jpg"}},mounted:function(){var t=this;setTimeout(function(){t.GetHeight()},100)},methods:{cancleTextareaInput:function(){this.displayTextarea=!1,""==this.content?this.displayContent="对问题进行补充说明...":this.displayContent=this.content},beginTextareaInput:function(){this.displayTextarea=!0},hideToast:function(t){this.showToast=!1},hideModal:function(t){this.showToast=!1},Submit:function(){var e=this;return""==this.title?(this.toastContent="问题不能为空",void(this.showToast=!0)):""==this.content?(this.toastContent="话题内容不能为空",void(this.showToast=!0)):(this.content=this.content.replace(/\r\n/g,"<br/>").replace(/\n/g,"<br/>").replace(/\s/g," "),void n.default.prototype.$http.request({url:"/topics/create",method:"POST",params:{topic_title:this.title,topic_content:this.content,topic_image:this.imageUrlList,is_display_location:this.isDisplayLocation,is_anonymity:this.isAnonymity,location:this.location.user_location.latitude+","+this.location.user_location.longitude}}).then(function(i){e.content="",e.displayContent="",e.$refs.notification.open({type:"success",content:"发布成功",timeout:1500,isClick:!1}),setTimeout(function(){t.navigateBack({delta:1})},1500),e.$store.dispatch("articleCountIncrement")}))},CheckboxOnclick:function(t){"anonymity"==t?this.isAnonymity=!this.isAnonymity:this.isDisplayLocation=!this.isDisplayLocation},ChooseImage:function(){var e=this;t.chooseImage({count:9,sizeType:["original","compressed"],sourceType:["album"],success:function(t){0!=e.selectImageList.length?e.selectImageList=e.selectImageList.concat(t.tempFilePaths):e.selectImageList=t.tempFilePaths,e.GetImageUrl()}})},GetImageUrl:function(){for(var e=this,i=l.formatTime(new Date),n=this.imageUrlList.length;n<this.selectImageList.length;n++)t.showLoading({title:"上传中 "+(n+1)+"/"+this.selectImageList.length,mask:!0}),(0,o.uploadFile)(this.selectImageList[n],"images/"+i+"/").then(function(t){e.imageUrlList.push(t),wx.hideLoading()}).catch(function(t){wx.hideLoading()})},ViewImage:function(e){t.previewImage({urls:this.selectImageList,current:e.currentTarget.dataset.url})},DelImg:function(t){this.selectImageList.splice(t.currentTarget.dataset.index,1),this.imageUrlList.splice(t.currentTarget.dataset.index,1)},GetHeight:function(){var e=this;t.getSystemInfo({success:function(i){e.screen_height=i.windowHeight,e.screen_width=i.windowWidth;var n=t.createSelectorQuery().in(e);n.select("#scroll").boundingClientRect(function(t){e.scroll_height=e.screen_height-t.top}).exec()}})}}};e.default=u}).call(this,i("a821")["default"])},f348:function(t,e,i){"use strict";(function(t){i("499b"),i("921b");n(i("66fd"));var e=n(i("26ea"));function n(t){return t&&t.__esModule?t:{default:t}}t(e.default)}).call(this,i("a821")["createPage"])}},[["f348","common/runtime","common/vendor"]]]);