# Project
<p>MiniCRM app using VueJS and Laravel PHP Framework to manage clients and their transactions</p>

## Backend
- Basic Laravel Auth – Ability to log in as an administrator
- Database seeds to create first user with email admin@admin.com and password
‘password’
- CRUD functionality for two menu items: Clients and Transactions
- Clients Table consists of these fields
	+ First Name (required)
	+ Last Name (required)
	+ Avatar (minimum 100x100) (required)
	+ Email (required)
- Transactions Table consists of these fields;
	+ Client (foreign key to clients) (required)
	+ Transaction date (required)
	+ Amount (required)
- Database migrations to create schemas above
- Store client avatars in storage/app/public folder and make them accessible from public
- Basic Laravel resource controllers with default methods – index, create, store etc
- Laravel’s validation function, using Request classes
- Laravel’s pagination for showing Clients/Transactions list, 10 entries per page
- Use Laravel make: auth as default bootstrap, but remove the ability to register
## Front-end
- Bootstrap version 4
- Use of vue.js
- Templates built from scratch
 

## Installation
To clone repository open terminal and type:
```
$ git clone https://github.com/abdoukaba/Laravel-MiniCRM.git for HTTPS
```
or
```
$ git clone git@github.com:abdoukaba/Laravel-MiniCRM.git for SSH
```
- cp .env.example to .env (or copy and edit my .env file with credentials from docker-compose.yml file

Make sure Docker is installed and running
In the root repository folder you have cloned write those commands
```
- Run docker-compose up -d --build
- Run docker-compose exec app composer install --no-scripts (to install vendor packages)
- Run docker-compose exec app php artisan key:generate
- Run docker-compose exec app php artisan migrate (to create tables)
- Run docker exec -it app bash -c "chmod -R 777 /var/www/storage"
- Run docker-compose exec app php artisan db:seed (to optionally seed fake data to database)
```
Then check it on http://localhost:8080
- Login with seeded admin user with credentials 
`admin@admin.com  password`
- In case you have problem with js,css run `docker exec -it app bash -c "npm run prod"`
online version here:
http://ec2-35-180-55-60.eu-west-3.compute.amazonaws.com/clients


## Unit Tests
To run unit tests execute command
- Run docker-compose exec app php ./vendor/bin/phpunit (to run php unit tests)
- Run docker-compose exec app php artisan dusk (to run browser tests)`
