<demo>
一键打开 Dialog
</demo>
<template>
<div>
  <l-button @click="showDialog">打开对话框</l-button>
</div>
</template>

<script lang="ts">
import lUI from 'lightning-ui-beta'
const { Button, openDialog } = lUI
import {
  ref,
  h
} from 'vue'
export default {
  components: {
    [Button.name]: Button
  },
  setup() {
    const showDialog = () => {
      openDialog({
        title: h('strong', {}, '标题'),
        content: '你好',
        ok() {
          console.log('ok')
        },
        cancel() {
          console.log('cancel')
        }
      })
    }
    return {
      showDialog
    }
  }
}
</script>