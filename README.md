Comma Bug Demo
==================================================

This is a demo for [Comma issue #113](https://github.com/comma-csv/comma/issues/113)

Usage
--------------------------------------------------

1. Clone the repository
2. Run `rails server -b 0.0.0.0`
3. Go to <http://localhost:3000/audits.csv>
4. Get the error

Optional verification:

1. Update the Gemfile to use version 4.2.0
2. Restart the server and go to <http://localhost:3000/audits.csv>
3. See it is downloading a CSV as expected


Creating this Demo
--------------------------------------------------

This demo was created by following these steps:


### Step 1. Create a minimal rails app

```shell
$ rails new comma-bug --database=sqlite3 --skip-yarn --skip-action-mailer \
  --skip-active-storage --skip-action-cable --skip-sprockets --skip-spring \
  --skip-listen --skip-coffee --skip-javascript --skip-turbolinks \
  --skip-test --skip-system-test  --skip-bootsnap
```


### Step 2. Add gem dependencies to Gemfile and run `bundle`

```ruby
# Gemfile
gem 'comma'
gem 'audited'   # this gem uses polymorphic associations
```


### Step 3. Scaffold a sample model

```shell
$ rails g scaffold user name:string email:string
$ rails db:migrate
```


### Step 4. Install audited

```shell
$ rails generate audited:install
$ rails db:migrate
```


### Step 5. Update `User` model

- See [app/models/user.rb](app/models/user.rb)


### Step 6. Create a couple of users

- Go to <http://localhost:3000/users>


### Step 7. Create audits model and controller

- See [app/models/audit.rb](app/models/audit.rb)
- See [app/controllers/audits_controller.rb](app/controllers/audits_controller.rb)
- See [config/routes.rb](config/routes.rb)

Note that the error is caused by this piece of code:

```ruby
# app/models/audit.rb
class Audit < Audited.audit_class
  comma do
    id
    version
    created_at
    auditable_id
    auditable_type
    action
    user_id
    audited_changes

    # These lines are the ones causing the error
    # - Without them, the CSV generation works
    # - With them, and with comma 4.2.0, the CSV generation works
    auditable identity: 'Auditable name'
    user name: 'User name'
  end
end

```


### Step 8. Download a CSV

- Go to <http://localhost:3000/audits.csv>
- And get the error `Polymorphic association does not support to compute class.`
