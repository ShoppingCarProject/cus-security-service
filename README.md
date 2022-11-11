# cus-security-service
## Dependencys: 
 - Redis
 - MySql

> With this microservice we are going to generate token to do autentications
> is importan to have a database on the project, the data base is on the proyect, shoppingcar.sql

[I'm shoppingcar.sql](https://github.com/ShoppingCarProject/cus-security-service/blob/main/shoppingcar.sql)
## Endpoints examples: 
Login of the application:
```
curl --location --request POST 'http://localhost:7000/login/authenticate' \
--header 'Content-Type: application/json' \
--data-raw '{"username":"douglas4", "password":"douglas"}'
```

Register a new user:
```
curl --location --request POST 'Localhost:7000/login/register' \
--header 'Content-Type: application/json' \
--data-raw '{"username":"douglas4", "password":"douglas" , "name": "douglas" ,"identification":"000002-2"  , "adress": "lourdes"}'
```
When token is valid we are going to continue, in other cases the user is no autorize
```
curl --location --request POST 'localhost:7000/auth/validate' \
--header 'Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJkb3VnbGFzNCIsImV4cCI6MTY2ODE0OTM3NywiaWF0IjoxNjY4MTMxMzc3fQ.3M9TDknSwa5_OFmGbcSDs7J0EYbjAWoy9d3u9qYLvCCfUPpxYg_KwNjGp-8d3FoNcV_jqVzNhWaJoblPtNQpKw'
```