@Entry
@Component
struct GuessFist {
  @State playerName: string = AppStorage.Get<string>('PlayerName') //玩家名字
  @State times: number = 3 //猜拳次数
  @State computerFist: number = 0 //计算机出拳：1-石头，2-剪刀，3-布
  @State playerFist: number = 0 //玩家出拳
  @State computerScore: number = 0 // 计算机当前得分
  @State playerScore: number = 0 //玩家当前得分
  @State resultMessage:string = '' //猜拳结果提示

  build() {
    Column() {
      Column({ space: 10 }) {
        Text(`欢迎[${this.playerName}]挑战猜拳游戏`).fontSize(30).fontWeight(700)
        Text(`剩余${this.times}轮`).fontSize(20)
        Text('请点击图片出拳').fontSize(20).fontColor(Color.Red)
        Image($rawfile('images/shitou.png')).width(150).height(150)
          .onClick(() => {
            this.playerFist = 1
            this.judgeResult()
            console.info('石头')
          })
        Image($rawfile('images/jiandao.png')).width(150).height(150)
          .onClick(() => {
            this.playerFist = 2
            console.info('剪刀')
            this.judgeResult()
          })
        Image($rawfile('images/bu.png')).width(150).height(150)
          .onClick(() => {
            this.playerFist = 3
            console.info('布')
            this.judgeResult()
          })


      }.margin({ top: '10%' })
    }.width('100%')
    .height('100%')

  }

  genRandom(min,max){
    var range = max - min;
    var randNumber = Math.random();
    this.computerFist = min + Math.round(randNumber * range)//四舍五入
    console.info('computerfist:'+this.computerFist)

  }

  // 判断猜拳结果
  judgeResult(){
    console.info('player:' + this.playerFist)
    if(this.times <= 0){
      this.resultMessage = '轮数用尽，游戏已退出！！！'
      AlertDialog.show({
        title:'提示',
        message:this.resultMessage,
        confirm:{
          value:'关闭',
          action:()=>{
            console.info('轮数用尽，游戏已退出')
          }
        },
        cancel:()=>{
          console.info('cancel callback')
        }

      })
      return
    }
    //计算机出拳
    this.genRandom(1,3)
    //平局，各加10分
    if(this.computerFist == this.playerFist){
      this.playerScore += 10
      this.computerScore += 10
      this.resultMessage = '本轮平局'

      console.info("palyer分数:"+this.playerScore+"|jsj:"+this.computerScore)
    }else if((this.playerFist == 1 && this.computerFist ==2)
    ||(this.playerFist == 2 && this.computerFist ==3)
    ||(this.playerFist == 3 && this.computerFist ==1)){//玩家赢 +10
      this.playerScore +=10
      this.resultMessage = '本轮你赢了！'
      console.info("palyer分数:"+this.playerScore+"|jsj:"+this.computerScore)
    }else {//计算机赢 +10
      this.computerScore += 10
      this.resultMessage = '本轮计算机赢了！'
      console.info("palyer分数:"+this.playerScore+"|jsj:"+this.computerScore)
    }

    this.times --
    if(this.times == 0){
      var tempMessage = ''
      if(this.computerScore == this.playerScore){
        tempMessage = '平局'
      }else if(this.computerScore > this.playerScore){
        tempMessage = '你输了！！！！'
      }else{
        tempMessage = '你赢了！！！！'

      }
      console.info("最终："+tempMessage+",palyer分数:"+this.playerScore+"|jsj:"+this.computerScore)
      this.resultMessage = this.resultMessage.concat(`,最终成绩:${tempMessage}`)
    }

    AlertDialog.show({
      title:'提示',
      message:this.resultMessage,
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