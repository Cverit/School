<template>
	<view>
		<view class="cu-custom fixed" :style="[{height:CustomBar + 'px'}]" style="z-index: 99999;">
			<view class="cu-bar fixed" :style="style" :class="[bgImage!=''?'none-bg text-white bg-img':'',bgColor]">
				<view class="action" @tap="BackPage" v-if="isBack">
					<text class="cuIcon-back"></text>
					<slot name="backText"></slot>
				</view>
				<view class="content" :style="[{top:StatusBar + 'px'}]">
					<slot name="content"></slot>
				</view>
				<slot name="right"></slot>
			</view>
		</view>
	</view>
</template>

<script>
	import Vue from 'vue';
	export default {
		created() {
			uni.getSystemInfo({
				success: (e) => {
					// #ifdef MP-QQ
					Vue.prototype.StatusBar = e.statusBarHeight;
					let QCustom = qq.getMenuButtonBoundingClientRect();
					if (JSON.stringify(QCustom) != "{}") {
						Vue.prototype.Custom = QCustom;
						Vue.prototype.CustomBar = QCustom.bottom + QCustom.top - e.statusBarHeight + 5;
						this.CustomBar = Vue.prototype.CustomBar
					} else {
						Vue.prototype.CustomBar = 72;
						this.CustomBar = Vue.prototype.CustomBar
					}
					// #endif
				}
			})

		},
		data() {
			return {
				StatusBar: this.StatusBar,
				CustomBar: this.CustomBar
			};
		},
		name: 'cu-custom',
		computed: {
			style() {
				var StatusBar = this.StatusBar;
				var CustomBar = this.CustomBar;
				var bgImage = this.bgImage;
				var style = `height:${CustomBar}px;padding-top:${StatusBar}px;`;
				if (this.bgImage) {
					style = `${style}background-image:url(${bgImage});`;
				}
				return style
			}
		},
		props: {
			bgColor: {
				type: String,
				default: ''
			},
			isBack: {
				type: [Boolean, String],
				default: false
			},
			bgImage: {
				type: String,
				default: ''
			},
		},
		methods: {
			BackPage() {
				uni.navigateBack({
					delta: 1
				});
			}
		}
	}
</script>

<style>
</style>
