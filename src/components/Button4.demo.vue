<demo>
支持 disabled
</demo>
<template>
<l-button disabled>禁用按钮</l-button>
<l-button theme="link" disabled>禁用链接按钮</l-button>
<l-button theme="text" disabled>禁用按钮</l-button>
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