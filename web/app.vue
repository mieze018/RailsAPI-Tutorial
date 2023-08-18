<script setup lang="ts">
const { data: healthChecks } = await useFetch(
  'http://localhost:3004/api/v1/healthchecks'
)
const title = 'Rails API Nuxt TODO App'
console.log(healthChecks)
</script>
<template>
  <div>
    <h2>Heath Check</h2>
    <p>Count: {{ healthChecks }}</p>

    <NuxtWelcome />
  </div>
</template>
