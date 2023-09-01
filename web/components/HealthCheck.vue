<script setup lang="ts">
  const healthChecks = ref<string | null | undefined>(null);
  const loading = ref(true);

  onMounted(async () => {
    try {
      const { pending, data } = await useFetch<{ request: string }>(
        'http://localhost:3004/api/v1/healthchecks',
      );
      loading.value = pending.value;
      healthChecks.value = data.value?.request;
    } catch (err) {
      console.error(err);
    }
  });
</script>
<template>
  <div>
    <div v-if="loading">Loading ...</div>
    <p v-if="!loading">healthChecks: {{ healthChecks }}</p>
    <!-- エラーだった場合 -->
    <p v-if="!loading && !healthChecks">エラーが発生しました</p>
  </div>
</template>
