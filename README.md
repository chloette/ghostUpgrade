# ghostUpgrade
script to upgrade ghost

---

Environment before using:

1. Ubuntu 14.04 (or similar)
2. ghost0.5.x
3. npm/nodejs/forever

How to use:

1. Clone to home folder
2. change `folder-of-ghost` in `start_ghost.sh` to actual ghost folder 
3. If you need comments (Disqus only), upgrade like this:
`sudo ~/upgrade_ghost.sh ghost_folder Disqus_forum_shortname`,
otherwise:
`sudo ~/upgrade_ghost.sh ghost_folder`
4. Just waiting~ LOL~

Enjoy your latest ghost~

---

What's `upgrade_ghost.sh`：

step1: stop ghost

step2-5: download latest ghost and install（[how-to@ghost.org](http://support.ghost.org/how-to-upgrade)）

step6: **（If you're out of China, please ignore/comment this step.）** 针对国内google fonts被墙，导致[访问性能极差](http://nobodycare.me/2014/09/16/ghost-slower-than-wordpress/)做的优化（使用360的cdn）。 

step7: [show content rather than excerpt @index](http://nobodycare.me/2014/09/22/ghost-display-post-images-on-home-page/)

step8: [make logo looks better](http://nobodycare.me/2014/09/30/optimize-layout-of-ghost-logo/)，and [limit index image width](http://nobodycare.me/2015/01/06/ghost-limit-image-width/)

step9: [use prism to highlight syntax](http://nobodycare.me/2015/03/04/ghost-highlight-syntax/)

step10: add disqus comment（[how-to@disqus.com](https://help.disqus.com/customer/portal/articles/1454924-ghost-installation-instructions),[how-to@ghost.org](http://support.ghost.org/add-disqus-to-my-ghost-blog/)）

step11: restart ghost

That's all~

