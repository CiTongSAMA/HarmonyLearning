import router from '@ohos.router';
import image from '@ohos.multimedia.image';
@Builder function TitleStyle(title:string){
  Text(title).fontSize(30).textAlign(TextAlign.Start).margin({bottom:20})
}
@Builder function ManyIcon(title:string,image:Resource){
  Column({space:10}){
    Image(image).borderRadius(25).width(50).height(50)
    Text(title)//首页选项栏
  }
}
@Builder function Buy(image:Resource,title:string,what:string){
  Column(){
    Image(image).borderRadius(5).width(100).height(150)
    Text(title)//热映电影的名称
    Button(){
      Text(what).fontColor('#ffffff')//‘购买’的颜色字体
    }.width(80)
  }.borderRadius(25)
}
@Builder function Cinema(title:string,position:string,price:string,num1:number,num3:number,num2?:number){
 Flex({direction:FlexDirection.Column,justifyContent:FlexAlign.Start}){
   Row({space:140}){
     Text(title).fontSize(30)
     Text(price).fontSize(20).fontColor('#ff2700')}
   Text(position).fontSize(25).fontColor('#0532ff').textAlign(TextAlign.Start)
   Row({space:5}){
     Text(num1?'退':'改签').borderWidth(2).borderColor('#ff9300')
     Text(num2?'爆米花':'小吃').borderWidth(2).borderColor('#ff9300')
     if(num3==1){
       Text('4k影厅').borderWidth(2).borderColor('#ff9300')
     }
     else if(num3==2){
       Text('8D').borderWidth(2).borderColor('#ff9300')
     }
     else {
       Text('巨幕厅').borderWidth(2).borderColor('#ff9300')
     }
   }
 }
}
@Builder function YouHuiJuan(title:string,content:string){
  Column() {
    Text(title).fontSize(20).fontWeight(50)
    Text(content).fontSize(15)
  }
}
@Builder function service(title:string,content:string,content2:string,content3:string,image:Resource){
 Column(){
    Text(title).textAlign(TextAlign.Center).fontSize(20).fontWeight(40)
   Row(){
     Column(){
        Text(content)
        Text(content2)
        Text(content3)
      }
      Image(image).width(50).height(50)

    }
  }.backgroundColor('#f7f0f0')
}


@Entry
@Component
struct MainPage {
  @State message: string = 'Hello World'

  @Builder TabBuilder(title: string,   image: Resource) {
    Column() {
      Image(image)
        .size({ width: 25, height: 10 })
      Text(title)
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }

  build() {
   Tabs({barPosition:BarPosition.End}) {

     TabContent() {
       List({ space: 10 }) {

         ListItem() {
           TitleStyle('首页')

         }

         ListItem() {
           Swiper() {
             Image($rawfile('Row.jpg')).borderRadius(30)
             Image($rawfile('Row2.jpg')).borderRadius(30)
             Image($rawfile('Row3.jpg')).borderRadius(30)
                 }.autoPlay(true).interval(3000)

         }.width(320)

         ListItem() {
           Column({ space: 10 }) {
             Row({ space: 10 }) {
               ManyIcon('电影|影院', $rawfile('movie.png'))
               ManyIcon('演出|玩乐', $rawfile('show.png'))
               ManyIcon('演唱会', $rawfile('Test.png'))
               ManyIcon('脱口秀', $rawfile('脱口秀.png'))
             }

             Row({ space: 10 }) {
               ManyIcon('密室', $rawfile('保密室.png'))
               ManyIcon('景点门票', $rawfile('景点门票.png'))
               ManyIcon('放映厅', $rawfile('放映厅.png'))
               ManyIcon('剧集综艺', $rawfile('剧集管理.png'))
             }
           }
         }.backgroundColor('#f08282').borderRadius(25)
         .padding(10).width(320)

         ListItem() {
           TitleStyle('正在热映')
         }

         ListItem() {
           Row({ space: 5 }) {
             Buy($rawfile('Colunm.jpg'), '电影名称', '购买')
             Buy($rawfile('Colunm2.jpg'), '电影名称', '购买')
             Buy($rawfile('Colunm3.jpg'), '电影名称', '购买')
           }
         }.backgroundColor('#f08282').borderRadius(25)
         .padding(10).width(320)

         ListItem() {
           TitleStyle('即将上映')
         }

         ListItem() {
           Row({ space: 5 }) {
             Buy($rawfile('Colunm4.jpg'), '电影名称', '预购')
             Buy($rawfile('Colunm5.jpg'), '电影名称', '预购')
             Buy($rawfile('Colunm6.jpg'), '电影名称', '预购')
           }
         }.backgroundColor('#f08282').borderRadius(25)
         .padding(10).width(320)

       }.margin(20).alignListItem(ListItemAlign.Center)
     }.tabBar(this.TabBuilder('主页',$rawfile('Test.png'))) //首页内容

     TabContent() {
       List({ space: 10 }) {
         ListItem() {
           TitleStyle('影院')
         }


         ListItem() {
           Swiper() {
             Image($rawfile('Row.jpg'))
             Image($rawfile('Row3.jpg'))
           }.autoPlay(true).interval(3000)
         }

         ListItem() {
           List() {
             Cinema('万象影城', '大浪镇', '19.9元起', 0, 2, 1)
             Cinema('万象影城', '大浪镇', '19.9元起', 0, 1, 1)
             Cinema('万象影城', '大浪镇', '19.9元起', 0, 2, 1)
             Cinema('万象影城', '大浪镇', '19.9元起', 0, 1, 1)
             Cinema('万象影城', '大浪镇', '19.9元起', 0, 2, 1)
             Cinema('万象影城', '大浪镇', '19.9元起', 0, 1, 1)
             Cinema('万象影城', '大浪镇', '19.9元起', 0, 2, 1)
             Cinema('万象影城', '大浪镇', '19.9元起', 0, 1, 1)
           }.divider({
             strokeWidth: 3,
             startMargin: 60,
             endMargin: 10,
             color: '#f08282'
           })
         }.margin(10) //影院列表

       }

     }.tabBar(this.TabBuilder('影院',$rawfile('Test.png'))) //影院内容

     TabContent() {
       Text(this.message)
     }.tabBar(this.TabBuilder('抢好看',$rawfile('Test.png'))) //抢好看内容

     TabContent() {
       List({space:20}) {
         ListItem() {
           TitleStyle('个人中心')
         }

         ListItem() {
           Flex({ direction: FlexDirection.Row }) {
             Column({ space: 3 }) {
               Column({ space: 10 }) {
                 Image($rawfile('Test.png')).borderRadius(25).width(50).height(50)
                 Text('钻石VIP')
               }
             }.margin({ right: 10 })

             Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Start }) {
               Text('快乐的小青蛙')
               Text('成长值：80/100')
               Progress({ value: 20, total: 25, type: ProgressType.Linear })

             }.margin({ right: 100 })

             Text('个人主页>').margin(10)

           }
         }.margin(10).width(320)

         ListItem() {
          List(){
            ListItem(){Row(){Text('0想看').margin({right:110});Text('>|')}.justifyContent(FlexAlign.Center)}
            ListItem(){Row(){Text('0看过').margin({right:100});Text('>')}.justifyContent(FlexAlign.Center)}
          }.listDirection(Axis.Horizontal)
         }.width(320)
         .height(30)
         .margin(10)
         .backgroundColor('#f08282')

         ListItem(){
           Flex({direction:FlexDirection.Column}){
             TitleStyle('我的订单')
             Row({space:10}){
               ManyIcon('电影票',$rawfile('movie.png'))
               ManyIcon('演出/玩乐',$rawfile('show.png'))
               ManyIcon('在线观影',$rawfile('放映厅.png'))
               ManyIcon('周边',$rawfile('Test.png'))
             }
           }
         }.backgroundColor('#f08282')
         .width(320)
         .margin(15)

         ListItem(){
          Flex({direction:FlexDirection.Row,justifyContent:FlexAlign.SpaceBetween}){
            YouHuiJuan('优惠卷','25张可用')
            YouHuiJuan('影城卡','2张可用')
            YouHuiJuan('蛙享卡','25张可用')
            YouHuiJuan('蛙币','0张可用')
          }
         }.width(320).height(80).margin(10).backgroundColor('#f08282')

         ListItem(){
          Flex(){
            TitleStyle('精选服务')
          }
         }.width(320)
         .margin(10)

         ListItem(){
           Column({space:40}) {
            Row({space:30}){
              service('省钱月卡','双享礼遇','双享礼遇','立即参加',$rawfile('Test2.jpg'))
              service('0元观影','双享礼遇','双享礼遇','立即参加',$rawfile('Test3.jpg'))
            }
             Row({space:30}){
               service('周边商城','双享礼遇','双享礼遇','立即参加',$rawfile('Test2.jpg'))
               service('蛙币捐赠','双享礼遇','双享礼遇','立即参加',$rawfile('Test3.jpg'))
             }
           }
         }.width(320).margin(10)


       }.alignListItem(ListItemAlign.Center)
       }.tabBar(this.TabBuilder('我的',$rawfile('Test.png'))) //我的内容


     }
   .scrollable(false)
    }
   }