import router from '@ohos.router'
@Entry
@Component
struct Second {
  @State message: string = 'Hi there'

  onPageShow(){
    console.info('testTag----->', 'Second --- onPageShow ----');
  }

  onPageHide(){
    console.info( 'testTag----->', 'Second --- onPageHide ----');

  }

  onBackPress(){
    console.info('testTag----->', 'Second --- onBackPress ----');
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button() {
          Text('Back')
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height('5%')
        .onClick(()=>{
          router.back({url:'pages/Index',params: {backMessage:'这是上个页面返回回来的数据'}})
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}