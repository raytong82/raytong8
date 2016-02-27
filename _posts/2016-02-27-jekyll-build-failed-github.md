---
layout: post
title: Jekyll build failed with highlight
category: programming
tag:
  - jekyll
  - build
---

It seems to have some parsing issue when your code blocks contains `{` or `}` character which jekyll thought it is `Tag` to parse instead of your raw code, some people suggested to include `{ % raw %}` and `{ % endraw %}` inside your `highlight` tag. But it did not work for me. After some trail or error, I found out that the solution is to replace **line break** between your raw codes which contains those `{` and `}` characters.