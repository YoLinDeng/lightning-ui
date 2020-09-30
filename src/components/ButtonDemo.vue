<template>
  <h1>Button 示例</h1>
  <Demo :component="Button1Demo">
    <template v-slot:desc>
      设置theme属性，支持普通按钮（button）、链接按钮（link）、文本按钮（text）、虚线按钮（dashed）,默认为普通按钮
    </template>
  </Demo>
  <Demo :component="Button2Demo">
    <template v-slot:desc>
      设置size属性，支持大按钮（big）、常规大小按钮（normal）、小按钮（small）, 默认为常规大小按钮
    </template>
  </Demo>
  <Demo :component="Button3Demo">
    <template v-slot:desc>
      设置level属性，支持主要按钮（main）、普通按钮（normal）、危险按钮（danger）、成功按钮（success）、警告按钮（warn）、信息按钮（info）
    </template>
  </Demo>
  <Demo :component="Button4Demo" />
  <Demo :component="Button5Demo" />
</template>

<script lang="ts">
import Demo from "./Demo.vue";
import Button1Demo from "./Button1.demo.vue";
import Button2Demo from "./Button2.demo.vue";
import Button3Demo from "./Button3.demo.vue";
import Button4Demo from "./Button4.demo.vue";
import Button5Demo from "./Button5.demo.vue";
export default {
  components: {
    Demo
  },
  setup() {
    return {
      Button1Demo,
      Button2Demo,
      Button3Demo,
      Button4Demo,
      Button5Demo
    }
  }
}
</script>
