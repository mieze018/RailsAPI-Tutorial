<script setup lang="ts">
  const props = defineProps({
    id: {
      type: [String, Number],
      required: true,
    },
  });
  const loading = ref(false);
  const isEditing = ref(false);
  const TodoContent = ref<string | null | undefined>(null);
  const errorMessage = ref<string | null | undefined>(null);
  const updateTodo = async () => {
    try {
      const { pending } = await useFetch(
        `http://localhost:3004/api/v1/todos/${props.id}`,
        {
          method: 'PUT',
          body: JSON.stringify({
            todo: { content: TodoContent.value },
          }),
        },
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
    <button @click="isEditing = !isEditing" :disabled="loading">
      Todoを編集
    </button>
    <div v-if="isEditing">
      <input
        type="text"
        v-model="TodoContent"
        @change="
          (event: Event) => {
            const target = event.target as HTMLInputElement;
            if (target) TodoContent = target.value;
          }
        "
      />
      <button value="update" @click="updateTodo" :disabled="loading">
        Todoを更新
      </button>
      <button
        value="cancel"
        @click="isEditing = !isEditing"
        :disabled="loading"
      >
        キャンセル
      </button>
    </div>

    <p v-if="errorMessage">エラーが発生しました: {{ errorMessage }}</p>
  </div>
</template>
