<template>
  <h1>Dialog 示例</h1>
  <Demo :component="Dialog1Demo">
    <template v-slot:desc>
      设置visible属性，它接收Boolean类型，当为true时展示Dialog，Dialog分为两部分，title和content，通过具名插槽定义要展示的内容。closeOnClickOverlay接受一个Boolean类型，当值为true时允许点击遮罩层时关闭Dialog
      可传入两个处理函数分别在确认和取消时候执行，confirmText、cancelText接受String类型，可自定义确认和取消按钮的文案，默认为Ok/Cancel
    </template>
  </Demo>
  <Demo :component="Dialog2Demo">
    <template v-slot:desc>
      可通过openDialog方法来打开对话框
    </template>
  </Demo>
</template>

<script lang="ts">
import Demo from './Demo.vue';
import Dialog1Demo from './Dialog1.demo.vue';
import Dialog2Demo from './Dialog2.demo.vue';
export default {
  components: {
    Demo
  },
  setup() {
    return {
      Dialog1Demo,
      Dialog2Demo
    }
  }
}
</script>
