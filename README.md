# Technologies

- Docker compose
- Postgresql
- Ruby on Rails 5 (API only)
- React
- Cucumber (for integration tests)
- Rspec (for unit tests)
- React styled components (for stylings)

# Setup

Before you run the application for the first time, you must:

- Install docker and docker-compose, Check those links:
  <br>
  1- https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04
  <br>

  2- https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-18-04

# Running Application

Then start the project with :

```
docker-compose up --build
```

- note that if you don't configure docker to be used without sudo you will have to run it with sudo.

After the building finish, go to `localhost:3000` and you'll find it up and running (without dta)

# Adding Data

- Run seeds

You should run the seeds with (make sure that the project is up and running before running those commands) :

```
docker-compose exec backend bash
cd backend
rails db:seed
```

After running seeds you should be able to see the data on `localhost:3000` after refreshing it.

# Running tests

- Run tests
  You should run the tests with (make sure that the project is up and running before running those commands) :

<h3>Integration tests</h3>

```
docker-compose exec backend bash
cd backend
cucumber
```

<h3>Unit tests</h3>

```
docker-compose exec backend bash
cd backend
rspec
```

# Backend APIs

- You can find the Backend APIs in the link below: 
<br>
https://documenter.getpostman.com/view/4628217/SWTA9dFh?version=latest