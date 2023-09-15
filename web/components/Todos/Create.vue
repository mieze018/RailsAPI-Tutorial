<script setup lang="ts">
  const loading = ref(false);
  const errorMessage = ref<string | null | undefined>(null);
  const TodoContent = ref<string | null | undefined>(null);

  const createTodo = async () => {
    loading.value = true;
    try {
      const { pending, data } = await useFetch<{ request: string }>(
        'http://localhost:3004/api/v1/todos',
        {
          method: 'POST',
          body: JSON.stringify({
            todo: { content: TodoContent.value },
          }),
        },
      );
      loading.value = pending.value;
    } catch (err) {
      loading.value = false;
      errorMessage.value = err.message;
      console.error(err);
    }
  };
</script>
<template>
  <div>
    <input
      type="text"
      v-model="TodoContent"
      @change="TodoContent = $event.target.value"
    />
    <button value="create" @click="createTodo" :disabled="loading">
      Todoを作成
    </button>
    <p v-if="errorMessage">エラーが発生しました: {{ errorMessage }}</p>
  </div>
</template>
