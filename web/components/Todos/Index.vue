<script setup lang="ts">
  const dataRef = ref();
  const loading = ref(true);

  onMounted(async () => {
    try {
      const { pending, data } = await useFetch(
        'http://localhost:3004/api/v1/todos',
      );
      loading.value = pending.value;
      dataRef.value = data.value;
    } catch (err) {
      console.error(err);
    }
  });
</script>
<template>
  <div>
    <div v-if="loading">Loading ...</div>
    <p v-if="!loading">Todos</p>
    <ul>
      <li v-for="todo in dataRef" :key="todo.id">
        {{ todo.content }}
      </li>
    </ul>
    <!-- エラーだった場合 -->
    <p v-if="!loading && !dataRef">エラーが発生しました</p>
  </div>
</template>
