import router from '@ohos.router'

@Entry
@Component
struct MinePage {
  @State message: string = 'Hi there'
  @State currentIndex: number = 0;
  private tabsController: TabsController = new TabsController()

  aboutToAppear(){
    // this.tabsController.changeIndex(3)
  }

  onPageShow() {
    console.info('base---MinePage-->', ' --- onPageShow ----');
  }

  onPageHide() {
    console.info('base---MinePage-->', ' --- onPageHide ----');

  }

  onBackPress() {
    console.info('base---MinePage-->', ' --- onBackPress ----');
  }

  build() {

    Tabs({ barPosition: BarPosition.End,controller: this.tabsController }) {
      TabContent() {
        Text('首页内容')
          .textAlign(TextAlign.Center)
          .fontSize(30)
          .height('100%')
          .width('100%')
          .backgroundColor('#1698CE')
      }.tabBar(this.TabBuilder('首页', 0, $r('app.media.icon'), $r('app.media.icon')))

      TabContent() {
        Text('商城内容').fontSize(30)
      }.tabBar(this.TabBuilder('商城', 1, $r('app.media.icon'), $r('app.media.icon')))

      TabContent() {
        Text('地图内容')
          .textAlign(TextAlign.Center)
          .fontSize(30)
          .height('100%')
          .width('100%')
          .backgroundColor('#1698CE')
      }.tabBar(this.TabBuilder('地图', 2, $r('app.media.icon'), $r('app.media.icon')))

      TabContent() {
        Text('行程内容').fontSize(30)
      }.tabBar(this.TabBuilder('行程', 3, $r('app.media.icon'), $r('app.media.icon')))

      TabContent() {
        Text('我的内容').fontSize(30)
      }.tabBar(this.TabBuilder('我的', 4, $r('app.media.icon'), $r('app.media.icon')))

    }.scrollable(false)
    /*.onChange((index: number) => {
      console.info("base---------->index: "+index)
      this.currentIndex = index
    })*/

  }

  @Builder TabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex
      this.tabsController.changeIndex(this.currentIndex)
    })
  }
}