#!/bin/sh
tags=(ansible ansible-galaxy archive build cobertura cors cygwin deploy editor elasticsearch elk gem git github gradle grok groovy heroku huginn ifttt java jekyll junit kibana linux logstash logstash-forwarder mount notepad++ pip play provision python rake replace repo resize ruby sbt scala scalatest sed setup sonar sonarqube test text travis unix upgrade vm windows yum)

for tag in ${tags[@]}; do
  if [ "$tag" != "jekyll" ]; then
    sed "s/jekyll/$tag/g" jekyll.md > $tag.md
  fi
done	
