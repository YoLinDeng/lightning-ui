<demo>
支持 size
</demo>
<template>
<div>
  <div>
    <l-button size="big">大号按钮</l-button>
    <l-button>普通按钮</l-button>
    <l-button size="small">小型按钮</l-button>
  </div>
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