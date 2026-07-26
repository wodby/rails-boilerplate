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

Wodby supplies `SECRET_KEY_BASE`, a secret `DATABASE_URL`, and the component
`DB_HOST`, `DB_PORT`, `DB_USERNAME`, `DB_PASSWORD`, and `DB_NAME` variables.
Rails uses `DATABASE_URL` as the authoritative deployed connection. The
primary, cache, and cable connections intentionally share that provisioned
application database while retaining their separate schema paths.

The `test` entry in `config/database.yml` remains a distinct database for
explicit test runs outside a deployed app container. Do not point it at the
provisioned application database.

Sidekiq is the production Active Job backend. The Rails stack runs it as a
separate worker service and supplies `REDIS_URL` through its required Valkey
service. Valkey is configured with persistence and a `noeviction` memory
policy so queued jobs are not treated as disposable cache entries.

When an SMTP service is enabled, the inherited `SMTP_HOST` and `SMTP_PORT`
variables configure Action Mailer automatically. Mailer links use
`WODBY_PRIMARY_HOST` and `WODBY_PRIMARY_URL` in deployed environments, with
localhost retained as the local development fallback.

The [`wodby/service-rails`](https://github.com/wodby/service-rails) repository
defines the Rails build, web, and Sidekiq service configuration. The
[`wodby/stack-rails`](https://github.com/wodby/stack-rails) repository composes
that service with PostgreSQL and Valkey for a deployable Rails application.

## Verify

```sh
bin/ci
```

The Wodby build uses the repository `Dockerfile` and `.wodby/pipeline.yml`.
