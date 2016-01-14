# ember-example-listr-api

An API for [ember-example-listr](https://github.com/jrhorn424/ember-example-listr)

## Dependencies

-   [rails-api](https://github.com/rails-api/rails-api)
-   [ruby](https://www.ruby-lang.org/en/)
-   [postgres](http://www.postgresql.org)

## Installation

1.  Clone this repository.
1.  Install dependencies with `bundle install`.
1.  Create the database with `bin/rake db:create` or `bundle exec rake
db:create`.
1.  Run the API server with `bin/rails server` or `bundle exec rails server`.

## API

### GET /lists

Request:

```sh
curl -X "GET" "http://localhost:3000/lists"
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

### GET /lists/:id

Request:

```sh
curl -X "GET" "http://localhost:3000/lists/1"
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

### POST /lists

Request:

```sh
curl -X "POST" "http://localhost:3000/lists" \
  -H "Content-Type: application/json" \
  -d "{\"list\":{\"title\":\"Groceries\",\"hidden\":false}}"
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

### PATCH /lists/:id

Request:

```sh
curl -X "PATCH" "http://localhost:3000/lists/3" \
  -H "Content-Type: application/json" \
  -d "{\"list\":{\"hidden\":true}}"
```

Response:

```md
HTTP/1.1 204 No Content
```

### DELETE /lists/:id

Request:

```sh
curl -X "DELETE" "http://localhost:3000/lists/3"
```

Response:

```md
HTTP/1.1 204 No Content
```

### GET /items

Request:

```sh
curl -X "GET" "http://localhost:3000/items"
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

### GET /items/:id

Request:

```sh
curl -X "GET" "http://localhost:3000/items/1"
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

### POST /items

Request:

```sh
curl -X "POST" "http://localhost:3000/items" \
  -H "Content-Type: application/json" \
  -d "{\"item\":{\"content\":\"Coding\",\"done\":false,\"list_id\":1}}"
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

### PATCH /items/:id

Request:

```sh
curl -X "PATCH" "http://localhost:3000/items/8" \
  -H "Content-Type: application/json" \
  -d "{\"item\":{\"done\":true}}"
```

Response:

```md
HTTP/1.1 204 No Content
```

### DELETE /items/:id

Request:

```sh
curl -X "DELETE" "http://localhost:3000/items/8"
```

Response:

```md
HTTP/1.1 204 No Content
```
