CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamp,
  "updated_at" timestamp,
  "first_name" varchar(20),
  "last_name" varchar(20),
  "phone_number" int,
  "birthday" date,
  "last_seen" time,
  "preferred_location" text,
  "shop_location" text
);

CREATE TABLE "desires" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamp,
  "updated_at" timestamp,
  "user_id" serial,
  "content" text NOT NULL,
  "needs_delivery" boolean,
  "deal_done" boolean,
  "call_me" boolean,
  "image_url" text
);

CREATE TABLE "products" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamp,
  "updated_at" timestamp,
  "user_id" serial,
  "description" text,
  "call_me" boolean,
  "image_url" text
);

CREATE TABLE "desire_likes" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamp,
  "updated_at" timestamp,
  "user_id" serial,
  "desire_id" serial
);

CREATE TABLE "product_likes" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamp,
  "updated_at" timestamp,
  "user_id" serial,
  "product_id" serial
);

CREATE TABLE "desire_chats" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamp,
  "updated_at" timestamp,
  "user_id" serial,
  "desire_id" serial
);

CREATE TABLE "product_chats" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamp,
  "updated_at" timestamp,
  "user_id" serial,
  "product_id" serial
);

CREATE TABLE "desire_messages" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamp,
  "updated_at" timestamp,
  "chat_id" serial,
  "sender_id" serial,
  "content" text,
  "image_url" text
);

CREATE TABLE "product_messages" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamp,
  "updated_at" timestamp,
  "chat_id" serial,
  "sender_id" serial,
  "content" text,
  "image_url" text
);

CREATE TABLE "reviews" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamp,
  "updated_at" timestamp,
  "user_id" serial,
  "product_id" serial
);

CREATE TABLE "reposts" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamp,
  "updated_at" timestamp,
  "user_id" serial,
  "desire_id" serial
);

CREATE TABLE "bookmarks" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamp,
  "updated_at" timestamp,
  "user_id" serial,
  "product_id" serial
);

ALTER TABLE "desires" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "products" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "desire_likes" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "desire_likes" ADD FOREIGN KEY ("desire_id") REFERENCES "desires" ("id");

ALTER TABLE "product_likes" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "product_likes" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "desire_chats" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "desire_chats" ADD FOREIGN KEY ("desire_id") REFERENCES "desires" ("id");

ALTER TABLE "product_chats" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "product_chats" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "desire_messages" ADD FOREIGN KEY ("chat_id") REFERENCES "desire_chats" ("id");

ALTER TABLE "product_messages" ADD FOREIGN KEY ("chat_id") REFERENCES "product_chats" ("id");

ALTER TABLE "reviews" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "reviews" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "reposts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "reposts" ADD FOREIGN KEY ("desire_id") REFERENCES "desires" ("id");

ALTER TABLE "bookmarks" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "bookmarks" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");
