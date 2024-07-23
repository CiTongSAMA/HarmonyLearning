import router from '@ohos.router';
@Entry
@Component
struct Index {
  @State playerName: string =  ''

  build() {
    Column() {
      Column({ space: 10 }) {
        Text('欢迎参加猜拳游戏').fontSize(30).fontWeight(700)
        Image($rawfile('images/guessfist.png'))
          .width('80%')
          .height('50%')
          .borderRadius(20)
        TextInput({placeholder:'请输入玩家名字'})
          .width('80%')
          .onChange((value:string)=>{
            this.playerName = value
          })
        Button('开始游戏')
          .width('40%')
          .onClick(()=>{
            router.pushUrl({
              url:'pages/StartGame',
              params:{
                playerNameParam:this.playerName
              }
            })
          })
      }.margin({ top: '10%' })

    }
    .width('100%')
  }
}