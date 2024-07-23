import router from '@ohos.router';
import AppContext from '@ohos.app.ability.common';

@Entry
@Component
struct StartGame {
  @State playerName: string = router.getParams()['playerNameParam']
  @State progValue: number = 20
  @State progColorValue: number = 20 //进度条带颜色部分
  private timer: number

  build() {

    Column() {
      Column({ space: 30 }) {
        Text(`玩家：[${this.playerName}]正进入游戏...`).fontSize(20)
        Progress({ value: this.progValue, total: 100, type: ProgressType.ScaleRing })
          .color(Color.Grey).value(this.progColorValue).width(150)
          .style({ strokeWidth: 15, scaleCount: 15, scaleWidth: 5 })
      }.margin({ top: '20%' })
    }.width('100%')

  }

  aboutToAppear() {
    if (this.progValue <= 100 && this.progColorValue <= 100) {
      this.timer = setInterval(() => {
        this.progValue += 20
        this.progColorValue += 20
      }, 1000)
    }
    setTimeout(() => {
      clearInterval(this.timer)
      this.turnToGameAbility()
    }, 5000)
  }

  turnToGameAbility() {
    // 拿到上下文
    let handler = getContext(this) as AppContext.Context
    this.startGameAbility(handler)
  }

  startGameAbility(context) {

    //构造want
    const want = {
      bundleName: "com.example.guessfist",
      abilityName: "GuessFistAbility",
      parameters: {
        playerName: this.playerName
      }
    }


    try {
      context.startAbility(want);
    } catch (error) {
      console.info('error !!!' + error)
    }

  }
}
