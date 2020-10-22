<demo>
常规使用
</demo>
<template>
<div>
  <l-button @click="toggle">打开对话框</l-button>
  <l-dialog
    v-model:visible="visibleDialog"
    :closeOnClickOverlay="false"
    :ok="confirm"
    :cancel="cancel"
    confirmText="确认"
    cancelText="取消"
    >
    <template v-slot:title>
      <strong>加粗标题</strong>
    </template>
    <template v-slot:content>
      <strong>hi～</strong>
      <div>hello</div>
    </template>
  </l-dialog>
</div>
</template>

<script lang="ts">
import lUI from 'lightning-ui-beta'
const { Button, Dialog } = lUI
import { ref } from 'vue'

export default {
  components: {
    [Button.name]: Button,
    [Dialog.name]: Dialog
  },
  setup() {
    const visibleDialog = ref(false)
    const toggle = () => {
      visibleDialog.value = !visibleDialog.value
    }
    const confirm = () => {
      console.log('click confirm')
      return false
    }
    const cancel = () => {
      console.log('click cancel')
    }
    return {
      visibleDialog,
      toggle,
      confirm,
      cancel
    }
  }
}
</script>