import router from '@ohos.router';
@Entry
@Component
struct LoadingPage {
  @State showSeconds: number =5 ;//5秒跳转
  private timerId: number = -1;//定时器id



  build() {

    Flex({direction:FlexDirection.Column,
      alignItems:ItemAlign.Center,justifyContent:FlexAlign.SpaceAround}){
      //Text('系统登陆中...')
      Text(`系统登陆中(${this.showSeconds})...`)//展示倒计时3秒
        .fontSize(24)
        .fontColor(Color.Blue)
        .fontWeight(FontWeight.Bold)

      LoadingProgress().color(Color.Blue)
        .width('50%')
        .height('50%')


    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f1f2f3')

  }

  aboutToAppear(){
    this.timerId = setInterval(()=>{
      if(this.showSeconds >0 ){
        this.showSeconds --;

      }else {
        clearInterval(this.timerId)
        router.pushUrl({
          url:'pages/MainPage'
        })
      }
    },1000)
  }
}