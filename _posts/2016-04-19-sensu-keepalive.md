---
layout: post
title: Sensu keepalive alert
category: setup
tag:
  - sensu
  - monitoring
  - alert
---

Reference:
* [stackoverflow](http://stackoverflow.com/questions/33734921/no-keepalive-sent-from-client)
* [google group](https://groups.google.com/forum/#!topic/sensu-users/bRbFu_Xt1z4)

* somehow sensu-server and sensu-client out of time sync
* `date` to output the current timestamp of your nodes
* `sudo service ntpd stop` to stop ntp service
* `sudo ntpdate pool.ntp.org` to manual sync the time
* `sudo service ntpd start` to restart ntp service
* `date` to verify the current timestamp is synced
