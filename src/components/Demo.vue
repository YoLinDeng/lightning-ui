<template>
  <div class="demo">
    <h2>{{ component.__sourceCodeTitle }}</h2>
    <div class="desc-box">
      <slot name="desc" />
    </div>
    <div class="demo-component">
      <component :is="component" />
    </div>
    <div class="demo-actions">
      <Button @click="hideCode" v-if="visibleCode">隐藏代码</Button>
      <Button @click="showCode" v-else>查看代码</Button>
    </div>
    <div class="demo-code" v-show="visibleCode">
      <pre class="language-html" v-html="html"></pre>
    </div>
  </div>
</template>
<script lang='ts'>
import Button from '../lib/Button.vue'
import 'prismjs'
import 'prismjs/themes/prism-okaidia.css'
import { computed, ref } from 'vue'
const Prism = (window as any).Prism

export default {
  components: {
    Button
  },
  props: {
    component: Object
  },
  setup(props) {
    const html = computed(() => {
      return Prism.highlight(props.component.__sourceCode, Prism.languages.html, 'html')
    })
    const visibleCode = ref(false)
    const showCode = () => {
      visibleCode.value = true
    }
    const hideCode = () => {
      visibleCode.value = false
    }
    return {
      Prism,
      html,
      showCode,
      hideCode,
      visibleCode
    }
  }
}
</script>

<style lang="scss">
$border-color: #d9d9d9;
.demo {
  border: 1px solid $border-color;
  margin: 16px 0 32px;
  >h2 {
    font-size: 20px;
    padding: 8px 16px;
    border-bottom: 1px solid $border-color;
  }
  > .desc-box {
    font-size: 14px;
    color: #333;
    margin-left: 10px;
    margin-top: 10px;
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