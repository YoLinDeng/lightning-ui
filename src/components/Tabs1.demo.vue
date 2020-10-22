<demo>
常规使用
</demo>
<template>
<l-tabs v-model:selected="activeTitle">
  <l-tab title="导航1">内容1</l-tab>
  <l-tab title="导航2">内容2</l-tab>
</l-tabs>
</template>

<script lang="ts">
import lUI from 'lightning-ui-beta'
const { Tabs, Tab } = lUI

import {
  ref
} from 'vue'
export default {
  components: {
    [Tabs.name]: Tabs,
    [Tab.name]: Tab
  },
  setup() {
    const activeTitle = ref('导航2')
    return {
      activeTitle
    }
  }
}
</script>