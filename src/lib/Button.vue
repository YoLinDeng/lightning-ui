<template>
<button class="lightning-button" :class="classes" :disabled="disabled" @click="onClick">
  <span v-if="loading" class="lightning-loadingIndicator"></span>
  <slot />
</button>
</template>

<script lang="ts">
import {
  computed, ref
} from 'vue'
export default {
  props: {
    theme: {
      type: String,
      default: 'button'
    },
    size: {
      type: String,
      default: 'normal'
    },
    level: {
      type: String,
      default: 'normal'
    },
    disabled: {
      type: Boolean,
      default: false
    },
    loading: {
      type: Boolean,
      default: false
    }
  },
  setup(props, context) {
    let clickBtn = ref(false)
    const onClick = () => {
      clickBtn.value = true
      setTimeout(() => {
        clickBtn.value = false
      }, 250)
    }
    const {
      theme,
      size,
      level
    } = props
    const classes = computed(() => {
      return {
        [`lightning-theme-${theme}`]: theme,
        [`lightning-size-${size}`]: size,
        [`lightning-level-${level}`]: level,
        [`lightning-click-animating-node`]: clickBtn.value
      }
    })
    return {
      classes,
      onClick,
      clickBtn
    }
  }
}
</script>

<style lang="scss">
$h: 32px;
$border-color: #d9d9d9;
$color: #333;
$blue: #40a9ff;
$success: #07c160;
$warn: #e6a23c;
$info: #909399;
$radius: 4px;
$red: red;
$grey: grey;
$lightning-wave-shadow-color:#1890ff;

.lightning-button {
  box-sizing: border-box;
  height: $h;
  padding: 0 12px;
  cursor: pointer;
  display: inline-flex;
  justify-content: center;
  align-items: center;
  white-space: nowrap;
  background: white;
  color: $color;
  border: 1px solid $border-color;
  border-radius: $radius;
  box-shadow: 0 1px 0 fade-out(black, 0.95);
  transition: all 250ms;

  &+& {
    margin-left: 8px;
  }

  &:hover,
  &:focus {
    color: $blue;
    border-color: $blue;
  }

  &:focus {
    outline: none;
  }

  &::-moz-focus-inner {
    border: 0;
  }

  &.lightning-theme-link {
    border-color: transparent;
    box-shadow: none;
    color: $blue;

    &:hover,
    &:focus {
      color: lighten($blue, 10%);
    }
  }

  &.lightning-theme-text {
    border-color: transparent;
    box-shadow: none;
    color: inherit;

    &:hover,
    &:focus {
      background: darken(white, 5%);
    }
  }
  &.lightning-theme-dashed {
    border: 1px #d9d9d9 dashed;
    &:focus {
      border-color: $blue;
    }
    &:hover {
      border-color: $blue;
    }
  }
  &.lightning-size-big {
    font-size: 24px;
    height: 48px;
    padding: 0 16px;
  }

  &.lightning-size-small {
    font-size: 12px;
    height: 20px;
    padding: 0 4px;
  }
  // 按钮类型样式
  &.lightning-theme-button {
    position: relative;
    &.lightning-click-animating-node:after{
      position: absolute;
      top: 0;
      right: 0;
      left: 0;
      bottom: 0;
      display: block;
      border-radius: inherit;
      box-shadow: 0 0 0 0 $lightning-wave-shadow-color;
      opacity: .2;
      content: "";
      pointer-events: none;
      animation: fadeEffect 2s cubic-bezier(.08,.82,.17,1),waveEffect .4s cubic-bezier(.08,.82,.17,1);
    }
    &.lightning-level-main {
      background: $blue;
      color: white;
      border-color: $blue;

      &:hover,
      &:focus {
        background: darken($blue, 10%);
        border-color: darken($blue, 10%);
      }
    }
    &.lightning-level-success {
      background: $success;
      border-color: $success;
      color:white;
      &:hover,
      &:focus {
        background: darken($success, 10%);
        border-color: darken($success, 10%);
      }
    }
    &.lightning-level-warn {
      background: $warn;
      border-color: $warn;
      color:white;
      &:hover,
      &:focus {
        background: darken($warn, 10%);
        border-color: darken($warn, 10%);
      }
    }
    &.lightning-level-info {
      background: $info;
      border-color: $info;
      color:white;
      &:hover,
      &:focus {
        background: darken($info, 10%);
        border-color: darken($info, 10%);
      }
    }
    &.lightning-level-danger {
      background: $red;
      border-color: $red;
      color: white;

      &:hover,
      &:focus {
        background: darken($red, 10%);
        border-color: darken($red, 10%);
      }
    }
  }
  // 链接类型样式
  &.lightning-theme-link {
    &.lightning-level-danger {
      color: $red;

      &:hover,
      &:focus {
        color: darken($red, 10%);
      }
    }
    &.lightning-level-success {
      color: $success;

      &:hover,
      &:focus {
        color: darken($success, 10%);
      }
    }
    &.lightning-level-info {
      color: $info;

      &:hover,
      &:focus {
        color: darken($info, 10%);
      }
    }
    &.lightning-level-warn {
      color: $warn;

      &:hover,
      &:focus {
        color: darken($warn, 10%);
      }
    }
  }

  &.lightning-theme-text {
    &.lightning-level-main {
      color: $blue;

      &:hover,
      &:focus {
        color: darken($blue, 10%);
      }
    }

    &.lightning-level-danger {
      color: $red;

      &:hover,
      &:focus {
        color: darken($red, 10%);
      }
    }
  }

  &.lightning-theme-button {
    &[disabled] {
      cursor: not-allowed;
      color: $grey;
      background: #f5f5f5;
      outline: none;
      &:hover {
        border-color: $grey;
      }
    }
  }

  &.lightning-theme-link,
  &.lightning-theme-text {
    &[disabled] {
      cursor: not-allowed;
      color: $grey;
    }
  }

  >.lightning-loadingIndicator {
    width: 14px;
    height: 14px;
    display: inline-block;
    margin-right: 4px;
    border-radius: 8px;
    border-color: $blue $blue $blue transparent;
    border-style: solid;
    border-width: 2px;
    animation: lightning-spin 1s infinite linear;
  }
}
@keyframes fadeEffect { 
  to {
    opacity: 0 
  }
}
@keyframes waveEffect { 
  to { 
    -webkit-box-shadow: 0 0 0 #1890ff;
    box-shadow: 0 0 0 #1890ff;
    -webkit-box-shadow: 0 0 0 6px $lightning-wave-shadow-color; 
    box-shadow: 0 0 0 6px $lightning-wave-shadow-color 
  }
}
@keyframes lightning-spin {
  0% {
    transform: rotate(0deg)
  }

  100% {
    transform: rotate(360deg)
  }
}
</style>
