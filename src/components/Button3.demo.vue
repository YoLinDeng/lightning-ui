<demo>
支持 level
</demo>
<template>
<div>
  <div>
    <l-button level="main">主要按钮</l-button>
    <l-button>普通按钮</l-button>
    <l-button level="danger">危险按钮</l-button>
    <l-button level="success">成功按钮</l-button>
    <l-button level="warn">警告按钮</l-button>
    <l-button level="info">信息按钮</l-button>
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