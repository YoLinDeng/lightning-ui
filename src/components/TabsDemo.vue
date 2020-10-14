<template>
  <h1>Tabs 示例</h1>
  <Demo :component="Tabs1Demo">
    <template v-slot:desc>
      设置selected属性，其接收String类型，其值于tab组件中的title值对应。
    </template>
  </Demo>
</template>
<script lang="ts">
import Demo from './Demo.vue'
import Tabs1Demo from './Tabs1.demo.vue'
export default {
  components: {
    Demo
  },
  setup() {
    return {
      Tabs1Demo
    }
  }
}
</script>>