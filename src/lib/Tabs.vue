<template>
  <div class="lightning-tabs">
    <div class="lightning-tabs-nav" ref="container">
      <div 
        v-for="(t, i) in titles" 
        :key="i" 
        class="lightning-tabs-nav-item" 
        :class="{selected: t === selected}"
        @click="select(t)"
        :ref="el => { if(t === selected) selectedItem = el}"
      >
        {{t}}
      </div>
      <div class="lightning-tabs-nav-indicator" ref="indicator"></div>
    </div>
    <div class="lightning-tabs-content">
      <component class="lightning-tabs-content-item" :is="current" :key="current.props.title"/>
    </div>
  </div>
</template>
<script lang="ts">
import { computed, onMounted, onUpdated, ref, watchEffect } from 'vue'
import Tab from './Tab.vue'
export default {
  props: {
    selected: {
      type: String
    }
  },
  setup(props, context) {
    const selectedItem = ref <HTMLDivElement> (null)
    const indicator = ref < HTMLDivElement > (null)
    const container = ref < HTMLDivElement > (null)
    const changeindicator = () => {
      const { width } = selectedItem.value.getBoundingClientRect()
      indicator.value.style.width = width + 'px'
      const { left: left1 } = container.value.getBoundingClientRect()
      const { left: left2 } = selectedItem.value.getBoundingClientRect()
      const left = left2 -left1
      indicator.value.style.left = left + 'px'
    }
    onMounted(() => {
      watchEffect(changeindicator, {flush: 'post'})
    })
    const defaults = context.slots.default()
    defaults.forEach(tag => {
      if (tag.type !== Tab) {
        throw new Error('Tabs的子标签必须是tab')
      }
    })
    const titles = defaults.map(x => x.props.title)
    const current = computed(() => {
      return defaults.find(x => x.props.title === props.selected)
    })
    const select = (title: String) => {
      context.emit('update:selected', title)
    }
    return {
      defaults,
      titles,
      select,
      selectedItem,
      indicator,
      container,
      current
    }
  }
}
</script>
<style lang="scss">
$blue: #40a9ff;
$color: #333;
$border-color: #d9d9d9;
.lightning-tabs {
  &-nav {
    display: flex;
    color: $color;
    border-bottom: 1px solid $border-color;
    position: relative;
    &-item {
      padding: 8px 0;
      margin: 0 16px;
      cursor: pointer;
      &:first-child {
        margin-left: 0;
      }
      &.selected {
        color: $blue;
      }
    }
     &-indicator {
      position: absolute;
      height: 3px;
      background: $blue;
      left: 0;
      bottom: -1px;
      width: 100px;
      transition: all 250ms;
    }
  }
  &-content {
    padding: 8px 0;
  }
}
</style>