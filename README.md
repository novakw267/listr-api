[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# listr-api

An API for [ember-resources](https://github.com/ga-wdi-boston/ember-resources)

## Installation

1.  [Fork and] clone this repository.
1.  Install dependencies with `bundle install`.
1.  Create a `.env` for sensitive settings (`touch .env`).
1.  Generate new `development` and `test` secrets (`bundle exec rake secret`).
1.  Store them in `.env` with keys `SECRET_KEY_BASE_<DEVELOPMENT|TEST>`
    respectively.
1.  Setup your database with `bin/rake db:nuke_pave` or `bundle exec rake
    db:nuke_pave`.
1.  Run the API server with `bin/rails server` or `bundle exec rails server`.

## Tasks

Developers should run these often!

-   `bin/rake routes` lists the endpoints available in your API.
-   `bin/rake test` runs automated tests.
-   `bin/rails console` opens a REPL that pre-loads the API.
-   `bin/rails db` opens your database client and loads the correct database.
-   `bin/rails server` starts the API.
-   `scripts/*.sh` run various `curl` commands to test the API. See below.

<!-- TODO -   `rake nag` checks your code style. -->
<!-- TODO -   `rake lint` checks your code for syntax errors. -->

## API

### Lists

| Verb   | URI Pattern  | Controller#Action |
|:-------|:-------------|:------------------|
| GET    | `/lists`     | `lists#index`     |
| GET    | `/lists/:id` | `lists#show`      |
| POST   | `/lists`     | `lists#create`    |
| PATCH  | `/lists/:id` | `lists#update`    |
| DELETE | `/lists/:id` | `lists#destroy`   |

#### GET /lists

Request:

```sh
curl --include --request GET http://localhost:3000/lists
```

Response:

```json
[
  {
    "id": 1,
    "title": "Favorite Things",
    "hidden": false,
    "items": [
      1,
      2,
      3,
      4,
      5
    ]
  },
  {
    "id": 2,
    "title": "Todo",
    "hidden": false,
    "items": [
      6,
      7
    ]
  }
]
```

#### GET /lists/:id

Request:

```sh
curl --include --request GET http://localhost:3000/lists/$ID
```

Response:

```json
{
  "id": 1,
  "title": "Favorite Things",
  "hidden": false,
  "items": [
    1,
    2,
    3,
    4,
    5
  ]
}
```

#### POST /lists

Request:

```sh
curl --include --request POST http://localhost:3000/lists \
  --header "Content-Type: application/json" \
  --data '{
    "list": {
      "title": "Groceries",
      "hidden": false
    }
  }'
```

Response:

```json
{
  "id": 3,
  "title": "Groceries",
  "hidden": false,
  "items": []
}
```

#### PATCH /lists/:id

Request:

```sh
curl --include --request PATCH http://localhost:3000/lists/$ID \
  --header "Content-Type: application/json" \
  --data '{
    "list": {
      "hidden": true
    }
  }'
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /lists/:id

Request:

```sh
curl --include --request DELETE http://localhost:3000/lists/$ID
```

Response:

```md
HTTP/1.1 204 No Content
```

### Items

| Verb   | URI Pattern             | Controller#Action |
|:-------|:------------------------|:------------------|
| GET    | `/lists/:list_id/items` | `items#index`     |
| GET    | `/items/:id`            | `items#show`      |
| POST   | `/lists/:list_id/items` | `items#create`    |
| PATCH  | `/items/:id`            | `items#update`    |
| DELETE | `/items/:id`            | `items#destroy`   |

#### GET /lists/:list_id/items

Request:

```sh
curl --include --request GET "http://localhost:3000/lists/$LIST_ID/items"
```

Response:

```json
[
  {
    "id": 1,
    "content": "Cats",
    "done": false,
    "list": 1
  },
  {
    "id": 2,
    "content": "Star Wars",
    "done": false,
    "list": 1
  },
  // ...
]
```

#### GET /items/:id

Request:

```sh
curl --include --request GET http://localhost:3000/items/$ID
```

Response:

```json
{
  "id": 1,
  "content": "Cats",
  "done": false,
  "list": 1
}
```

#### POST /items

Request:

```sh
curl --include --request POST http://localhost:3000/items \
  --header "Content-Type: application/json" \
  --data '{
    "item": {
      "content": "Coding",
      "done": false,
      "list_id": 1
    }
  }'
```

Response:

```json
{
  "id": 8,
  "content": "Coding",
  "done": false,
  "list": 1
}
```

#### PATCH /items/:id

Request:

```sh
curl --include --request PATCH http://localhost:3000/items/$ID \
  --header "Content-Type: application/json" \
  --data '{
    "item": {
      "done": true,
    }
  }'
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /items/:id

Request:

```sh
curl --include --request DELETE http://localhost:3000/items/$ID
```

Response:

```md
HTTP/1.1 204 No Content
```

### Authentication

| Verb   | URI Pattern            | Controller#Action |
|:-------|:-----------------------|:------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl --include --request POST http://localhost:3000/sign-up \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password",
      "password_confirmation": "an example password"
    }
  }'
```

```sh
scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email"
  }
}
```

#### POST /sign-in

Request:

```sh
curl --include --request POST http://localhost:3000/sign-in \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password"
    }
  }'
```

```sh
scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email",
    "token": "33ad6372f795694b333ec5f329ebeaaa"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH http://localhost:3000/change-password/$ID \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "an example password",
      "new": "super sekrit"
    }
  }'
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl --include --request DELETE http://localhost:3000/sign-out/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|:-----|:------------|:------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl --include --request GET http://localhost:3000/users \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "another@example.email"
    },
    {
      "id": 1,
      "email": "an@example.email"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:3000/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "another@example.email"
  }
}
```

## [License](LICENSE)

Source code distributed under the MIT license. Text and other assets copyright
General Assembly, Inc., all rights reserved.
