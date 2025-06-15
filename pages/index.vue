<template>
  <div>
    <button type="button" @click="getMsg">
      RailsからAPIを取得する
    </button>

    <div v-for="(msg, i) in msgs" :key="i">
      {{ msg }}
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const msgs = ref([])

const getMsg = async () => {
  try {
    // サーバーサイド／クライアントサイド問わず使えるユーティリティ
    const { $api } = useNuxtApp()
    const res = await $api('/api/v1/users')
    console.log('API', res)
    msgs.value.push(res)
  } catch (e) {
    console.error('API 取得に失敗しました', e)
  }
}
</script>
