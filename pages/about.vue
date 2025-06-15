<template>
  <div>
    <h2>Usersテーブルの取得</h2>

    <p v-if="pending">読み込み中...</p>
    <p v-else-if="error">ユーザーが取得できませんでした😢</p>

    <table v-else>
      <thead>
        <tr>
          <th>id</th>
          <th>name</th>
          <th>email</th>
          <th>created_at</th>
        </tr>
      </thead>
      <tbody>
        <tr
           v-for="user in data"
           :key="`user-${user.id}`"
        >
          <td>{{ user.id }}</td>
          <td>{{ user.name }}</td>
          <td>{{ user.email }}</td>
          <td>{{ fmtDate(user.created_at) }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script setup lang="ts">

const { $api } = useNuxtApp()

const { data, pending, error } = await useAsyncData(
  'users',
  () => $api('/api/v1/users'), { server: false }
)


const fmtDate = (date: string | Date) => {
  const dtf = new Intl.DateTimeFormat('ja', { dateStyle: 'medium', timeStyle: 'short' })
  return dtf.format(new Date(date))
}

</script>
