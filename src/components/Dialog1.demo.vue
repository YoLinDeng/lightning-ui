<demo>
常规使用
</demo>
<template>
<div>
  <Button @click="toggle">打开对话框</Button>
  <Dialog
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
  </Dialog>
</div>
</template>

<script lang="ts">
import Dialog from '../lib/Dialog.vue'
import Button from '../lib/Button.vue'
import {
  ref
} from 'vue'
import {
  openDialog
} from '../lib/openDialog'
export default {
  components: {
    Dialog,
    Button
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