<template>
  <div>Tabs 示例</div>
  <h1>事例1</h1>
  <Tabs v-model:selected="activeTab">
    <Tab title="导航1">内容一</Tab>
    <Tab title="导航2">内容二</Tab>
  </Tabs>
</template>
<script lang="ts">
import { ref } from 'vue'
import Tab from '../lib/Tab.vue'
import Tabs from '../lib/Tabs.vue'
export default {
  components: {
    Tab,
    Tabs
  },
  setup() {
    const activeTab = ref('导航1')
    return {
      activeTab
    }
  }
}
</script>>