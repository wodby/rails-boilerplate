# Rails boilerplate

A full-stack Rails 8 application generated from the official `rails new`
defaults and adapted for Wodby. It includes PostgreSQL, Sidekiq, Solid Cache,
Solid Cable, Propshaft, import maps, Turbo, Stimulus, and a small HTML landing
page.

## Run locally

Install the Ruby version from `.ruby-version` and PostgreSQL, then run:

```sh
bin/setup
```

Open <http://localhost:3000>. The application health endpoints are available
at <http://localhost:3000/healthz> and <http://localhost:3000/up>.

## Runtime configuration

Wodby supplies `SECRET_KEY_BASE` and the `DB_HOST`, `DB_PORT`, `DB_USERNAME`,
`DB_PASSWORD`, and `DB_NAME` database variables. The primary, cache, and cable
Rails connections intentionally share the provisioned application database
while retaining their separate schema paths.

Sidekiq is the production Active Job backend. The Rails stack runs it as a
separate worker service and supplies `REDIS_URL` through its required Valkey
service. Valkey is configured with persistence and a `noeviction` memory
policy so queued jobs are not treated as disposable cache entries.

## Verify

```sh
bin/ci
```

The Wodby build uses the repository `Dockerfile` and `.wodby/pipeline.yml`.
