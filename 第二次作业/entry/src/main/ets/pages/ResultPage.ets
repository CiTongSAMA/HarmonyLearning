import router from '@ohos.router';
@Entry
@Component
struct ResultPage {
  @State grade:string =router.getParams()['gradeParam']

  build() {
    Column({ space: 10 }) {
      if (this.grade == 'L1') {
        Text('恭喜您，你抽到电单车一台').fontSize(25).fontWeight(700)
          .margin({ top: 50 })
        Image($rawfile('feaaf8dad2238620f46154e7c78dbeb.jpg'))
          .width('80%').height('60%')
          .objectFit(ImageFit.Contain)

      }
      if (this.grade == 'L2') {

        Text('恭喜您，你抽到点读笔一只').fontSize(25).fontWeight(700)
          .margin({ top: 50 })
        Image($rawfile('feaaf8dad2238620f46154e7c78dbeb.jpg'))
          .width('80%').height('60%')
          .objectFit(ImageFit.Contain)

      }
      if (this.grade == 'L3') {

        Text('恭喜您，你抽到电饭煲一台').fontSize(25).fontWeight(700)
          .margin({ top: 50 })
        Image($rawfile('feaaf8dad2238620f46154e7c78dbeb.jpg'))
          .width('80%').height('60%')
          .objectFit(ImageFit.Contain)

      }
      if (this.grade == 'L4') {

        Text('恭喜您，你抽到iphone手机一部').fontSize(25).fontWeight(700)
          .margin({ top: 50 })
        Image($rawfile('feaaf8dad2238620f46154e7c78dbeb.jpg'))
          .width('80%').height('60%')
          .objectFit(ImageFit.Contain)

      }

    }.width('100%').height('100%')

  }
}
