<demo>
常规使用
</demo>
<template>
<Tabs v-model:selected="activeTitle">
  <Tab title="导航1">内容1</Tab>
  <Tab title="导航2">内容2</Tab>
</Tabs>
</template>

<script lang="ts">
import Tabs from '../lib/Tabs.vue'
import Tab from '../lib/Tab.vue'
import {
  ref
} from 'vue'
export default {
  components: {
    Tabs,
    Tab
  },
  setup() {
    const activeTitle = ref('导航2')
    return {
      activeTitle
    }
  }
}
</script>