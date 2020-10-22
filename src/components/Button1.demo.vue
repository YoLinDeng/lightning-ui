<demo>
常规使用
</demo>
<template>
<div>
  <l-button>默认按钮</l-button>
  <l-button theme="link">链接按钮</l-button>
  <l-button theme="text">文本按钮</l-button>
  <l-button theme="dashed">虚线按钮</l-button>
</div>
</template>

<script lang="ts">
import lUI from 'lightning-ui-beta'
const { Button } = lUI

export default {
  components: {
    [Button.name]: Button
  }
}
</script>