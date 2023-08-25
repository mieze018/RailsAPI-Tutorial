<script setup lang="ts">
const healthChecks = ref()
const loading = ref(true)

onMounted(async () => {
  const { pending, data } = await useFetch(
    'http://localhost:3004/api/v1/healthchecks'
  )
  loading.value = pending.value
  healthChecks.value = data.value.request
})
const title = 'Rails API Nuxt TODO App'
</script>
<template>
  <div>
    <h1>{{ title }}</h1>
    <div v-if="loading">Loading ...</div>
    <p v-if="!loading">healthChecks: {{ healthChecks }}</p>

    <!-- <NuxtWelcome /> -->
  </div>
</template>
