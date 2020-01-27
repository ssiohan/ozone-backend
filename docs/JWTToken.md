# Récupérer un Token
curl -X POST -H "Content-Type: application/json" https://localhost:8000/api/login_check -d '{"username":"admin@ozone.io","password":"oZone.io"}'

# Lancer une requête en collant le token avant le " de fin
curl -X GET https://localhost:8000/api/v1/users -H "Authorization: BEARER "

# Rafraichir le token
curl -X POST -H "Content-Type: application/json" https://localhost:8000/api/token/refresh -d '{"refresh_token": "3f9a1762c513781b7e2347c42eb197c761b37b587734ad096482cba5fc0246b49d12388870e1b00e1bc0bf05e0ca7537c309eaebc7febb5b6352b2579bcc86b9"}'


## Pour Grace :
