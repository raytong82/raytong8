---
layout: post
title: Deploy to Heroku from GitHub Repository
category: setup
tag:
  - deploy
  - heroku
  - git
  - github
  - api
  - travis
---

* create Heroku app via Heroku dashboard
* under `Deploy`, select `GitHub`
* authorize Heroku to access your GitHub account
* type your repository name and search
* you may select `Automatic deploys` when new changes pushed to the target branch
* You may check Wait for CI to pass before deploy which retrieved from your repository
  - Some CI would update the status (e.g. Travis CI)
  - You may check the GitHub api
  - `https://api.github.com/repos/<<your_name>>/<<your_repo_name>>/commits/<<your_branch_name>>/statuses`