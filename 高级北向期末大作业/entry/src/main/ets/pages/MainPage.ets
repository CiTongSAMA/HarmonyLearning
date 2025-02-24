import HomeModel from '../model/HomeModel';
import { text } from '@kit.ArkGraphics2D';
import image from '@ohos.multimedia.image';

@Entry
@Component
struct MainPage {
  @State title: string = '智慧农业';

  @State homeModel:HomeModel = new HomeModel()

  build() {
    Column() {
      Tabs({barPosition:BarPosition.End}){
        TabContent(){
          Column({ space: 15 }) {
            Row() {
              Text(this.title)
                .fontSize(32)
                .fontWeight(FontWeight.Bold)

            }
            .justifyContent(FlexAlign.Center)
            .width('95%')
            .margin({ top: 10, bottom: 5 })


            //农田状态监控
            this.fieldMonitor()

            this.deviceControll()


          }
          .backgroundColor('#f1f2f3')
          .height('100%')
          .width('100%')
        }.tabBar(this.tabBuilder('首页',$r('app.media.home')))

        TabContent(){

        }.tabBar(this.tabBuilder('灌溉',$r('app.media.water')))

        TabContent(){

        }.tabBar(this.tabBuilder('我的',$r('app.media.mine')))


      }


    }
  }

  @Builder tabBuilder(title: string,  selectedImg: Resource) {
    Column() {
      Image( selectedImg )
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor('#1698CE' )
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  fieldMonitor() {
    Column({ space: 10 }) {

      Row() {
        Image($r('app.media.windmill'))
          .width(32)
          .height(32)
        Text('农田状态监控')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
      }.width('95%')
      .margin(10)

      Row({ space: 8 }) {
        Row() {
          Image($r('app.media.dashboard'))
            .width(32)
            .height(32)
          Text('温度')
        }

       // Text('25.5℃')
        Text(this.homeModel.fieldStatus.airTemperature)

      }.rowStyle()

      Row({ space: 8 }) {
        Row() {
          Image($r('app.media.rain'))
            .width(32)
            .height(32)
          Text('湿度')
        }

        Text(this.homeModel.fieldStatus.airHumidity)

      }.rowStyle()

      Row({ space: 8 }) {
        Row() {
          Image($r('app.media.sun'))
            .width(32)
            .height(32)
          Text('光照')
        }

        Text(this.homeModel.fieldStatus.lightIntensity)

      }.rowStyle()

      Row({ space: 8 }) {
        Row() {
          Image($r('app.media.waterlevel'))
            .width(32)
            .height(32)
          Text('土壤湿度')
        }

        Text(this.homeModel.fieldStatus.soilHumidity)

      }.rowStyle()

    }

    .backgroundColor(Color.White)
    .width('95%')
    .borderRadius(8)
    .padding(10)

  }


  @Builder deviceControll(){
    Column({ space: 10 }) {

      Row() {
        Image($r('app.media.device_control'))
          .width(32)
          .height(32)
        Text('设备控制台')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
      }.width('95%')
      .margin(10)

      Row({ space: 8 }) {
        Row() {
          Image($r('app.media.water_control'))
            .width(32)
            .height(32)
          Text('水泵')
        }


        Toggle({type:ToggleType.Switch,isOn:this.homeModel.fieldDevice.waterPumpStatus ==0?false:true})
          .width(44)
          .height(28)

      }.rowStyle()

      Row({ space: 8 }) {
        Row() {
          Image($r('app.media.light'))
            .width(32)
            .height(32)
          Text('灯光')
        }

        Toggle({type:ToggleType.Switch,isOn:this.homeModel.fieldDevice.lightDeviceStatus== 0 ? false:true})
          .width(44)
          .height(28)

      }.rowStyle()

      Row({ space: 8 }) {
        Row() {
          Image($r('app.media.tent'))
            .width(32)
            .height(32)
          Text('篷布')
        }

        Toggle({type:ToggleType.Switch,isOn:this.homeModel.fieldDevice.shedCoverStatus == 0? false:true})
          .width(44)
          .height(28)

      }.rowStyle()


    }

    .backgroundColor(Color.White)
    .width('95%')
    .borderRadius(8)
    .padding(10)


  }

}
  @Extend(Row) function rowStyle(){

  .backgroundColor('#ccc')
  .padding(5)
  .height(50)
  .borderRadius(8)
  .justifyContent(FlexAlign.SpaceBetween)
  .width('95%')

}