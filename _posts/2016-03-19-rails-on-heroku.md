---
layout: post
title: Setup Ruby on Rails Application on Heroku
category: setup
tag:
  - ruby
  - rails
  - postgres
  - heroku
---

* Heroku does not support sqlite, postgres could be used instead

{% highlight ruby %}
# gem 'sqlite3'
gem 'pg'
{% endhighlight %}

* change `config/database.yml` for postgres settings

{% highlight yaml %}
development:
  adapter: postgresql
  database: db_user_dev
  pool: 5
  timeout: 5000
  username: db_user
  password: db_user
test:
  adapter: postgresql
  database: db_user_test
  pool: 5
  timeout: 5000
  username: db_user
  password: db_user

production:
  adapter: postgresql
  database: db_user_prod
  pool: 5
  timeout: 5000
  username: db_user
  password: db_user
{% endhighlight %}

* run `rake db:create` and `rake db:seed` for creating schema and data

* avoid putting sensitive information in code, environment variable is a way, details can be found at [Heroku doc](https://devcenter.heroku.com/articles/config-vars#setting-up-config-vars-for-a-deployed-application)

{% highlight ruby %}
dns = Fog::DNS::AWS.new(
  aws_access_key_id: ENV['aws_access_key_id'],
  aws_secret_access_key: ENV['aws_secret_access_key']
)
{% endhighlight %}