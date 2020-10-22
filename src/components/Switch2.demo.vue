<demo>
支持 disabled
</demo>
<template>
  <l-switch v-model:value="bool" disabled />
</template>

<script lang="ts">
import lUI from 'lightning-ui-beta'
const { Switch } = lUI

import {
  ref
} from 'vue'
export default {
  components: {
    [Switch.name]: Switch
  },
  setup() {
    const bool = ref(false)
    return {
      bool
    }
  }
}
</script>