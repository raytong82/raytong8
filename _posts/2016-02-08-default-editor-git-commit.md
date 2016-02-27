---
layout: post
title: Config default editor for git
category: setup
tag:
  - git
  - notepad++
  - editor
---

* update `code.editor` for git
  - `git config --global core.editor npp.sh

**Here is setup using Notepad++**
{% highlight shell %}
#!/bin/sh
"/cygdrive/c/Software_Run/npp.6.8.8.bin/notepad++.exe" -multiInst -nosession -noPlugin "$(cygpath -w "$*")"
{% endhighlight %}