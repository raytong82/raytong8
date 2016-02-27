---
layout: post
title: Build Play for Scala on Travis CI
category: setup
tag:
  - build
  - travis
  - github
  - play
  - scala
  - sbt
---

**Reference**

https://github.com/playframework/playframework/issues/4839#issuecomment-121237334

Add below line in `your build.sbt`
{% highlight scala %}
resolvers += Resolver.url("Typesafe Ivy releases", url("https://repo.typesafe.com/typesafe/ivy-releases"))(Resolver.ivyStylePatterns)
{% endhighlight %}
Create `.travis.yml` with the following
{% highlight yaml %}
language: scala
scala:
  - 2.11.6

jdk:
  - oraclejdk8
{% endhighlight %}