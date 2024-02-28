import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import BaseAbility from './base/BaseAbility';

// export default class EntryAbility extends UIAbility {
export default class EntryAbility extends BaseAbility {
  constructor() {
    super();
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility constructor');
  }


  onCreate(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onCreate');

    // let wantIntent = {
    //   deviceId: '', // deviceId为空表示本设备
    //   bundleName: 'com.example.myapplication',
    //   abilityName: 'FuncAbility',
    //   moduleName: 'module1', // moduleName非必选
    //   parameters: { // 自定义信息
    //     instanceKey: "instanceKeyString"
    //   }
    // }
    //
    // this.context.startAbility(wantIntent).then(()=>{
    //
    // }).catch((err)=>{
    //
    // })


  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onBackground');
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onWindowStageDestroy');
  }

  onWindowStageRestore() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onWindowStageRestore');
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onDestroy');
  }
}
