---
layout: post
title: Play Framework Routes Generator
category: setup
tag:
  - scala
  - play
  - mvc
---

[Play framework documentation](https://www.playframework.com/documentation/2.5.x/ScalaDependencyInjection#Dependency-injecting-controllers)

* Since Play 2.5.0, `Injected Routes Generator` is the default, the way to write `Controller` and `Route` have changed
  - you don't need `@` before your controller method in `Route` as it means different thing
  - you use `class` instead of `object` and use `@Singleton` and `@Inject` for dependency injection

{% highlight scala linenos %}
@Singleton
class HelloWorldController @Inject() extends Controller {
  def echo = Action { request =>
    Ok("Got request [" + request + "]")
  }
}
{% endhighlight %}
{% highlight scala linenos %}
GET     /echo                       controllers.HelloWorldController.echo
{% endhighlight %}