<demo>
支持 size
</demo>
<template>
<div>
  <div>
    <Button size="big">大号按钮</Button>
    <Button>普通按钮</Button>
    <Button size="small">小型按钮</Button>
  </div>
</div>
</template>

<script lang="ts">
import Button from "../lib/Button.vue";
export default {
  components: {
    Button
  }
}
</script>