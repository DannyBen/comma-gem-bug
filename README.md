Comma Bug Demo
==================================================

Creating this Demo
--------------------------------------------------

This demo was created by following these steps:

1. Create a minimal rails app

```
$ rails new comma-bug --database=sqlite3 --skip-yarn --skip-action-mailer \
  --skip-active-storage --skip-action-cable --skip-sprockets --skip-spring \
  --skip-listen --skip-coffee --skip-javascript --skip-turbolinks \
  --skip-test --skip-system-test  --skip-bootsnap
```

2. Add gem dependencies to Gemfile and run `bundle`

```ruby
# Gemfile
gem 'comma'
```
