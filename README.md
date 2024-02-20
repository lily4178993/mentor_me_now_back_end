# MENTOR ME NOW APP<a name="readme-top"></a>

<div align="center">
  <img src="./app/image/MENTOR ME NOW.gif" alt="MentorMeNow logo"/>
  <br/>
  <br/>
  <br/>
</div>

## Table of Contents

- [About Project](#about-project)
- [Built With](#built-with)
- [Tech Stack](#tech-stack)
- [Key Features](#key-features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Install](#install)
- [Usage](#usage)
- [Tests](#tests)
- [Kanban Board](#kanban-board)
- [Authors](#author)
- [Future Features](#future-features)
- [Contributing](#contributing)
- [Show your support](#show-your-support)
- [Acknowledgements](#acknowledgements)
- [License](#license)

## About Project <a name="about-project"></a>

The **MentorMeNow Backend** app is a Rails API that fetches Users, Mentors & Reservations from a PostgreSQL database, demonstrating basic Rails API development. For a practical application, the **MentorMeNow** app consumes this API to display mentors, showcasing a full-stack integration with React, Vite, and TailwindCSS.

[See the MentorMeNow app in action here](https://github.com/martinkarugaba/mentor_me_now_front_end).

---

## Built With <a name="built-with"></a>

- Ruby on Rails
- PostgreSQL

## Tech Stack <a name="tech-stack"></a>

- **Ruby version**: 3.2.2
- **Rails version**: Specify your Rails version
- **Database**: PostgreSQL

## Key Features <a name="key-features"></a>

- API endpoint to fetch Users, Mentors & Reservations 
- PostgreSQL database integration
- Simple and clean codebase focusing on RESTful API design


## Getting Started <a name="getting-started"></a>

### Prerequisites <a name="prerequisites"></a>

- Ruby 3.2.2
- Rails 7.1
- PostgreSQL

### Setup <a name="setup"></a>

1. Clone this repository

```bash
git clone https://github.com/Ayokunnumi1/mentor_me_now_back_end.git
cd mentor_me_now_back_end
```

2. Check your Ruby version

```bash
ruby -v
```

3. Install dependencies

```bash
bundle install
```

4. Update your database informations
  Go to `config/database.yml`. Replace `your_postgres_username` and `your_postgres_password` with your database informations
    ```ruby
      default: &default
      adapter: postgresql
      encoding: unicode
      pool: 5
      username: [your_postgres_username]
      password: [your_postgres_password]
      host: localhost

    development:
      <<: *default
      database: [your_database_for_development]

    test:
      <<: *default
      database: [your_database_for_test]

    production:
      <<: *default
      database: [your_database_for_production]
    ```


### Install <a name="install"></a>

Populate data in the database by running the following commands:

```bash
rails db:create
rails db:migrate
rails db:seed
```

### Usage <a name="usage"></a>

To start the server, run:

```bash
rails s
```

Navigate to `http://localhost:3000/api-docs/` to see the API in action, returning diverse requests.

## Tests <a name="tests"></a>

To run the test suite, execute the following commands:

```bash
rails db:migrate RAILS_ENV=test
rspec
```

## Kanban Board <a name="kanban-board"></a>
- [Kanban board link](https://github.com/users/martinkarugaba/projects/11/views/1)
- [Kanban board initial state](./kabanboardinitialstate.png)
- We are a team of 3 members as indicated in the authors section

## Authors <a name="author"></a>

- Martin Karugaba - [@martinkarugaba](https://github.com/martinkarugaba)
- Ayokunnumi Omololu - [@Ayokunnumi1](https://github.com/Ayokunnumi1)
- Nelly Telli - [@lily4178993](https://github.com/lily4178993/)


## Future Features <a name="future-features"></a>

- Extend the API to include Admin requests
- Implement other operations (e.g., update user profile or cancel a reservation)

## Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Ayokunnumi1/mentor_me_now_back_end/issues).

## Show your support <a name="support"></a>

Give a ⭐️ if this project helped you!

## Acknowledgements <a name="acknowledgements"></a>

- [Microverse](https://github.com/microverseinc)
- Ruby on Rails Community
- PostgreSQL Documentation

## License <a name="license"></a>

This project is [MIT licensed](./LICENSE).

<p align="right">(<a href="#readme-top">back to top</a>)</p>
