<view id="scroll"><scroll-view style="{{'height:'+(scroll_height+'px')+';'}}" scroll-y><view class="user-avatar-container" style="background:url(../../static/user/user.jpg);"><block wx:if="{{user.authentication}}"><view class="user-avatar-container flex align-center"><image class="cu-avatar xl avatar-shadow margin-left-lg margin-right" style="border-radius:20rpx;" src="{{user.user_avatar}}"></image><view class="flex-column justify-around"><view class="text-white text-bold text-lg margin-bottom-xs" style="letter-spacing:2rpx;">{{user.user_name}}</view><view class="text-white text-school margin-bottom-xs"><label class="margin-right-xs _span">用户ID:</label>{{user.user_number}}</view><view class="flex align-center"><text class="text-school cuIcon-locationfill margin-right-xs"></text><block wx:if="{{user.user_school==''||user.user_school==null}}"><view class="text-white text-school">您还没有选择学校</view></block><block wx:else><view class="text-white text-school">{{user.user_school}}</view></block></view></view></view></block><block wx:else><view class="user-avatar-container flex align-center justify-center"><button class="cu-avatar avatar-shadow margin-left-lg margin-right" style="background-image:url(./../../static/user/click-me.png);border-radius:20rpx;width:150rpx;height:150rpx;" open-type="getUserInfo" plain="true" data-event-opts="{{[['getuserinfo',[['bindGetUserInfo',['$event']]]]]}}" bindgetuserinfo="__e"></button></view></block></view><view class="user-info-container flex align-center justify-around"><view data-event-opts="{{[['tap',[['navigateUserfollowers',[1]]]]]}}" class="flex-column align-center" catchtap="__e"><view class="user-info-title-ftext margin-bottom-sm">关注</view><block wx:if="{{user.authentication}}"><view class="text-bold text-theme-color">{{user.user_attentions}}</view></block><block wx:else><view class="text-bold text-theme-color">0</view></block></view><view data-event-opts="{{[['tap',[['navigateUserfollowers',[0]]]]]}}" class="flex-column align-center" catchtap="__e"><view class="user-info-title-ftext margin-bottom-sm">粉丝</view><block wx:if="{{user.authentication}}"><view class="text-bold text-theme-color">{{user.user_followers}}</view></block><block wx:else><view class="text-bold text-theme-color">0</view></block></view><view data-event-opts="{{[['tap',[['navigateUserInformation',[0]]]]]}}" class="flex-column align-center" catchtap="__e"><view class="user-info-title-ftext margin-bottom-sm">动态</view><block wx:if="{{user.authentication}}"><view class="text-bold text-theme-color">{{user.user_article_count}}</view></block><block wx:else><view class="text-bold text-theme-color">0</view></block></view></view><view class="cu-list menu sm-border card-menu margin-bottom-xl shadow-lg" style="position:relative;top:-50rpx;"><view data-event-opts="{{[['tap',[['navigateCollect',['$event']]]]]}}" class="cu-item arrow" bindtap="__e"><view><text class="cuIcon-favor text-theme-color margin-right"></text><text class="category-title">我收藏的</text></view></view><view data-event-opts="{{[['tap',[['navigateUserActivity',['$event']]]]]}}" class="cu-item arrow" bindtap="__e"><view><text class="cuIcon-activity text-theme-color margin-right"></text><text class="category-title">报名活动</text></view></view><view data-event-opts="{{[['tap',[['navigateSchool',['$event']]]]]}}" class="cu-item arrow" bindtap="__e"><view><text class="cuIcon-read text-theme-color margin-right"></text><text class="category-title">切换学校</text></view></view><view data-event-opts="{{[['tap',[['navigateOrganization',['$event']]]]]}}" class="cu-item arrow" bindtap="__e"><view><text class="cuIcon-friend text-theme-color margin-right"></text><text class="category-title">组织认证</text></view></view><view data-event-opts="{{[['tap',[['navigateUserNotice',['$event']]]]]}}" class="cu-item arrow" bindtap="__e"><view><text class="cuIcon-notice text-theme-color margin-right"></text><text class="category-title">消息通知</text></view><block wx:if="{{user.user_notice_count!=0&&user.user_notice_count!=undefined}}"><view class="bg-red round flex align-center justify-center text-xs user-notice-info">{{''+user.user_notice_count+''}}</view></block></view><view data-event-opts="{{[['tap',[['navigateAdditionBug',['$event']]]]]}}" class="cu-item arrow" bindtap="__e"><view><text class="cuIcon-settings text-theme-color margin-right"></text><text class="category-title">反馈错误</text></view></view></view></scroll-view><view data-event-opts="{{[['tap',[['hideModal',['$event']]]]]}}" class="{{['cu-modal',showToast?'show':'']}}" bindtap="__e"><view class="cu-dialog"><view class="cu-bar bg-white justify-end"><view class="content">操作提示</view><view data-event-opts="{{[['tap',[['hideModal',['$event']]]]]}}" class="action" bindtap="__e"><text class="cuIcon-close text-theme-color"></text></view></view><view class="padding-xl" style="letter-spacing:2rpx;font-size:26rpx;">{{''+toastContent+''}}</view></view></view><notification class="vue-ref" style="z-index:999;" vue-id="1" isdistance="{{true}}" data-ref="notification" bind:__l="__l"></notification></view>