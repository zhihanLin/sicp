# Scheme substitution models simulator.
#
# For given Scheme input code output will contain steps in which substitution
# is performed. Original idea is to make it only for the applicative and natural
# order of substitution and to replace daunting taks of doing it by hand for
# even moderately complicated examples while exploring examples from SICP book.
#
# Based on http://norvig.com/lispy.html ideas

# Builds a list of separated tokens out of provided string
def tokenize(s)
  s.gsub!('(', ' ( ').gsub!(')', ' ) ').split()
end

# recursive function for processing of tokens
def process(tokens)
  raise SyntaxError, 'Unexpected EOF encountered' if 0 == tokens.length

  token = tokens.shift

  if '(' == token
    list = []
    while tokens[0] != ')'
      list.push(process(tokens))
    end
    tokens.shift
    return list
  elsif ')' == token
    raise SyntaxError, 'Unexpected ) found'
  else
    token
  end
end

# parsing function
def parse(s)
  tokens = tokenize(s)
  process(tokens)
end


