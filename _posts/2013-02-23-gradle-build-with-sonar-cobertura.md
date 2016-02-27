---
layout: post
title: Gradle build with Sonar and Cobertura
category: programming
tag:
  - gradle
  - java
  - groovy
  - scala
  - sonar
  - sonarqube
  - cobertura
  - build
---

*  It seems sonar 3.4+ requires Gradle 1.5
* Sonar default to use Jacoco instead of Cobertura for code coverage but Jacoco for Gradle fairly new and may have issue
{% highlight groovy linenos %}
apply plugin: 'java'
apply plugin: 'groovy'
apply plugin: 'scala'
apply plugin: 'sonar'
apply plugin: 'cobertura'

repositories {
    mavenCentral()
}

dependencies {
  compile group: 'org.codehaus.groovy', name:'groovy-all', version: '2.+'
  compile group: 'org.scala-lang', name: 'scala-library', version: '2.9.2'
  testCompile group: 'junit', name: 'junit', version: '4.+'
  testCompile group: 'org.scalatest', name: 'scalatest_2.9.2', version: '1.9.1'
}

buildscript {
  repositories {
    mavenCentral()
  }
  dependencies {
    classpath "net.saliman:gradle-cobertura-plugin:1.1.1"
  }
}

sonar {
  server {
    url = "http://localhost:9000"
  }
  database {
    url = "jdbc:h2:tcp://localhost:9092/sonar"
    driverClassName = "org.h2.Driver"
    username = "sonar"
    password = "sonar"
  }
  project {
    dynamicAnalysis = "reuseReports"
    coberturaReportPath = file("$buildDir/reports/cobertura/cobertura.xml")
    testReportPath = file("$buildDir/test-results")
  }
}
{% endhighlight %}