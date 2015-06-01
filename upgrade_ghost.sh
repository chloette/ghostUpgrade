#stop all
echo '1. stop all -----------------'
forever stopall

#download latest build
echo '2. download latest package -------------------'
rm ghost-latest.zip
wget http://ghost.org/zip/ghost-latest.zip

#rm core
echo '3. delete core dir ---------------'
rm -rf $1/core
rm -rf $1/content/themes/casper
cp $1/config.js .
rm $1/*.js
mv config.js $1/
rm $1/*.json
rm $1/*.md
rm $1/LICENSE

#unzip
echo '4. unzip and merge code ----------------'
unzip -uo ghost-latest.zip -d $1/

#install
rm ghost-latest.zip
cd $1/
echo '5. install package ----------------'
npm install

#change fontapis..
echo '6. replace fonts api ---------------'
sed -i "s/fonts.googleapis.com/fonts.useso.com/g" `grep fonts.googleapis.com -rl ./content/themes/`
sed -i "s/fonts.googleapis.com/fonts.useso.com/g" `grep fonts.googleapis.com -rl ./core/server/views/`

#change post page what to show...
echo '7. replace "excerpt" with "content" ---------------'
#excerpt -> content
#read more -> >>
sed -i "s#<p>{{excerpt words=\"26\"}} <a class=\"read-more\" href=\"{{url}}\">&raquo;#<p>{{content words=\"32\"}} <a class=\"read-more\" href=\"{{url}}\">\&raquo;\&raquo;#g" ./content/themes/casper/partials/loop.hbs

#change logo position
echo '8. change logo position and limit index image layout ----------------'
sed -i 's~{{#if @blog.logo}}<a class="blog-logo" href="{{@blog.url}}"><img src="{{@blog.logo}}" alt="{{@blog.title}}" /></a>{{/if}}~~g' ./content/themes/casper/index.hbs 
sed -i 's~<h1 class="page-title">{{@blog.title}}</h1>~{{#if @blog.logo}}<a class="blog-logo" href="{{@blog.url}}/about"><img src="{{@blog.logo}}" alt="{{@blog.title}}" /></a>{{/if}}<h1 class="page-title">{{@blog.title}}</h1>~g' ./content/themes/casper/index.hbs 
#call python to do multiple lines replacement
python $2/ghost_css_adjustment.py

#copy prism js/css to content and use it (to highlight codes)
echo '9. use prism to highlight code'
cp $2/prism/prism.js ./content/themes/casper/assets/js/
cp $2/prism/prism.css ./content/themes/casper/assets/css/
sed -i 's~<link rel="stylesheet" type="text/css" href="{{asset "css/screen.css"}}" />~<link rel="stylesheet" type="text/css" href="{{asset "css/screen.css"}}" /><link rel="stylesheet" type="text/css" href="{{asset "css/prism.css"}}" />~g' ./content/themes/casper/default.hbs
sed -i 's~<script type="text/javascript" src="{{asset "js/index.js"}}"></script>~<script type="text/javascript" src="{{asset "js/index.js"}}"></script><script type="text/javascript" src="{{asset "js/prism.js"}}"></script>~g' ./content/themes/casper/default.hbs

#try to add comments
if [ -z "$3" ] ; then
  echo "10. no comments."
else
  echo '10. add comments'
  python $2/ghost_add_comments.py $2 $3
fi

#restart
echo '11. restart ---------------'
$2/start_ghost.sh

echo ' ------------ All done. --------------'


