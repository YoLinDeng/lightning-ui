<template>
<div>Dialog 示例</div>
<h1>示例1</h1>
<Button @click="toggle">toggle</Button>
<Dialog v-model:visible="visibleDialog" :closeOnClickOverlay="false" :ok="f1" :cancel="f2">
  <template v-slot:title>
    <strong>提示</strong>
  </template>
  <template v-slot:content>
    <p>第一行字</p>
    <p>第二行字</p>
  </template>
</Dialog>
<h1>示例2</h1>
<Button @click="showDialog">toggle</Button>
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
    const f1 = () => {
      return false
    }
    const f2 = () => {}
    const showDialog = () => {
      openDialog({
        title: '标题',
        content: '你好',
        closeOnClickOverlay: true,
        ok() {
          console.log('ok')
        },
        cancel() {
          console.log('cancel')
        }
      })
    }
    return {
      visibleDialog,
      toggle,
      f1,
      f2,
      showDialog
    }
  }
}
</script>
