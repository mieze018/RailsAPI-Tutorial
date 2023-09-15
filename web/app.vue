<script setup lang="ts">
  import Todos from '~/components/Todos/Index.vue';
  import CreateTodo from '~/components/Todos/Create.vue';

  const title = 'Rails API Nuxt TODO App';
</script>
<template>
  <div>
    <h1>{{ title }}</h1>
    <Todos />
    <CreateTodo />
  </div>
</template>
