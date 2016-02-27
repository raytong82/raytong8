---
layout: post
title: Deploy using Heroku Toolbelt
category: setup
tag:
  - deploy
  - heroku
  - git
---

* [download Heroku Toolbelt](https://toolbelt.heroku.com/)
* prepare your application as git repository
{% highlight shell %}
git init
git add .
git commit -a -m "init"
{% endhighlight %}
* create new heroku app
{% highlight shell %}
heroku create --ssh-git
{% endhighlight %}
* alternatively, create via Heroku dashboard and setup repository upstream
{% highlight shell %}
heroku git:remote -a $app_name
{% endhighlight %}
* deploy app
{% highlight shell %}
git push heroku master
{% endhighlight %}
* check app status
{% highlight shell %}
heroku ps
{% endhighlight %}
* view app logs
{% highlight shell %}
heroku logs
{% endhighlight %}