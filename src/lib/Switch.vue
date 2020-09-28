<template>
  <button class="lightning-switch" :class="{ 'lightning-checked': value }" @click="toggle">
    <span class="check-btn"></span>
    <span class="switch-txt" v-if="isShowText">{{ value ? checkedText : unCheckedText }}</span>
  </button>
</template>
<script lang="ts">
import { ref } from 'vue'
export default {
  props: {
    value: Boolean,
    checkedText: {
      type: String,
      default: '开启'
    },
    unCheckedText: {
      type: String,
      default: '关闭'
    },
    isShowText: {
      type: Boolean,
      default: false
    }
  },
  setup(props, context) {
    const toggle = () => {
      context.emit('update:value', !props.value)
      context.emit('onChange', !props.value)
    }
    return { toggle }
  }
}
</script>
<style lang="scss">
$h: 22px;
$h2: $h - 4px;
.lightning-switch {
  height: $h;
  min-width: $h * 2;
  border: none;
  background: #bfbfbf;
  border-radius: $h/2;
  position: relative;
  > .check-btn {
    position: absolute;
    top: 2px;
    left: 2px;
    transition: all 250ms ease-in-out;
    &::before {
      content: "";
      position: absolute;
      left: 0;
      right: 0;
      bottom: 0;
      top: 0;
      height: $h2;
      width: $h2;
      background: white;
      border-radius: $h2 / 2;
      transition: all 250ms ease-in-out;
    }
  }
  > .switch-txt {
    font-size: 14px;
    margin: 0 7px 0 25px;
    color: #fff;
  }
  &.lightning-checked { background: #1890ff;
    > span { left: calc(100% - #{$h2} - 2px); }
    > .switch-txt {
      margin: 0 25px 0 7px;
      transition: all 250ms;
    }
  }
  &:focus { 
    outline: none;
    box-shadow: 0 0 0 2px rgba(0,0,0,.1);
  }
  &:hover {
    box-shadow: none;
  }
  &:disabled {
    cursor: not-allowed;
  }
  &:active {
    > span::before { width: $h2 + 4px; }
  }
  &.lightning-checked:active {
    > span::before { width: $h2 + 4px; margin-left: -4px;}
  }
  &.lightning-checked:focus {
    box-shadow: 0 0 0 2px rgba(24,144,255,.2);
  }
}
</style>