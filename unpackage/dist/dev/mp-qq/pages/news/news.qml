<view><cu-custom vue-id="1" bgColor="bg-gradual-tab" isBack="{{true}}" bind:__l="__l" vue-slots="{{['backText','content']}}"><view slot="backText">返回</view><view style="font-size:28rpx!important;letter-spacing:1rpx;" slot="content">头条详情</view></cu-custom><scroll-view hidden="{{!(display)}}" class="animation-fade" style="{{'height:'+(scroll_height+'px')+';'}}" scroll-y id="scroll" scroll-top="{{scroll_top}}" data-event-opts="{{[['tap',[['cancelInput']]]]}}" bindtap="__e"><view class="max-width bg-white padding-bottom-sm"><view class="text-content padding-left padding-right padding-bottom-sm text-bold text-black padding-top-sm text-lg">{{''+newsInfo.news_title+''}}</view><view class="text-content padding-left padding-right padding-bottom"><text style="letter-spacing:1rpx;" decode="true" space="ensp">{{newsInfo.news_content}}</text></view><view class="grid flex-sub padding-lr col-3 grid-square margin-bottom-xs "><block wx:for="{{newsInfo.news_images}}" wx:for-item="item" wx:for-index="index" wx:key="index"><block><image class="max-width margin-bottom-sm" style="border-radius:10rpx;" src="{{item.image_url}}" mode="widthFix" data-url="{{item.image_url}}" data-event-opts="{{[['tap',[['viewImage',['$event']]]]]}}" catchtap="__e"></image></block></block></view><view class="flex align-center max-width justify-end padding-bottom-xs padding-top-xs padding-right"><text class="commodity-other-info margin-right-sm">超赞 ·<text class="margin-left-xs">{{newsInfo.news_likes}}</text></text><text class="commodity-other-info margin-right-sm">评论 ·<text class="margin-left-xs">{{newsInfo.news_comments_count}}</text></text><text class="commodity-other-info">浏览 ·<text class="margin-left-xs">{{newsInfo.news_views}}</text></text></view></view><view class="padding-top padding-left padding-right flex align-center bg-white margin-top flex-column"><view class="comment-container-title info-border-bottom" id="comment"><text>全部留言</text></view><block wx:if="{{!hasComment}}"><image class="none-default-image" src="../../static/commodity/none-default.png" mode="widthFix"></image></block><block wx:else><view class="flex-column max-width padding-top-xs"><block wx:for="{{newsInfo.news_comments}}" wx:for-item="item" wx:for-index="index" wx:key="index"><block><view hidden="{{!(index<comment_page*4)}}" class="margin-top-sm"><view class="flex align-center justify-between"><view class="flex align-center"><image class="cu-avatar avatar-shadow margin-right-sm" style="border-radius:10rpx;" src="{{item.comment_user.user_avatar}}"></image><text class="view-user-name">{{item.comment_user.user_name}}</text></view><view data-event-opts="{{[['tap',[['likeComment',[index,'$0'],[[['newsInfo.news_comments','',index,'comment_id']]]]]]]}}" bindtap="__e"><block wx:if="{{!item.comment_like}}"><text class="cuIcon-appreciate text-theme-color"></text></block><block wx:else><text class="cuIcon-appreciatefill text-theme-color"></text></block><text hidden="{{!(item.comment_likes>0)}}" class="text-theme-color margin-left-xs">{{item.comment_likes}}</text></view></view><text class="text-content text-df flex margin-top-xs " style="margin-left:85rpx;color:#222;">{{item.comment_content}}</text><text class="info-border-bottom max-width padding-bottom-sm flex margin-right padding-top-xs time-text">{{item.display_time}}</text></view></block></block><block wx:if="{{newsInfo.news_comments.length>comment_page*4}}"><view data-event-opts="{{[['tap',[['displayMoreComments',['$event']]]]]}}" class="max-width flex align-center justify-center padding-top-sm padding-bottom-sm" bindtap="__e"><text class="text-theme-color" style="font-weight:700;">加载更多评论<text class="cuIcon-unfold margin-left-xs"></text></text></view></block></view></block></view></scroll-view><view hidden="{{!(display)}}" class="cu-bar padding-right bg-white info-border-top animation-fade-quick"><view class="flex"><block wx:if="{{!isInput}}"><view data-event-opts="{{[['tap',[['likeNews',['$event']]]]]}}" class="action flex-column align-center padding-right-xl" bindtap="__e"><block wx:if="{{newsInfo.news_like}}"><text class="cuIcon-appreciatefill text-theme-color commodity-icon animation-fade-quick"></text></block><block wx:else><text class="cuIcon-appreciate text-theme-color commodity-icon animation-fade-quick"></text></block><text class="text-xs text-theme-color">超赞</text></view></block><block wx:if="{{!isInput}}"><view data-event-opts="{{[['tap',[['CollectNews',['$event']]]]]}}" class="action flex-column align-center padding-right-xl" bindtap="__e"><block wx:if="{{newsInfo.news_collect}}"><text class="cuIcon-favorfill text-theme-color commodity-icon animation-fade-quick"></text></block><block wx:else><text class="cuIcon-favor text-theme-color commodity-icon animation-fade-quick"></text></block><text class="text-xs text-theme-color">收藏</text></view></block><block wx:if="{{!isInput}}"><view data-event-opts="{{[['tap',[['beginInput',['$event']]]]]}}" class="action flex-column align-center padding-right-xl" bindtap="__e"><text class="cuIcon-share text-theme-color commodity-icon animation-fade-quick"></text><text class="text-xs text-theme-color">分享</text></view></block><block wx:if="{{!isInput}}"><view data-event-opts="{{[['tap',[['beginInput',['$event']]]]]}}" class="action flex-column align-center padding-right-xl" bindtap="__e"><text class="cuIcon-message text-theme-color commodity-icon animation-fade-quick"></text><text class="text-xs text-theme-color">评论</text></view></block></view><block wx:if="{{isInput}}"><view class="search-form round animation-fade-quick"><text class="cuIcon-comment"></text><input adjust-position="{{false}}" type="text" placeholder="发表你的想法～" confirm-type="search" data-event-opts="{{[['input',[['__set_model',['','inputComment','$event',[]]]]]]}}" value="{{inputComment}}" bindinput="__e"/></view></block><block wx:if="{{isInput}}"><button data-event-opts="{{[['tap',[['submitComment',['$event']]]]]}}" class="cu-btn bg-theme-green-black shadow-blur text-white text-sm animation-fade-quick" bindtap="__e">评论</button></block></view><view data-event-opts="{{[['tap',[['hideModal',['$event']]]]]}}" class="{{['cu-modal',showToast?'show':'']}}" bindtap="__e"><view class="cu-dialog"><view class="cu-bar bg-white justify-end"><view class="content">消息提示</view><view data-event-opts="{{[['tap',[['hideModal',['$event']]]]]}}" class="action" bindtap="__e"><text class="cuIcon-close text-theme-color"></text></view></view><view class="padding-xl" style="letter-spacing:2rpx;font-size:26rpx;">{{''+toastContent+''}}</view></view></view><notification class="vue-ref" vue-id="2" isdistance="{{true}}" data-ref="notification" bind:__l="__l"></notification></view>