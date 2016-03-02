#!/bin/sh
# generate md file with tags data
#tags=(ansible ansible-galaxy archive build cobertura cors cygwin deploy editor elasticsearch elk gem git github gradle grok groovy heroku huginn ifttt java jekyll junit kibana linux logstash logstash-forwarder mount notepad++ pip play provision python rake replace repo resize ruby sbt scala scalatest sed setup sonar sonarqube test text travis unix upgrade vm windows yum)

tags=($(curl http://raytong82.github.io/tag/ | grep "<small>" |  sed -r 's/ +<i class="fa fa-tags"><\/i> ([^< ]+)<small>.+/\1/g'))

for tag in ${tags[@]}; do
  sed "s/template/$tag/g" _generate.tpl > $tag.md
done
