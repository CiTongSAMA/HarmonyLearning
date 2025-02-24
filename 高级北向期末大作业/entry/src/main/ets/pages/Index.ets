import { promptAction, router } from '@kit.ArkUI';
import LoginModel from '../model/LoginModel';
import preferences from '@ohos.data.preferences';



@Entry
@Component
struct Index {
  @State title: string = '智慧农业系统欢迎您';
  @State userName: string = ''; // 用户名
  @State password: string = ''; // 密码
  @State isPrivacyAccepted: boolean = false; // 隐私协议是否已同意
  @State showPrivacyDialog: boolean = true; // 是否显示隐私协议对话框
  @State isPreferencesReady: boolean = false; // Preferences 是否已准备好

  // 定义 Preferences 实例
  preferencesInstance: preferences.Preferences | null = null; // 初始化为 null
  loginModel: LoginModel = new LoginModel();

  build() {
    Stack() {
      Column() {

        Column({ space: 10 }) {
          Text(this.title)
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White);

          Text("唐璐")
            .fontColor(Color.White);
          Text("北向大作业")
            .fontColor(Color.White);

          TextInput({ placeholder: '请输入用户名：默认账号为test030' })
            .width('95%')
            .borderRadius(0)
            .onChange((value) => {
              this.userName = value;
            }).enabled(this.isPrivacyAccepted); // 根据隐私协议状态控制可用性

          TextInput({ placeholder: '请输入密码：默认密码为12345678' })
            .width('95%')
            .borderRadius(0)
            .type(InputType.Password)
            .onChange((value) => {
              this.password = value;
            })
            .enabled(this.isPrivacyAccepted); // 根据隐私协议状态控制可用性

          Button('登录')
            .fontSize(22)
            .width('80%')
            .onClick(() => {
              if (this.isFormValid() && this.isPrivacyAccepted) {
                this.login();
              } else if (!this.isPrivacyAccepted) {
                this.showToast('请先同意隐私协议！');
              }
            })
            .enabled(this.isPrivacyAccepted); // 根据隐私协议状态控制可用性
        }
      }
      .height('100%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround);

      // 隐私协议对话框
      if (this.showPrivacyDialog) {
        Column() {
          // 对话框标题
          Text('隐私协议')
            .fontSize(20)
            .fontWeight(FontWeight.Bold);

          // 对话框内容
          Text('欢迎使用本系统。在使用之前，请阅读并同意我们的隐私协议。')
            .fontSize(16)
            .textAlign(TextAlign.Center);

          // 同意按钮
          Button('同意')
            .fontSize(18)
            .backgroundColor('#0A84FF')
            .fontColor('#FFFFFF')
            .width('80%')
            .padding(10)
            .onClick(async () => {
              await this.handleAgreePrivacy();
            });

          // 拒绝按钮
          Button('拒绝')
            .fontSize(18)
            .backgroundColor('#FF3B30')
            .fontColor('#FFFFFF')
            .width('80%')
            .padding(10)
            .onClick(() => {
              this.handleRejectPrivacy();
            });
        }
        .width('90%')
        .height('50%')
        .padding(20)
        .backgroundColor('#FFFFFF')
        .borderRadius(10)
        .alignItems(HorizontalAlign.Center)
        .justifyContent(FlexAlign.SpaceAround);
      }
    }.backgroundImage($r('app.media.rice'))
  }




  // 初始化 Preferences 并检查隐私协议状态
  async initPreferencesAndCheck() {
    try {
      this.preferencesInstance = await preferences.getPreferences(globalThis.abilityContext, 'user_preferences');
      const privacyAccepted = await this.preferencesInstance.get('privacyAccepted', 'false'); // 默认值为 'false'
      if (privacyAccepted === 'true') {
        this.isPrivacyAccepted = true; // 已同意隐私协议
      } else {
        this.showPrivacyDialog = true; // 显示隐私协议对话框
      }
    } catch (error) {
      console.error('初始化 Preferences 或检查隐私协议状态失败：', error);
    } finally {
      this.isPreferencesReady = true; // 无论成功与否，都设置为已准备好
    }
  }



  // 用户同意隐私协议
  async handleAgreePrivacy() {
    try {
      this.isPrivacyAccepted = true; // 用户同意隐私协议
      this.showPrivacyDialog = false; // 隐藏对话框
      this.showToast('隐私协议已同意');
    } catch (error) {
      console.error('保存隐私协议状态失败：', error);
      this.showToast('保存隐私协议失败，请重试！');
    }
  }

  // 用户拒绝隐私协议
  handleRejectPrivacy() {
    this.showPrivacyDialog = false; // 隐藏对话框
    this.showToast('您必须同意隐私协议才能使用本系统！');
    // 考虑提供退出或其他选项
  }


  //判断是否输入正确
  isFormValid(): boolean {
    if (this.userName.trim().length === 0 || this.password.trim().length === 0) {
      this.showToast('用户名或者密码必须输入！');
      return false;
    }
    return true;
  }

  showToast(message: string) {
    promptAction.showToast({
      message: message,
      duration: 2000,
    });
  }

  login() {

    this.loginModel.login(this.userName,this.password).then((message)=>{
      if(message==='登陆成功'){
        router.pushUrl({
          url:'pages/AdPage'
        })
        return;
      }
      promptAction.showToast({
        message:message,
        duration:2000
      })
    });
  }
}