import { router } from '@kit.ArkUI';
import deviceInfo from '@ohos.deviceInfo';

@Entry
@Component
struct AdPage {
  @State countdown: number = 3; // 倒计时初始值为 3 秒

  build() {
    Column() {
      // 跳过广告按钮（悬浮在右上角）
      Button('跳过广告')
        .onClick(() => {
          router.pushUrl({ url: 'pages/MainPage' }); // 点击跳过广告
        })
        .width(100)
        .height(40)
        .borderColor('#FFFFFF').borderWidth(2)
        .backgroundColor('transparent')
        .fontColor('#FFFFFF') // 按钮文字颜色
        .fontWeight(FontWeight.Bold)
        .fontSize(14)
        .borderRadius(8)// 按钮圆角
        .margin({ top: 10, right: 10 }) // 设置外边距，按钮距离右上角 20px
        .position({ top: 10, right: 10 }); // 将按钮悬浮在右上角

      Text('广告页面')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.White)
        .margin(20);

      Text(`即将跳转到主页面，剩余 ${this.countdown} 秒...`)
        .fontSize(20)
        .fontColor(Color.White)
        .margin(10);
    }
    .backgroundImage($r('app.media.ad'))
    .backgroundImageSize(ImageSize.Cover) // 图片适配模式，确保全屏覆盖

    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .onAppear(() => {
      this.startCountdown(); // 在组件显示时启动倒计时
    });
  }



  startCountdown() {
    const interval = setInterval(() => {
      if (this.countdown > 1) {
        this.countdown -= 1; // 更新倒计时
      } else {
        clearInterval(interval); // 清除计时器
        router.pushUrl({ url: 'pages/MainPage' }); // 跳转到主页面
      }
    }, 1000); // 每秒触发一次
  }
}