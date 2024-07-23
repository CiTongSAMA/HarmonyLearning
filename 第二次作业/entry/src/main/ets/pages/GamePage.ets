import router from '@ohos.router';
@Entry
@Component
struct GamePage {
  @State PlayerName: string =router.getParams()['PlayerNameParam']
  @State Score:number =100
  @State Times:number =3
  @State CardNum:number=0
  @State grade:string =''


  build() {
Column({space:10}){
  Row({space:20}){
    Text(`${this.PlayerName}:得分：${this.Score}`).fontSize(20).fontWeight(600).fontColor(0xababab)
    Text(`剩余次数：${this.Times}`).fontSize(20).fontWeight(600).fontColor(0xababab)

  }.margin({top:10,bottom:20}).backgroundColor(0xabcdef).width('90%').height('10%')
  .borderRadius(8).justifyContent(FlexAlign.Center).shadow({radius:8,color:0xd3d3de,offsetY:-20,offsetX:20})

  Row({ space: 5 }) {
    Column({ space: 5 }) {
      Image($rawfile('feaaf8dad2238620f46154e7c78dbeb.jpg'))
        .width('40%')
        .height('25%')
        .borderWidth(4)
        .borderColor(Color.Red)
        .borderRadius(20)
      Text('红卡').fontSize(25).fontWeight(600).fontColor(Color.Red)
    }
    Column({ space: 5 }) {
      Image($rawfile('feaaf8dad2238620f46154e7c78dbeb.jpg'))
        .width('40%')
        .height('25%')
        .borderWidth(4)
        .borderColor(Color.Yellow)
        .borderRadius(20)
      Text('黄卡').fontSize(25).fontWeight(600).fontColor(Color.Yellow)
    }
  }
  Row({ space: 5 }) {
    Column({ space: 5 }) {
      Image($rawfile('feaaf8dad2238620f46154e7c78dbeb.jpg'))
        .width('40%')
        .height('25%')
        .borderWidth(4)
        .borderColor(Color.Blue)
        .borderRadius(20)
      Text('蓝卡').fontSize(25).fontWeight(600).fontColor(Color.Blue)
    }
    Column({ space: 5 }) {
      Image($rawfile('feaaf8dad2238620f46154e7c78dbeb.jpg'))
        .width('40%')
        .height('25%')
        .borderWidth(4)
        .borderColor(Color.Gray)
        .borderRadius(20)
      Text('灰卡').fontSize(25).fontWeight(600).fontColor(Color.Gray)
    }
  }

  Button('抽').onClick(()=>{this.judgeCard()})
  Button('结果').onClick(()=>{
    this.showResult()
  })



}.width('100%').height('100%')

  }
  genRandom(Min,Max){

    var range = Max - Min;
    var rand = Math.random();
    this.CardNum = Min + Math.round(range * rand);//四舍五入
    if(this.CardNum == 1){
      this.Score += 500;//红卡积分加500
    }
    if(this.CardNum == 2){
      this.Score += 100;//黄卡积分加100
    }
    if(this.CardNum == 3){
      this.Score -= 50;//蓝卡积分减50
    }
    if(this.CardNum  == 4){
      this.Score = 0;//灰卡积分清零
    }
    console.info('cardNum:'+this.CardNum +':score:'+this.Score)
  }


  judgeCard() {
    this.Times
    var msg = ''//对话框提示卡片抽取信息
    if (this.Times >= 0 && this.Score > 0 && this.Score < 500) {
      this.genRandom(1, 4)
      if (this.CardNum == 1) {
        msg = '恭喜您，您抽到了红卡，积分+500！'

      }
      if (this.CardNum == 2) {

        msg = '恭喜您，您抽到了黄卡，积分+100！'
      }

      if (this.CardNum == 3) {

        msg = '很遗憾，您抽到了蓝卡，积分-50！'
      }

      if (this.CardNum == 4) {

        msg = '很遗憾，您抽到了灰卡，积分清零！'
      }
      AlertDialog.show({
        title: '提示',
        message: msg,
        confirm:{
          value:'关闭',
          action:()=>{
            console.info('confirm callback')
          }
        },
        cancel:()=>{
          console.info('cancel callback')
        }
      })

    }else{
      //次数用完
      if(this.Times <0 ){
        this.Times = 0
        msg = '您的抽卡次数已用尽！！！'

      }else if(this.Score >=500){
        this.Times = 0;
        msg = '您的积分已超过500分，不能再继续了！！！'
      }else{
        this.Times = 0
        msg = '很遗憾，您的积分已用尽，下次再来！！！'
      }

      AlertDialog.show({
        title: '提示',
        message: msg,
        confirm:{
          value:'关闭',
          action:()=>{
            console.info('confirm callback')
          }
        },
        cancel:()=>{
          console.info('cancel callback')
        }
      })

    }


  }

  showResult(){

    if(this.Times >0){
      AlertDialog.show({
        title: '提示',
        message: '您还没有抽完奖，不能查看结果！！！',
        confirm:{
          value:'关闭',
          action:()=>{
            console.info('confirm callback')
          }
        },
        cancel:()=>{
          console.info('cancel callback')
        }
      })
      return
    }

    if(this.Score >= 500){
      this.grade = 'L4'
    }
    else if(this.Score >= 300){
      this.grade = 'L3'
    }
    else if(this.Score >= 200){
      this.grade = 'L2'
    }
    else if(this.Score > 0){
      this.grade = 'L1'
    }else{
      this.grade = 'L0'
    }

    if(this.grade == 'L0'){
      AlertDialog.show({
        title: '提示',
        message: '您没有抽中任何奖品，下次再来！！！',
        confirm:{
          value:'关闭',
          action:()=>{
            console.info('confirm callback')
          }
        },
        cancel:()=>{
          console.info('cancel callback')
        }
      })
      return
    }

    router.pushUrl({
      url:'pages/ResultPage',
      params:{
        gradeParam: this.grade
      }
    })

  }


}


