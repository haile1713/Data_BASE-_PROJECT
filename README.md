# DataBase Schema

Table users {
  id serial [pk, increment]
  created_at timestamp
  updated_at timestamp
  first_name varchar(20)
  last_name varchar(20)
  phone_number int
  birthday date
  last_seen time
  preferred_location text [null]
  shop_location text [null]
}

Table desires {
  id serial [pk, increment]
  created_at timestamp
  updated_at timestamp
  user_id serial [ref: > users.id]
  content text [not null]
  needs_delivery bool
  deal_done bool
  call_me bool
  image_url text [null]
}

Table produts {
  id serial [pk, increment]
  created_at timestamp
  updated_at timestamp
  user_id serial [ref: > users.id]
  description text
  call_me bool
  image_url text [null]
}

Table desire_likes {
  id serial [pk, increment]
  created_at timestamp
  updated_at timestamp
  user_id serial [ref: > users.id]
  desire_id serial [ref: > desires.id]
}

Table product_likes {
  id serial [pk, increment]
  created_at timestamp
  updated_at timestamp
  user_id serial [ref: > users.id]
  product_id serial [ref: > produts.id]
}

Table desire_chats {
  id serial [pk, increment]
  created_at timestamp
  updated_at timestamp
  user_id serial [ref: > users.id]
  desire_id serial [ref: > desires.id]
}

Table product_chats {
  id serial [pk, increment]
  created_at timestamp
  updated_at timestamp
  user_id serial [ref: > users.id]
  product_id serial [ref: > produts.id]
}

Table desire_messages {
  id serial [pk, increment]
  created_at timestamp
  updated_at timestamp
  chat_id serial [ref: > desire_chats.id]
  sender_id serial
  content text
  image_url test [null]
}

Table product_messages {
  id serial [pk, increment]
  created_at timestamp
  updated_at timestamp
  chat_id serial [ref: > product_chats.id]
  sender_id serial
  content text
  image_url text [null]
}

Table reviews {
  id serial [pk, increment]
  created_at timestamp
  updated_at timestamp
  user_id serial [ref: > users.id]
  product_id serial [ref: > produts.id]
}

Table reposts {
  id serial [pk, increment]
  created_at timestamp
  updated_at timestamp
  user_id serial [ref: > users.id]
  desire_id serial [ref: > desires.id]
}

Table bookmarks {
  id serial [pk, increment]
  created_at timestamp
  updated_at timestamp
  user_id serial [ref: > users.id]
  product_id serial [ref: > produts.id]
}


### Schema Docs
[Database Docs](https://dbdocs.io/akmelf20/E-commerce)
![ER diagram](./db_scheme/E-commerce.png)
