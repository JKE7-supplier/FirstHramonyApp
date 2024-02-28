import router from '@ohos.router'
import { RouterConstant } from '../constants/RouterConstant'

@Entry
@Component
struct Login {
  @State message: string = 'Login'
  @State userName: string = ''
  @State password: string = ''

  build() {
    Column() {

      Image($r('app.media.icon'))
        .width(76)
        .height(76)
        .margin({ top: 100 })

      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      TextInput({ placeholder: '账号' })
        .type(InputType.Number)
        .width('100%')
        .height(60)
        .margin({ top: 50 })
        .onChange((value: string) => {
          this.userName = value
        })

      TextInput({ placeholder: '密码' })
        .type(InputType.Password)
        .width('100%')
        .height(60)
        .margin({ top: 20 })
        .onChange((value: string) => {
          this.password = value
        })

      Button('登陆')
        .type(ButtonType.Capsule)
        .width('100%')
        .height(60)
        .margin({ top: 20 })
        .onClick(() => {
          console.info("base------------->userName:" + this.userName + "  password:" + this.password)
          this.navigationToHomePage()
        })
      // .backgroundColor('#')

    }
    .width('100%')
    .height('100%')
    .padding({ left: 14, right: 14 })
    .alignItems(HorizontalAlign.Center)
    // .justifyContent(FlexAlign.Center)
  }

  navigationToHomePage() {
    router.pushUrl({ url: RouterConstant.MINE_PAGE_URL })
  }
}