---
layout: post
title: Heroku Config
category: setup
tag:
  - scala
  - play
  - heroku
---

* Sometimes you may want to have configuration which you don't commit with your source code
  - You could config that in environment variable

* When deploy application to Heroku, you can
  - config manually via dashboard
  - or using command (Heroku Configuration)[https://devcenter.heroku.com/articles/config-vars]
{% highlight shell linenos %}
$ heroku config:set GITHUB_USERNAME=joesmith
Adding config vars and restarting myapp... done, v12
GITHUB_USERNAME: joesmith

$ heroku config
GITHUB_USERNAME: joesmith
OTHER_VAR:    production

$ heroku config:get GITHUB_USERNAME
joesmith

$ heroku config:unset GITHUB_USERNAME
Unsetting GITHUB_USERNAME and restarting myapp... done, v13
{% endhighlight %}

* For deployment Play application, it is necessary to config the [secret](https://www.playframework.com/documentation/2.4.3/ApplicationSecret)
{% highlight scala linenos %}
play.crypto.secret="changeme"              # set to changeme in dev, do not do this in production
play.crypto.secret=${?APPLICATION_SECRET}  # override the secret if provided in environment varilable
{% endhighlight %}