<view><cu-custom vue-id="1" bgColor="bg-gradual-tab" isBack="{{true}}" bind:__l="__l" vue-slots="{{['backText','content']}}"><view slot="backText">返回</view><view style="font-size:28rpx!important;letter-spacing:1rpx;" slot="content">动态详情</view></cu-custom><scroll-view hidden="{{!(display)}}" class="animation-fade" style="{{'height:'+(scroll_height+'px')+';'}}" scroll-y id="scroll" scroll-top="{{scroll_top}}" data-event-opts="{{[['tap',[['cancelInput']]]]}}" bindtap="__e"><block wx:if="{{loading}}"><loading style="position:relative;top:450rpx;" vue-id="2" bind:__l="__l"></loading></block><block wx:if="{{!loading}}"><view class="max-width bg-white padding-bottom-sm"><view data-event-opts="{{[['tap',[['navigateUserShow',['$0','$1'],['articleInfo.article_user.user_id','articleInfo.article_anonymity']]]]]}}" class="padding-top-sm padding-bottom-sm padding-left padding-right flex align-center info-border-bottom bg-white max-width" bindtap="__e"><block wx:if="{{!articleInfo.article_anonymity}}"><image class="cu-avatar article-avatar avatar-shadow margin-right round avatar-border" src="{{articleInfo.article_user.user_avatar}}"></image></block><block wx:else><image class="cu-avatar article-avatar avatar-shadow margin-right round avatar-border" style="background-color:#F1F1F1;" src="../../static/article/anonymity.png"></image></block><view class="flex-column justify-center"><block wx:if="{{!articleInfo.article_anonymity}}"><text class="aricle-user-name margin-bottom-xs text-bold">{{articleInfo.article_user.user_name}}</text></block><block wx:else><text class="aricle-user-name margin-bottom-xs text-bold">匿名用户</text></block><view><text class="article-create-time">{{articleInfo.display_time}}</text><block wx:if="{{articleInfo.article_display_location}}"><text class="article-create-time margin-left">{{"来自"+articleInfo.article_user.user_school}}</text></block></view></view><block wx:if="{{!articleInfo.user_follow&&!articleInfo.article_anonymity}}"><button data-event-opts="{{[['tap',[['tooglrUserFollow',['$event']]]]]}}" class="cu-btn bg-theme-green-black shadow-blur text-white text-sm animation-fade-quick" style="margin-left:auto;margin-right:0;" catchtap="__e">关注</button></block><block wx:if="{{articleInfo.user_follow&&!articleInfo.article_anonymity}}"><button data-event-opts="{{[['tap',[['tooglrUserFollow',['$event']]]]]}}" class="cu-btn bg-grey shadow-blur text-white text-sm animation-fade-quick" style="margin-left:auto;margin-right:0;background-color:#BBBBBB;" catchtap="__e">已关注</button></block></view><block wx:if="{{articleInfo.article_title}}"><view class="text-content padding-left padding-right padding-bottom-xs text-bold text-black padding-top-xs">{{''+articleInfo.article_title+''}}</view></block><view class="text-content padding-left padding-right padding-bottom"><text decode="true">{{articleInfo.article_content}}</text></view><view class="grid flex-sub padding-lr col-3 grid-square margin-bottom-xs "><block wx:for="{{articleInfo.article_images}}" wx:for-item="item" wx:for-index="index" wx:key="index"><block><view class="bg-img" style="{{'background-image:'+('url('+item.image_url+')')+';'}}" data-url="{{item.image_url}}" data-event-opts="{{[['tap',[['viewImage',['$event']]]]]}}" catchtap="__e"></view></block></block></view><view class="flex align-center max-width justify-end padding-bottom-xs padding-top-xs padding-right"><text class="commodity-other-info margin-right-sm">超赞 ·<text class="margin-left-xs">{{articleInfo.article_likes}}</text></text><text class="commodity-other-info margin-right-sm">评论 ·<text class="margin-left-xs">{{articleInfo.article_comments_count}}</text></text><text class="commodity-other-info">浏览 ·<text class="margin-left-xs">{{articleInfo.article_views}}</text></text></view></view></block><block wx:if="{{!loading}}"><view class="padding-top padding-left padding-right flex align-center bg-white margin-top flex-column"><view class="comment-container-title info-border-bottom" id="comment"><text>全部留言</text></view><block wx:if="{{!hasComment}}"><image class="none-default-image" src="../../static/commodity/none-default.png" mode="widthFix"></image></block><block wx:else><view class="flex-column max-width padding-top-xs"><block wx:for="{{articleInfo.article_comments}}" wx:for-item="item" wx:for-index="index" wx:key="index"><block><view hidden="{{!(index<comment_page*4)}}" class="margin-top-sm"><view class="flex align-center justify-between"><view class="flex align-center"><image class="cu-avatar avatar-shadow margin-right-sm" style="border-radius:10rpx;" src="{{item.comment_user.user_avatar}}"></image><text class="view-user-name">{{item.comment_user.user_name}}</text></view><view data-event-opts="{{[['tap',[['likeComment',[index,'$0'],[[['articleInfo.article_comments','',index,'comment_id']]]]]]]}}" bindtap="__e"><block wx:if="{{!item.comment_like}}"><text class="cuIcon-appreciate text-theme-color"></text></block><block wx:else><text class="cuIcon-appreciatefill text-theme-color"></text></block><text hidden="{{!(item.comment_likes>0)}}" class="text-theme-color margin-left-xs">{{item.comment_likes}}</text></view></view><text class="text-content text-df flex margin-top-xs " style="margin-left:85rpx;color:#222;">{{item.comment_content}}</text><text class="info-border-bottom max-width padding-bottom-sm flex margin-right padding-top-xs time-text">{{item.display_time}}</text></view></block></block><block wx:if="{{articleInfo.article_comments.length>comment_page*4}}"><view data-event-opts="{{[['tap',[['displayMoreComments',['$event']]]]]}}" class="max-width flex align-center justify-center padding-top-sm padding-bottom-sm" bindtap="__e"><text class="text-theme-color" style="font-weight:700;">加载更多评论<text class="cuIcon-unfold margin-left-xs"></text></text></view></block></view></block></view></block></scroll-view><view hidden="{{!(display)}}" class="cu-bar padding-right bg-white info-border-top animation-fade-quick max-width" style="{{'position:fixed;'+('bottom:'+(fixedHeight+'px')+';')}}"><view class="flex"><block wx:if="{{!isInput}}"><view data-event-opts="{{[['tap',[['likeArticle',['$event']]]]]}}" class="action flex-column align-center padding-right-xl icon-button" bindtap="__e"><block wx:if="{{articleInfo.article_like}}"><text class="cuIcon-appreciatefill text-theme-color commodity-icon animation-fade-quick"></text></block><block wx:else><text class="cuIcon-appreciate text-theme-color commodity-icon animation-fade-quick"></text></block><text class="text-xs text-theme-color padding-top-xs">超赞</text></view></block><block wx:if="{{!isInput}}"><view data-event-opts="{{[['tap',[['CollectArticle',['$event']]]]]}}" class="action flex-column align-center padding-right-xl icon-button" bindtap="__e"><block wx:if="{{articleInfo.article_collect}}"><text class="cuIcon-favorfill text-theme-color commodity-icon animation-fade-quick"></text></block><block wx:else><text class="cuIcon-favor text-theme-color commodity-icon animation-fade-quick"></text></block><text class="text-xs text-theme-color padding-top-xs">收藏</text></view></block><block wx:if="{{!isInput}}"><button class="action flex-column align-center padding-right-xl icon-button " open-type="share"><text class="cuIcon-share text-theme-color commodity-icon animation-fade-quick"></text><text class="text-xs text-theme-color padding-top-xs">分享</text></button></block><block wx:if="{{!isInput}}"><view data-event-opts="{{[['tap',[['beginInput',['$event']]]]]}}" class="action flex-column align-center padding-right-xl icon-button" bindtap="__e"><text class="cuIcon-message text-theme-color commodity-icon animation-fade-quick"></text><text class="text-xs text-theme-color padding-top-xs">评论</text></view></block></view><block wx:if="{{isInput}}"><view class="search-form round animation-fade-quick"><text class="cuIcon-comment"></text><input adjust-position="{{false}}" type="text" placeholder="发表你的想法～" confirm-type="search" auto-focus="true" data-event-opts="{{[['focus',[['changeFixedHeight',['$event']]]],['blur',[['cancelInput',['$event']]]],['confirm',[['submitComment',['$event']]]],['input',[['__set_model',['','inputComment','$event',[]]]]]]}}" value="{{inputComment}}" bindfocus="__e" bindblur="__e" bindconfirm="__e" bindinput="__e"/></view></block><block wx:if="{{isInput}}"><button data-event-opts="{{[['tap',[['submitComment',['$event']]]]]}}" class="cu-btn bg-theme-green-black shadow-blur text-white text-sm animation-fade-quick" bindtap="__e">评论</button></block></view><view data-event-opts="{{[['tap',[['hideModal',['$event']]]]]}}" class="{{['cu-modal',showToast?'show':'']}}" bindtap="__e"><view class="cu-dialog"><view class="cu-bar bg-white justify-end"><view class="content">消息提示</view><view data-event-opts="{{[['tap',[['hideModal',['$event']]]]]}}" class="action" bindtap="__e"><text class="cuIcon-close text-theme-color"></text></view></view><view class="padding-xl" style="letter-spacing:2rpx;font-size:26rpx;">{{''+toastContent+''}}</view></view></view><notification class="vue-ref" vue-id="3" isdistance="{{true}}" data-ref="notification" bind:__l="__l"></notification></view>