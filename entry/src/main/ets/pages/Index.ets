import router from '@ohos.router'
import hilog from '@ohos.hilog';


@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State buttonTex: string = '下一页'

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

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button() {
          Text(this.buttonTex)
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height('5%')
        .onClick(() => {
          router.pushUrl({ url: 'pages/Second' }).then(() => {
            console.info('Succeeded in jumping to the second page.')
          }).catch((err) => {
            console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
          })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}