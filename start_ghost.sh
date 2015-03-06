#!/bin/sh

#sometimes this does not work...
forever stopall

cd /folder-of-ghost
forever start index.js