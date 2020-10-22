# 开始使用
请先[安装](#/doc/install)本组件库。

然后在你的代码中写入下面的代码

```
可在全局引用样式（main.js）：import 'lightning-ui-beta/dist/lib/lightning.css'
在单文件组件中引用:
import { Button, Tab, Tabs, Switch, Dialog, openDialog } from "lightning-ui-beta"


```

就可以使用我提供的组件了。

## Vue 单文件组件

代码示例：

```
<template>
  <div>
    <l-button>按钮</l-button>
    <l-switch v-model:value="switchValue" />
    <l-tabs v-model:selected="tabSelected">
      <l-tab title="tab1">内容1</l-tab>
      <l-tab title="tab2">内容2</l-tab>
    </l-tabs>
    ....
  </div>
</template>
<script>
import { Button, Tab, Tabs, Switch, Dialog, openDialog } from "lightning-ui-beta"
export default {
  components: { 
    [Button.name]: Button,
    [Switch.name]: Switch,
    [Tabs.name]: Tabs,
    [Tab.name]: Tab,
    [Dialog.name]: Dialog
  }
}
</script>
```