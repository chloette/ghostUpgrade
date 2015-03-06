import re

cssfile='./content/themes/casper/assets/css/screen.css'
infile=open(cssfile, 'r')

replacements = {
	'.blog-logo {([^\}]*)((float: left){1})([^\{]*)}':'.blog-logo {\n    display: block;\n    float: center;\n    background: none !important;\n    border: none !important;\n}', #make logo center
	'.blog-logo img {([^\}]*)((width: auto){1})([^\{]*)}':'.blog-logo img {\n    width: 100px;\n    height: 100px;\n    border: 2px solid white;\n    -webkit-border-radius: 100px;\n    -moz-border-radius: 100px;\n    -ms-border-radius: 100px;\n    -o-border-radius: 100px;\n    border-radius: 100px;\n}', #make logo likes pertty
	'.blog-logo img {([\s]*)((height: 26px;){1})([\s]*)}':'', #remove useless blog-logo img css
	'.blog-logo img {([\s]*)((max-height: 80px;){1})([\s]*)}':'', #same as above
	'.blog-logo img {([\s]*)((padding: 4px 0;){1})([\s]*)}':'', #same as above
	'.blog-logo {([\s]*)((padding: 10px 10px;){1})([\s]*)}':'', #same as above
	'.post-content img {':'.post-content img, .post-excerpt img {' #make sure the excerpt img apparanet like content
	}

data = infile.read()
for src, target in replacements.iteritems():
	data = re.sub(src, target, data)
infile.close()

outfile = open(cssfile, 'w')
outfile.write(data)
outfile.close()



