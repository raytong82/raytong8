---
layout: post
title: Install Huginn
category: setup
tag:
  - huginn
  - ifttt
  - ruby
  - rake
  - gem
---

* clone the repository to local
{% highlight shell %}
git clone https://github.com/cantino/huginn.git
{% endhighlight %}
* go to local repository
{% highlight shell %}
cd huginn
{% endhighlight %}
* install ruby gems
{% highlight shell %}
gem install rake bundle
{% endhighlight %}
* copy environment setting
{% highlight shell %}
cp .env.example .env
{% endhighlight %}
* install dependencies
{% highlight shell %}
bundle install
{% endhighlight %}
* generate secret token
{% highlight shell %}
rake secret
{% endhighlight %}
* modify the secret with the value from above
{% highlight shell %}
vi .env
{% endhighlight %}
* create DB with sample data
{% highlight shell %}
rake db:create
rake db:migrate
rake db:seed
{% endhighlight %}
* launch the server
{% highlight shell %}
foreman start
{% endhighlight %}
* [access via browser](http://localhost:5000)

**Troubleshooting**

- Error while installing mysql2 from bundle
{% highlight shell %}
checking for mysql.h... no
checking for mysql/mysql.h... no
{% endhighlight %}
- `yum install mysql-devel`