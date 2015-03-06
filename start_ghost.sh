#!/bin/sh

forever stop /data/www/nobodycare.me/nobodycare.me/index.js
forever start /data/www/nobodycare.me/nobodycare.me/index.js

forever stop /data/www/woyelaole.com/woyelaole.com/index.js
forever start /data/www/woyelaole.com/woyelaole.com/index.js

forever stop /data/www/plutoland.com/plutoland.com/index.js
forever start /data/www/plutoland.com/plutoland.com/index.js
