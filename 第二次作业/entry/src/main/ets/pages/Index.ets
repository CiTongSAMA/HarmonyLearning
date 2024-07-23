import router from '@ohos.router';
@Entry
@Component
struct Index {
  @State PlayerName: string =''


  build() {
    Column({space:10}){

      Column({space:10}){
        Text('积分抽奖').fontSize(40).fontWeight(700).margin({top:20})
      }

      Row({ space: 10 }) {
        Button('心')
          .type(ButtonType.Normal).width('40%').height('20%').fontSize(40).fontWeight(600)
          .borderRadius(8).shadow({radius:8,color:0xabcdef,offsetX:20,offsetY:20})
          .backgroundColor(Color.Red)
        Button('想')
          .type(ButtonType.Normal).width('40%').height('20%').fontSize(40).fontWeight(600)
          .borderRadius(8).shadow({radius:8,color:0xabcdef,offsetX:20,offsetY:20})
          .backgroundColor(Color.Brown)
      }

      Row({space:10}){
        Button('事')
          .type(ButtonType.Normal).width('40%').height('20%').fontSize(40).fontWeight(600)
          .borderRadius(8).shadow({radius:8,color:0xabcdef,offsetX:20,offsetY:20})
          .backgroundColor(Color.Blue)
        Button('成')
          .type(ButtonType.Normal).width('40%').height('20%').fontSize(40).fontWeight(600)
          .borderRadius(8).shadow({radius:8,color:0xabcdef,offsetX:20,offsetY:20})
          .backgroundColor(Color.Orange)
      }

      TextInput({placeholder:'你的名字'})
      .height('50').width('60%').margin(20).onChange((value)=>{this.PlayerName=value})

      Button('Start!').onClick(() => {
router.pushUrl({url:'pages/GamePage',params:{PlayerNameParam:this.PlayerName}})
      }).width('50%').height(50).fontSize(25)




    }.width('100%').height('100%')





  }
}