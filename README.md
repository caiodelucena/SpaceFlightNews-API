# Back-end Challenge 🏅 2021 - Space Flight News

## - Stacks:
<table>
  <tr>
    <td>Ruby version</td>
    <td>
      3.0.2
    </td>
  </tr>
  <tr>
    <td>Rails version</td>
    <td>
      6.1.4
    </td>
  </tr>
  <tr>
    <td>Database</td>
    <td>
      PostgreSQL 13.5
    </td>
  </tr>
</table>

## - Description:
 - Construction of an API to import Space Flight News articles


- To feed your database you must create a script to store the data for all articles in the Space Flight News API.

- Develop a CRON to run daily at 9am and store in its the new articles to your database. 


##  - Initial settings to run the project:

```bash
# clone the project
git clone https://github.com/caiodelucena/SpaceFlightNews-API.git

# enter the cloned directory
cd SpaceFlightNews-API

# install Ruby on Rails dependencies
bundle install 

# create the development and test databases
rails db:create

# create the tables
rails db:migrate

# run the project
rails s
```

The backend is available at `http://localhost:3000` to use in your local machine.

## - Import Data:

```bash
# This script will perform the data import from the Space Flight News API
  rails c

# Inside the Rails Console, Run: 
  Articles::ImportJob.perform_now
```
## - Tests:

To run the tests:

```bash
# All tests
  rspec
```

```bash
- Article:

  ## Controller:
  rspec spec/requests/api/v1/articles_spec.rb

  ## Model:
  rspec spec/models/article_spec.rb
```

## - API Endpoint: 

- The following endpoints are available:

| Endpoints                   | Usage                                     | 
| --------------------------- | ----------------------------------------- | 
| `GET /`                      | Index message
| `GET /api/v1/articles`           | Get all of the articles.                    |
| `GET /api/v1/articles/:id`       | Get the details of a single article        |
| `GET /api/v1/articles?page=<number_of_page>`       | Get the specific articles page         |
| `POST /api/v1/articles`          | Create an article.                           | 
| `PATCH /api/v1/articles/:id`       | Edit the details of an existing article.     | 
| `DELETE /api/v1/articles/:id`    | Remove the article.                      |  
                   

