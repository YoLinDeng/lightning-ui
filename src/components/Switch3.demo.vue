<demo>
带有文字,支持onChange（变化时的回调）
</demo>
<template>
  <Switch v-model:value="bool1" :isShowText="true" @onChange="change"/>
  <Switch v-model:value="bool2" :isShowText="true" checkedText="正确" unCheckedText="错误"/>
</template>

<script lang="ts">
import lUI from 'lightning-ui-beta'
const { Switch } = lUI

import {
  ref
} from 'vue'
export default {
  components: {
    [Switch.name]: Switch
  },
  setup() {
    const bool1 = ref(false)
    const bool2 = ref(true)
    const change = ($event) => {
      console.log($event)
    }
    return {
      bool1,
      bool2,
      change
    }
  }
}
</script>
<style lang="scss" scoped>
.lightning-switch {
  display: block;
  margin-bottom: 10px;
}
</style>