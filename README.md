# Rails boilerplate

A minimal Rails 8 application for Wodby. It includes PostgreSQL support, Puma,
Sidekiq, a JSON landing page, and a health endpoint.

## Run locally

Install Ruby 3.4 and PostgreSQL, then run:

```sh
bundle install
bin/rails db:prepare
bin/rails test
bin/rails server
```

Open <http://localhost:3000>. The health endpoint is available at
<http://localhost:3000/healthz>.

Wodby supplies `SECRET_KEY_BASE` and the `DB_HOST`, `DB_PORT`, `DB_USERNAME`,
`DB_PASSWORD`, and `DB_NAME` connection variables at runtime.
