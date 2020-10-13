## Database

Just a few ideas on what the database schema should look like as of the current interpretation

## Schema

Since nothing else has been really conceptialized yet, there's no real reason to make assumptions about whatever the other tables will look like, but for maximum compatibility, it'll be structured as a relational database with the only assumption being that each user has a unique identifier (called `user_id` in this document).

The goal isn't to make the most space-efficient or computationally-efficient database, but to make it easy to store data categorically.

### External Schemas (Dependencies)

| Datatype | Property |
| -------- | -------- |
| int_64t  | user_id |
| ...      | .... |

### Forum Schema

This should only contain references for fast lookup on post ownership (which includes threads)

| Datatype | Property |
| -------- | -------- |
| int_64t  | post_id |
| int_64t  | user_id |

### Thread Schema

This contains the schema that stores every forum thread which basically just links to the individual posts

| Datatype | Property |
| -------- | -------- |
| int_64t  | thread_id |
| int_64t  | post_id |

### Post Schema

| Datatype | Property |
| -------- | -------- |
| int_64t  | post_id |
| int_64t  | time of post creation |
| str      | content |

Some clarifications on the properties
- `time of post creation` should be the seconds since epoch
