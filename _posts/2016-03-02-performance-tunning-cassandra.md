---
layout: post
title: Performance tunning for Cassandra
category: setup
tag:
  - cassandra
  - performance
  - nosql
---

* switch client call from `sync` to `async` to avoid blocking operations
* batch operation to turn off logging (default is on for atomic transaction)
* `DowngradingConsistencyRetryPolicy` to retry with lower consistency level attempt
* `TokenAwarePolicy` for cluster session instead of `LoadBalancingPolicy` to route to the host likely to have the token
* improve read with lower `consistency level` on read operations with higher `consistency level` when write
* make sure `commita_log_dir` and `data_dir` are in separate drive (unless for SSD)
