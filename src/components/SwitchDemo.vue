<template>
<div>
  <h1>Switch 组件示例 </h1>
  <Demo :component="Switch1Demo">
    <template v-slot:desc>
      通过设置value，它接收一个Boolean类型，为true代表开启状态，false为关闭状态
    </template>
  </Demo>
  <Demo :component="Switch2Demo">
    <template v-slot:desc>
      设置disable属性，使Switch禁用
    </template>
  </Demo>
  <Demo :component="Switch3Demo">
    <template v-slot:desc>
      设置isShowText属性，当值为true时表示展示文案，它的默认值为false。默认checkedText为开启、unCheckedText为关闭
    </template>
  </Demo>
</div>
</template>

<script lang="ts">
import Switch1Demo from './Switch1.demo.vue'
import Switch2Demo from './Switch2.demo.vue'
import Switch3Demo from './Switch3.demo.vue'
import Demo from './Demo.vue'
export default {
  components: {
    Demo
  },
  setup() {
    return {
      Switch1Demo,
      Switch2Demo,
      Switch3Demo
    }
  }
}
</script>

<style lang="scss" scoped>
$border-color: #d9d9d9;
.demo {
  border: 1px solid $border-color;
  margin: 16px 0 32px;
  >h2 {
    font-size: 20px;
    padding: 8px 16px;
    border-bottom: 1px solid $border-color;
  }
  &-component {
    padding: 16px;
  }
  &-actions {
    padding: 8px 16px;
    border-top: 1px dashed $border-color;
  }
  &-code {
    padding: 8px 16px;
    border-top: 1px dashed $border-color;
    >pre {
      line-height: 1.1;
      font-family: Consolas, 'Courier New', Courier, monospace;
      margin: 0;
    }
  }
}
</style>