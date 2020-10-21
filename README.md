# lightning-ui
一个基于vue3+ts的ui库，使用vite搭建，[官网地址](https://yolindeng.gitee.io/lightning-ui-website/#/)
### 安装组件
组件已通过rollup打包后，上传npm。 
在vue3脚手架项目用运行：
```
npm install lightning-ui-beta
```
或  
```
yarn add lightning-ui-beta
```
### 本地运行项目
#### 1、安装依赖 
`yarn `
#### 2、启动
`yarn dev`
#### 3、打包
`yarn build`

### 若想自己搭建vite项目，步骤如下：
```
$ yarn create vite-app <project-name>
$ cd <project-name>
$ yarn
$ yarn dev

```

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

### 项目中的rollup打包配置文件（rollup.config.js）
```
// 安装 rollup-plugin-esbuild rollup-plugin-vue rollup-plugin-scss sass rollup-plugin-terser
import esbuild from 'rollup-plugin-esbuild'
import vue from 'rollup-plugin-vue'
import scss from 'rollup-plugin-scss'
import dartSass from 'sass';
import { terser } from "rollup-plugin-terser"

export default {
  input: 'src/lib/index.ts',
  output: {
    globals: {
      vue: 'Vue'
    },
    name: 'lightning',
    file: 'dist/lib/lightning.js',
    format: 'umd',
    plugins: [terser()]
  },
  plugins: [
    scss({ include: /\.scss$/, sass: dartSass }),
    esbuild({
      include: /\.[jt]s$/,
      minify: process.env.NODE_ENV === 'production',
      target: 'es2015' 
    }),
    vue({
      include: /\.vue$/,
    })
  ],
} 
```
* 安装 rollup-plugin-esbuild rollup-plugin-vue rollup-plugin-scss sass rollup-plugin-terser 等打包需要的插件  
* 通过以上配置，定义打包入口文件，和打包输出目录，使用terser压缩丑化代码，使得代码变小，配置将scss/js/ts/vue/打包成浏览器能够识别的js。 
* 在项目用运行 `rollup -c`,将打包后的文件输出到dist/lib/lightning.js  
* 配置package.json,修改name，version，files（要上传的文件），main（主入口）
```
"name": "lightning-ui",
  "version": "0.0.3",
  "files": [
    "dist/lib/*"
  ],
  "main": "dist/lib/lightning.js",
```
### 配置vite.config.ts
```
// @ts-nocheck
import { md } from "./plugins/md";
import fs from 'fs'
import { baseParse } from '@vue/compiler-core'

export default {
  base: './',
  assetsDir: 'assets',
  plugins: [md()],
  vueCustomBlockTransforms: {
    demo: (options) => {
      const { code, path } = options
      const file = fs.readFileSync(path).toString()
      // 通过baseParse编译为ast,找到标签是为demo的，获取content和源代码
      const parsed = baseParse(file).children.find(n => n.tag === 'demo')
      const title = parsed.children[0].content
      const main = file.split(parsed.loc.source).join('').trim()
      return `export default function (Component) {
        Component.__sourceCode = ${
        JSON.stringify(main)
        }
        Component.__sourceCodeTitle = ${JSON.stringify(title)}
      }`.trim()
    }
  }
};
```
通过vite内置的Custom Blocks（自定义块），定义转换函数，通过vue中的baseParse方法编译组件，生成ast,并找到demo标签，获取content和源代码，将源代码和content转成字符串注入到组件对象中，供demo组件中查看源代码使用。

### 读取md文件
实现plugin（md.ts）,并配置在vite.config.ts中
```
// @ts-nocheck
import path from 'path'
import fs from 'fs'
import marked from 'marked'

const mdToJs = str => {
  const content = JSON.stringify(marked(str))
  return `export default ${content}`
}

export function md() {
  return {
    configureServer: [ // 用于开发
      async ({ app }) => {
        app.use(async (ctx, next) => { // koa
          if (ctx.path.endsWith('.md')) {
            ctx.type = 'js'
            const filePath = path.join(process.cwd(), ctx.path)
            ctx.body = mdToJs(fs.readFileSync(filePath).toString())
          } else {
            await next()
          }
        })
      },
    ],
    transforms: [{  // 用于 rollup // 插件
      test: context => context.path.endsWith('.md'),
      transform: ({ code }) => mdToJs(code) 
    }]
  }
}
```

### 实现代码高亮
[文档](https://prismjs.com/)
安装prismjs, 执行`npm install prismjs`
引入： 
`import 'prismjs'`  
`import 'prismjs/themes/prism-okaidia.css'`  //主题色有多种可以选择
使用方式
`const html = Prism.highlight(code, Prism.languages.html, 'html')`
`<pre class="language-html" v-html="html"></pre>`