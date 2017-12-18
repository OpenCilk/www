require 'pygments'

# use a custom Pygments installation (directory that contains pygmentize)
Pygments.start '/usr/local/bin/'

# example of registering a missing or additional lexer
#Pygments::Lexer.create name: 'Turtle', aliases: ['turtle'],
#    filenames: ['*.ttl'], mimetypes: ['text/turtle', 'application/x-turtle']
Pygments::Lexer.create name: 'Cilk', aliases: ['cilk'],
    filenames: ['*.c', '*.cpp'], mimetypes: ['text/x-c']
