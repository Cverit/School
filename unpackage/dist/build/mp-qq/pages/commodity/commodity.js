(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/commodity/commodity"],{a685:function(t,o,i){"use strict";(function(t){Object.defineProperty(o,"__esModule",{value:!0}),o.default=void 0;var e=c(i("66fd")),m=i("2f62"),n=c(i("60c5"));function c(t){return t&&t.__esModule?t:{default:t}}function s(t){for(var o=1;o<arguments.length;o++){var i=null!=arguments[o]?arguments[o]:{},e=Object.keys(i);"function"===typeof Object.getOwnPropertySymbols&&(e=e.concat(Object.getOwnPropertySymbols(i).filter(function(t){return Object.getOwnPropertyDescriptor(i,t).enumerable}))),e.forEach(function(o){d(t,o,i[o])})}return t}function d(t,o,i){return o in t?Object.defineProperty(t,o,{value:i,enumerable:!0,configurable:!0,writable:!0}):t[o]=i,t}var a=function(){return i.e("components/waterfall-flow/waterfall-flow").then(i.bind(null,"feaa"))},r=new n.default({key:"QL7BZ-ZCJKK-72IJS-A6NA6-HRJ3F-ZYB6J"}),u={data:function(){return{display:!1,commodity_id:0,scroll_height:700,commodityInfo:[],imageList:[],displayLocation:"",isInput:!1,inputComment:"",comment_page:1,showToast:!1,toastContent:"",fixedHeight:0,loading:!1}},components:{WaterfallFlow:a},computed:s({hasComment:function(){return 0!=this.commodityInfo.length&&0!=this.commodityInfo.commodity_comments.length}},(0,m.mapState)({user:function(t){return t.AuthUser}})),onShareAppMessage:function(t){return{title:"这个商品很不错，快来围观",path:"/pages/commodity/commodity?commodity_id="+this.commodity_id,imageUrl:"/static/user/shareImage.jpg"}},onLoad:function(t){var o=this;this.commodity_id=t.commodity_id;var i=this;this.loading=!0,e.default.prototype.$http.request({url:"/commodities/detail",method:"POST",params:{commodity_id:this.commodity_id}}).then(function(t){for(var e in o.commodityInfo=t.data.data,o.commodityInfo.commodity_images)o.imageList.push(o.commodityInfo.commodity_images[e].image_url);for(var m in o.commodityInfo.commodity_comments)o.formatTime(m);var n=o.commodityInfo.commodity_location.split(",");r.reverseGeocoder({location:{latitude:n[0],longitude:n[1]},success:function(t){i.displayLocation=t.result.address_component.city+t.result.address_component.district}}),setTimeout(function(){o.loading=!1},200)})},mounted:function(){var t=this;setTimeout(function(){t.display=!0},100),setTimeout(function(){t.getHeight()},200)},methods:{navigateUserShow:function(o){t.navigateTo({url:"/pages/user-show/user-show?user_id="+this.commodityInfo.commodity_user.user_id})},tooglrUserFollow:function(){var t=this;e.default.prototype.$http.request({url:"/users/follow",method:"POST",params:{accept_id:this.commodityInfo.commodity_user.user_id}}).then(function(o){t.commodityInfo.user_follow=!t.commodityInfo.user_follow,t.$refs.notification.open({type:"success",content:"操作成功",timeout:1500,isClick:!1})})},changeFixedHeight:function(t){this.fixedHeight=t.detail.height},hideModal:function(t){this.showToast=!1},formatCommodityContent:function(){this.commodityInfo.commodity_description=this.commodityInfo.commodity_description.replace(/<br\/\>/g,"\n")},navigateCommodity:function(o){t.navigateTo({url:"/pages/commodity/commodity?commodity_id="+o})},displayMoreComments:function(){this.comment_page++},likeComment:function(t,o){var i=this;e.default.prototype.$http.request({url:"/likes/comment",method:"POST",params:{comment_id:o}}).then(function(o){i.commodityInfo.commodity_comments[t].comment_like=!i.commodityInfo.commodity_comments[t].comment_like,i.commodityInfo.commodity_comments[t].comment_like?i.commodityInfo.commodity_comments[t].comment_likes++:i.commodityInfo.commodity_comments[t].comment_likes--,i.$refs.notification.open({type:"success",content:"操作成功",timeout:1500,isClick:!1})})},likeCommodity:function(){var t=this;e.default.prototype.$http.request({url:"/likes/commodity",method:"POST",params:{commodity_id:this.commodity_id}}).then(function(o){t.commodityInfo.commodity_like=!t.commodityInfo.commodity_like,t.commodityInfo.commodity_like?t.commodityInfo.commodity_likes++:t.commodityInfo.commodity_likes--,t.$refs.notification.open({type:"success",content:"操作成功",timeout:1500,isClick:!1})})},CollectCommodity:function(){var t=this;e.default.prototype.$http.request({url:"/collections/commodity",method:"POST",params:{commodity_id:this.commodity_id}}).then(function(o){t.commodityInfo.commodity_collect=!t.commodityInfo.commodity_collect,t.$refs.notification.open({type:"success",content:"操作成功",timeout:1500,isClick:!1})})},submitComment:function(){var t=this;""==this.inputComment&&this.$refs.notification.open({type:"warn",content:"留言不能为空～",timeout:1500,isClick:!1}),e.default.prototype.$http.request({url:"/comments/commodity/create",method:"POST",params:{commodity_id:this.commodity_id,comment_content:this.inputComment,parent_id:0}}).then(function(o){t.commodityInfo.commodity_comments.unshift(o.data.data),t.formatTime(0),t.inputComment="",t.$refs.notification.open({type:"success",content:"操作成功",timeout:1500,isClick:!1})}),this.cancelInput()},beginInput:function(){if(""==this.user.authentication||null==this.user.authentication)return this.toastContent="先去认证身份，再进行留言操作～～",void(this.showToast=!0);this.isInput=!0},cancelInput:function(){this.isInput=!1,this.fixedHeight=0},viewImage:function(o){t.previewImage({urls:this.imageList,current:o.currentTarget.dataset.url})},getHeight:function(){var o=this;t.getSystemInfo({success:function(i){o.screen_height=i.windowHeight,o.screen_width=i.windowWidth;var e=t.createSelectorQuery().in(o);e.select("#scroll").boundingClientRect(function(t){o.scroll_height=o.screen_height-t.top-50}).exec()}})},formatTime:function(t){var o=this.commodityInfo.commodity_comments[t].comment_created.split(" "),i=(new Date).toLocaleDateString(),e=Math.abs(Math.ceil((new Date(i)-new Date(o[0]))/864e5)),m=7-e;if(0===e)this.commodityInfo.commodity_comments[t].display_time="今天 "+o[1];else if(1===e)this.commodityInfo.commodity_comments[t].display_time="昨天 "+o[1];else if(2===e)this.commodityInfo.commodity_comments[t].display_time="前天 "+o[1];else if(m>0){var n=new Date(this.commodityInfo.commodity_comments[t].comment_created).getDay();switch(n){case 0:this.commodityInfo.commodity_comments[t].display_time="星期天 "+o[1];break;case 1:this.commodityInfo.commodity_comments[t].display_time="星期一 "+o[1];break;case 2:this.commodityInfo.commodity_comments[t].display_time="星期二 "+o[1];break;case 3:this.commodityInfo.commodity_comments[t].display_time="星期三 "+o[1];break;case 4:this.commodityInfo.commodity_comments[t].display_time="星期四 "+o[1];break;case 5:this.commodityInfo.commodity_comments[t].display_time="星期五 "+o[1];break;case 6:this.commodityInfo.commodity_comments[t].display_time="星期六 "+o[1];break}}else this.commodityInfo.commodity_comments[t].display_time=this.commodityInfo.commodity_comments[t].comment_created}}};o.default=u}).call(this,i("a821")["default"])},b8c3:function(t,o,i){"use strict";(function(t){i("499b"),i("921b");e(i("66fd"));var o=e(i("e820"));function e(t){return t&&t.__esModule?t:{default:t}}t(o.default)}).call(this,i("a821")["createPage"])},d289:function(t,o,i){"use strict";i.r(o);var e=i("a685"),m=i.n(e);for(var n in e)"default"!==n&&function(t){i.d(o,t,function(){return e[t]})}(n);o["default"]=m.a},d44d:function(t,o,i){"use strict";var e=function(){var t=this,o=t.$createElement;t._self._c},m=[];i.d(o,"a",function(){return e}),i.d(o,"b",function(){return m})},e820:function(t,o,i){"use strict";i.r(o);var e=i("d44d"),m=i("d289");for(var n in m)"default"!==n&&function(t){i.d(o,t,function(){return m[t]})}(n);i("c306");var c=i("2877"),s=Object(c["a"])(m["default"],e["a"],e["b"],!1,null,null,null);o["default"]=s.exports}},[["b8c3","common/runtime","common/vendor"]]]);