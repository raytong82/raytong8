---
layout: post
title: "Gradle build for Java, Groovy and Scala"
category: programming
tag:
  - gradle
  - java
  - groovy
  - scala
  - scalatest
  - junit
  - build
---

*  Make sure scala and scalatest are binary compatible
{% highlight groovy linenos %}
apply plugin: 'java'
apply plugin: 'groovy'
apply plugin: 'scala'

repositories {
    mavenCentral()
}

dependencies {
  compile group: 'org.codehaus.groovy', name:'groovy-all', version: '2.+'
  compile group: 'org.scala-lang', name: 'scala-library', version: '2.9.2'
  testCompile group: 'junit', name: 'junit', version: '4.+'
  testCompile group: 'org.scalatest', name: 'scalatest_2.9.2', version: '1.9.1'
}
{% endhighlight %}
* To run ScalaTest with JUnit, annotated the class with JUnitRunner
{% highlight scala %}
@RunWith(classOf[JUnitRunner])
{% endhighlight %}
* To run ScalaTest separately, append ant task for test
{% highlight scala linenos %}
test << {
  ant.taskdef(
    name: 'scalatest',
    classname: 'org.scalatest.tools.ScalaTestAntTask',
    classpath: classpath.asPath
  )
  ant.scalatest(
    runpath: testClassesDir,
    haltonfailure: 'true',
    fork: 'false') {
    reporter(type: 'stderr')
  }
}{% endhighlight %}
