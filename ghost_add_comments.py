#!/usr/bin/python

import sys
import re

def replace_string_in_file(filename, origin, target):
	inFile=open(filename, 'r')

	data = inFile.read()
	data = re.sub(origin, target, data)
	inFile.close()

	outfile = open(filename, 'w')
	outfile.write(data)
	outfile.close()
   	return

folderName=sys.argv[1]
disqusName=sys.argv[2]

comment=folderName+'/disqus/disqus_comment'
commentcount=folderName+'/disqus/disqus_comment_count'

inComment=open(comment, 'r')
inCommentCount=open(commentcount, 'r')

commentcode = inComment.read()
commentcode = re.sub("example", disqusName, commentcode)
inComment.close()

commentcountcode = inCommentCount.read()
commentcountcode = re.sub("example", disqusName, commentcountcode)
inCommentCount.close()

#depends on https://help.disqus.com/customer/portal/articles/1454924-ghost-installation-instructions

#add coments to post.hbs
replace_string_in_file('./content/themes/casper/post.hbs', '<section class="post-content">\s*{{content}}\s*<\/section>', '<section class="post-content">\n{{content}}\n' + commentcode + '</section>')

#add comment code to default.hbs
replace_string_in_file('./content/themes/casper/default.hbs', '<\/body>', commentcountcode + '</body>')

#add count to index.hbs
replace_string_in_file('./content/themes/casper/partials/loop.hbs', '<\/footer>', '<a href="{{url}}#disqus_thread">Comments</a></footer>')

