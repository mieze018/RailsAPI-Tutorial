<script setup lang="ts">
  const props = defineProps({
    id: {
      type: [String, Number],
      required: true,
    },
  });
  const loading = ref(false);
  const errorMessage = ref<string | null | undefined>(null);
  const deleteTodo = async () => {
    try {
      const { pending } = await useFetch(
        `http://localhost:3004/api/v1/todos/${props.id}`,
        { method: 'DELETE' },
      );
      loading.value = pending.value;
    } catch (err: any) {
      loading.value = false;
      errorMessage.value = err.message;
    }
  };
</script>
<template>
  <div>
    <button value="delete" @click="deleteTodo" :disabled="loading">
      Todoを削除
    </button>
    <p v-if="errorMessage">エラーが発生しました: {{ errorMessage }}</p>
  </div>
</template>
