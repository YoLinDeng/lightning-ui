<demo>
支持显示加载中
</demo>
<template>
<div>
  <l-button loading>加载中</l-button>
  <l-button>加载完毕</l-button>
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