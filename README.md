Comma Bug Demo
==================================================

Creating this Demo
--------------------------------------------------

This demo was created by following these steps:


1. Create a minimal rails app

```shell
$ rails new comma-bug --database=sqlite3 --skip-yarn --skip-action-mailer \
  --skip-active-storage --skip-action-cable --skip-sprockets --skip-spring \
  --skip-listen --skip-coffee --skip-javascript --skip-turbolinks \
  --skip-test --skip-system-test  --skip-bootsnap
```


2. Add gem dependencies to Gemfile and run `bundle`

```ruby
# Gemfile
gem 'comma'
gem 'audited'   # this gem uses polymorphic associations
```


3. Scaffold a sample model

```shell
$ rails g scaffold user name:string email:string
$ rails db:migrate
```


4. Install audited

```shell
$ rails generate audited:install
$ rails db:migrate
```

5. Update `User` model

See [app/models/user.rb](app/models/user.rb)


6. Create a couple of users

Go to <http://localhost:3000/users>


7. Download a CSV

Go to <http://localhost:3000/users.csv>

