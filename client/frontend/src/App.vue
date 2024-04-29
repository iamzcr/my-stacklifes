<template>
  <n-layout>
      <n-layout-header :inverted="inverted" bordered>
        Header Header Header
        <n-menu mode="horizontal" :inverted="inverted" :options="menuOptions" />
      </n-layout-header>
  
      <n-layout-footer :inverted="inverted" bordered>
        Footer Footer Footer
      </n-layout-footer>
    </n-layout>
</template>

<script setup>
</script>