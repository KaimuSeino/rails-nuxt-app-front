<!-- ~/components/HelloFetcher.vue -->
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
    const res = await $fetch('http://localhost:3000/api/v1/hello')
    console.log('API', res)
    msgs.value.push(res)
  } catch (e) {
    console.error('API 取得に失敗しました', e)
  }
}
</script>
