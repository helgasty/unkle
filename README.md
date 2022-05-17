## Installation

To initialized the project, run this commands :

```bash
bundle install 
rails db:create
rails db:migrate
```

For run automated tasks :
```bash
whenever --update-crontab
bundle exec whenever
```

Run seed to create 2 users (user / admin), and fiew contracts / options :
```bash
rails db:seed
```

Run server : 
```bash
rails s
```

## Gems Uses
- devise : authentication solution for Rails
- dotenv-rails : for define var ENV in .env file
- jwt : use to generate OAuth JSON Web Token (JWT) standard
- cancancan : use to define users authorization
- whenever : define crontab for automatic task
- rspec-rails : testing framework
- ffaker : generates dummy data
- factory_bot_rails : generate entities for testing

## REST API
API can be test with postman, the config file is present in at the root of the project.

## Login

#### Request

`POST localhost:3000/api/v1/login`

```bash
{
    "user": {
        "login": "admin",
        "password": "fz8rrFUs3d@"
    }
}
```
Accounts present in /db/seeds.rb.

#### Response
```bash
{
    "status": "OK",
    "message": "login success",
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE2MjI5Nzg4MzV9.yGrSk5eOrqmLAOfpubLc5tlvX49UygxAl2ASWhxBXgg"
}
```

Response return a "token", it's required for other requests. The token validity set to 2 minutes (10 seconds in TEST ENV).

**WARNING**: this token is required for the other requests **WARNING**

### Show available options

#### Request

`GET localhost:3000/api/v1/option`

#### Response
```bash
[
    {
        "id": 1,
        "code": "tout_risque",
        "description": "Formule tout risque"
    },
    {
        "id": 2,
        "code": "vol_uniquement",
        "description": "Option vol"
    },...
]
```

## USER

### Show specific user information

#### Request

You should be login with admin account.

`GET localhost:3000/api/v1/users/{id}`

Param id is required.

#### Response
```bash
{
    "id": 2,
    "email": "admin@example.com",
    "created_at": "2022-05-14T16:09:29.257Z",
    "updated_at": "2022-05-15T23:10:58.611Z",
    "role": "admin",
    "first_name": null,
    "last_name": null,
    "birth_date": null
}
```
### Show my account information

#### Request

`GET localhost:3000/api/v1/my_account`

### Response
```bash
{
    "id": 2,
    "email": "admin@example.com",
    "created_at": "2022-05-14T16:09:29.257Z",
    "updated_at": "2022-05-15T23:16:32.663Z",
    "role": "admin",
    "first_name": null,
    "last_name": null,
    "birth_date": null
}
```

### Show all users 

### Request

You should be login with admin account.

`GET localhost:3000/api/v1/users_list`

### Response
```bash
[
    {
        "id": 2,
        "email": "admin@example.com",
        "created_at": "2022-05-14T16:09:29.257Z",
        "updated_at": "2022-05-15T23:18:59.523Z",
        "role": "admin",
        "first_name": null,
        "last_name": null,
        "birth_date": null
    },
    {
        "id": 3,
        "email": "test3l@example.com",
        "created_at": "2022-05-14T16:45:23.754Z",
        "updated_at": "2022-05-14T16:45:23.754Z",
        "role": "admin",
        "first_name": "jeremy",
        "last_name": "pestelard",
        "birth_date": "1992-03-01"
    },...
]
```

### Create user

#### Request

You should be login with admin account.

`POST localhost:3000/api/v1/users`

body :

```bash
{
    "user": {
        "email": "test@example.com",
        "password": "fz8rrFUs3d@",
        "first_name": "jeremy",
        "last_name": "pestelard",
        "birth_date": "1992-03-01",
        "role": "admin"
    }
}
```

Fields email / password are required.

#### Response
```bash
{
    "results": {
        "id": 10,
        "email": "test@example.com",
        "created_at": "2022-05-15T23:25:54.360Z",
        "updated_at": "2022-05-15T23:25:54.360Z",
        "role": "admin",
        "first_name": "jeremy",
        "last_name": "pestelard",
        "birth_date": "1992-03-01"
    }
}
```

### Remove user

#### Request

You should be login with admin account.

`DELETE localhost:3000/api/v1/users/id`

Param id is required.

#### Response
```bash
{
    "results": "user deleted"
}
```

## Contract

### Show specific contract information

#### Request

You should be login with admin account.

`GET localhost:3000/api/v1/contracts/{id}`

Param id (of contract) is required.

#### Response 
```bash
{
    "id": 19,
    "numero": "23kk",
    "details": "",
    "status": "pending",
    "begin_date": "2022-01-06",
    "end_date": null,
    "subscriptions": [],
    "users": [],
    "options": [
        {
            "id": 3,
            "code": "incendie",
            "description": "Option incendie"
        },
        {
            "id": 5,
            "code": "cambiolage",
            "description": "Option cambiolage"
        }
    ]
}
```

### Show all contract

#### Request

You should be login with admin account.

`GET localhost:3000/api/v1/contracts_list`

#### Response
```bash
[
    {
        "id": 3,
        "numero": "#00003",
        "details": "",
        "status": "active",
        "begin_date": "2022-01-06",
        "end_date": null,
        "subscriptions": [
            {
                "id": 9,
                "contract_id": 3,
                "user_id": 2,
                "subscribed_at": "2022-05-15T00:00:00.000Z",
                "end_subscription_at": "2022-12-12T00:00:00.000Z",
                "created_at": "2022-05-15T20:43:33.917Z",
                "updated_at": "2022-05-15T22:44:03.531Z"
            }
        ],
        "users": [
            {
                "id": 2,
                "email": "admin@example.com",
                "created_at": "2022-05-14T16:09:29.257Z",
                "updated_at": "2022-05-15T23:37:27.727Z",
                "role": "admin",
                "first_name": null,
                "last_name": null,
                "birth_date": null
            }
        ],
        "options": []
    },
    {
        "id": 4,
        "numero": "#00004",
        "details": "",
        "status": "active",
        "begin_date": "2022-01-06",
        "end_date": null,
        "subscriptions": [],
        "users": [],
        "options": []
    },...
]
```

### Show my contracts

#### Request

`GET localhost:3000/api/v1/my_contracts`

#### Response
```bash
[
    {
        "id": 3,
        "numero": "#00003",
        "details": "",
        "status": "active",
        "begin_date": "2022-01-06",
        "end_date": null,
        "subscriptions": [
            {
                "id": 9,
                "contract_id": 3,
                "user_id": 2,
                "subscribed_at": "2022-05-15T00:00:00.000Z",
                "end_subscription_at": "2022-12-12T00:00:00.000Z",
                "created_at": "2022-05-15T20:43:33.917Z",
                "updated_at": "2022-05-15T22:44:03.531Z"
            }
        ],
        "users": [
            {
                "id": 2,
                "email": "admin@example.com",
                "created_at": "2022-05-14T16:09:29.257Z",
                "updated_at": "2022-05-15T23:37:27.727Z",
                "role": "admin",
                "first_name": null,
                "last_name": null,
                "birth_date": null
            }
        ],
        "options": []
    }
]
```

### Create contract

#### Request

You should be login with admin account.

`POST localhost:3000/api/v1/contracts`

body :

```bash
{
    "contract": {
        "numero": "001",
        "details": "example of contract",
        "amount": "3540",
        "begin_date": "2022-01-06",
        "end_date": "",
        "users": ["admin@example.com"],
        "options": ["vol_uniquement","incendie"]
    }
}
```

Params begin_date / users / options are required.
If numero not set it will be generated automatically.
Numero must be unique.

#### Response
```bash
{
    "results": {
        "id": 29,
        "numero": "001",
        "details": "example of contract",
        "amount": 3540.0,
        "status": "pending",
        "begin_date": "2022-01-06",
        "end_date": null,
        "created_at": "2022-05-15T23:48:54.795Z",
        "updated_at": "2022-05-15T23:48:54.795Z"
    }
}
```

### Subscribe contract

#### Request

`POST localhost:3000/api/v1/subscribe?id={id}`

Params id (of contract) is required.

#### Response
```bash
{
    "results": "subscribed"
}
```

### Unsubscribe contract

#### Request

`POST localhost:3000/api/v1/unsubscribe?id={id}&end_subscription_at={date}`

Params id (of contract) and end_subscription_at (date) is required.

**WARNING** admin can unsubscribe specific user, if email params is set.

#### Response
```bash
{
    "results": "unsubscribed successfully"
}
```

## Testing

To testing this app, run this command :
```bash
rspec
```

## Run automated task

You can run `rake contracts:update_status` to update status of contracts.

This script is run automatically by cron task (with whenever).

The cron configuration is available in `config/schedule.rb` file.

## Author
Jérémy Pestelard

