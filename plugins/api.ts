export default defineNuxtPlugin(() => {
  const config = useRuntimeConfig()
  const api = $fetch.create({ baseURL: config.public.apiBase as string })
  console.log('API Base URL:', config.public.apiBase)
  return { provide: { api } }
})