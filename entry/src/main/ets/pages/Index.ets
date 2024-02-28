import router from '@ohos.router'
import common from '@ohos.app.ability.common';
import { RouterConstant } from '../constants/RouterConstant';


@Entry
@Component
struct Index {
  @State message: string = 'Welcome'
  @State buttonTex: string = '下一页'
  private context = getContext(this) as common.UIAbilityContext
  private count:number =0

  onPageShow() {
    var backMessage: String = router.getParams()?.['backMessage']
    // hilog.info(0x0000, 'testTag', 'Index --- onPageShow ----');
    console.info('testTag----->', 'Index --- onPageShow ----backMessage: '+backMessage);
  }

  onPageHide() {
    console.info('testTag----->', 'Index --- onPageHide ----');

  }

  onBackPress() {
    console.info('testTag----->', 'Index --- onBackPress ----');
  }

  aboutToAppear(){
    console.info('testTag----->', 'Index --- aboutToAppear ----');
    // let skipWait: number = setInterval(() => {
    //   this.count++
    //   console.info('testTag----->', 'Index --- aboutToAppear ----'+this.count);
    // }, 3000)

    let timeOut = setTimeout(() => {
      console.info('testTag----->', 'Index --- setTimeout ----' + this.count);
      this.navigationToLogin()
      clearTimeout(timeOut)
    }, 2 * 1000)

    // clearTimeout(timeOut)
    // clearInterval(skipWait)
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        // Button() {
        //   Text(this.buttonTex)
        //     .fontSize(30)
        //     .fontWeight(FontWeight.Bold)
        // }
        // .type(ButtonType.Capsule)
        // .margin({
        //   top: 20
        // })
        // .backgroundColor('#0D9FFB')
        // .width('40%')
        // .height('5%')
        // .onClick(() => {
        //   this.navigationToLogin()
        // })
      }
      .width('100%')
    }
    .height('100%')
  }

  navigationToLogin(){
    // let wantIntent = {
    //   deviceId: '', // deviceId为空表示本设备
    //   bundleName: 'com.example.myapplication',
    //   abilityName: 'LoginAbility',
    //   // moduleName: 'module1', // moduleName非必选
    //   parameters: { // 自定义信息
    //     instanceKey: "instanceKeyString"
    //   }
    // }
    // this.context.startAbility(wantIntent)
    router.pushUrl({ url: RouterConstant.LOGIN_PAGE_URL }).then(() => {
      console.info('Succeeded in jumping to the second page.')
    }).catch((err) => {
      console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
    })
  }
}