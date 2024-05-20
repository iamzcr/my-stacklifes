
import { createApp } from 'vue'
import App from './App.vue'
const app = createApp(App)

//pinia状态管理
import { createPinia } from 'pinia'
app.use(createPinia())

//路由
import router from './router'
app.use(router)


//注册element-plus
import ElementPlus from 'element-plus' ;
import 'element-plus/dist/index.css';
app.use(ElementPlus);

//注册所有图标
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
  app.component(key, component)
}

app.mount('#app')
