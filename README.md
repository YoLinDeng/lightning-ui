# yoli-ui
一个基于vue3+ts的ui库，使用vite搭建
### 1、安装依赖 
yarn 
### 2、启动
yarn dev
### 3、打包
yarn build

### 若想自己搭建vite项目，步骤如下：
```
$ yarn create vite-app <project-name>
$ cd <project-name>
$ yarn
$ yarn dev

```

知识点：

### vue2 与vue3的区别
* 90%的写法是完全一致，除以下几点
* vue3 的Template支持多个根标签, vue2不支持
* vue3有createApp() 而 vue2的是new Vue()
* createApp(组件)，new Vue({template, render})
* 使用ref创建内部数据
* 新v-model 代替以前的v-model和.sync
* content.emit 与this.emit作用相同，在setup中使用

### vue3 的 v-model要求
属性名任意，假设为x
事件名必须为 “update: x”
```
context.emit('update:value', !props.value)

<Switch :value="y" @update:value="y = $event"></Switch>
 // 可以简写为
<Switch v-mode:value="y"></Switch>
```
### provide 与inject的使用
祖先组件中使用 ` provide('menuVisible', menuVisible)`  
在其下面的所以子组件都可以通过`const menuVisible = inject<Ref<Boolean>>('menuVisible')获取

### vue3属性绑定
* 默认所以属性都是绑定在根元素上
* 使用inheritAttrs: false 可以取消默认绑定
* 使用$attrs或者context.attrs获取所以属性
* 使用v-bind=“$attrs”批量绑定属性
* 使用const = { size, ...rest } = context.attrs将属性分开

### props 和attrs区别
* props要先声明才能取值， attrs不用先声明
* props不包含事件，attrs包含
* props没有声明的属性，会跑到attrs里面
* props支持string以外的类型，attrs只有string类型