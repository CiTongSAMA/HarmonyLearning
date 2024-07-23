import router from '@ohos.router';

@Entry
@Component
struct Index {

  @State account: string = ''//账号
  @State password: string = ''//密码
  @State checkbox1Checked: boolean = false;
  @State errorMessage: string = ''; // 错误提示信息

  build() {
    Flex({ direction:FlexDirection.Column,alignItems:ItemAlign.Center}) {
      Text('青蛙影院').textAlign(TextAlign.Center).width(300).fontSize(50).margin(18).borderWidth(2)

      TextInput({placeholder:'请输入用户账号'}).width('50%').margin({top:150})
        .onChange((value)=>{
          if (value.length < 11) {
            this.errorMessage = '请输入11位手机号码';
          } else {
            this.errorMessage = ''; // 清空错误信息
          }
          this.account = value;
        })

      TextInput({placeholder:'请输入密码'}).width('50%').margin({top:20}).type(InputType.Password)
        .onChange((value)=>{
          this.password = value;
        })

      Row(){
        Toggle({type: ToggleType.Checkbox, isOn: false } ).onClick(()=>{this.checkbox1Checked = true})
        Text('同意用户隐私协议')}.margin({top:20})

      Button('登录').margin({top:30})
        .onClick(()=>{
          if (this.account.length !== 11) {
            this.errorMessage = '请输入11位手机号码';
          } else if (!this.checkbox1Checked ) {
            this.errorMessage = '请勾选同意用户隐私协议';
          } else {
            this.errorMessage = ''; // 清空错误信息
            router.pushUrl({
              url:'pages/LoadingPage'
            })
          }
        })
      // 显示错误提示信息
      if (this.errorMessage !== '') {
        Text(this.errorMessage)
          .fontSize(12)
          .fontColor(Color.Red)
          .margin({top:5})
      }



    }.width('100%')
    .height('100%')
    .backgroundImage($rawfile('frog.jpg'))
    .backgroundImageSize(ImageSize.Cover)

  }
}

