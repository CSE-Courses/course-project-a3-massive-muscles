## API

Nothing too special, nothing too great, favoring simplicity over anything else. Types will be consistent with database types, not a formal documenting effort here anyway.

### POST {{route}}/api/create
#### Params
- user_id (optional, defaults to -1)
- content (thread content)
#### Returns
- thread_id

### POST {{route}}/api/post
#### Params
- user_id (optional, defaults to -1)
- content (post content)

### GET {{route}}/api/latest
#### Returns
Most recent (up to 10) threads created

- Array of threads of the following form
  - thread_id
  - content (first post in the thread's content)

### GET {{route}}/api/thread/{{id}}
#### Returns
All posts in the thread

- Array of posts of the following form
  - user_id
  - time[ of post]
  - content[ of post]
