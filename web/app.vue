<script setup lang="ts">
// 'http://localhost:3004/api/v1/healthchecks' からuseFetchを使ってデータを取得
const { data: healthChecks } = useFetch(
  'http://localhost:3004/api/v1/healthchecks'
)

const title = 'Rails API Nuxt TODO App'
console.log(healthChecks)
</script>
<template>
  <div>
    <h1>{{ title }}</h1>
    <p>Count: {{ healthChecks }}</p>

    <NuxtWelcome />
  </div>
</template>
