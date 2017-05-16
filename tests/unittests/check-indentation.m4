m4_include([list.m4])
m4_include([utilities.m4])
m4_include([test-support.m4])

_SET_INDENT([x-])
assert_equals(_INDENT_(0)y, y)
assert_equals(_INDENT_(1)y, x-y)
assert_equals(_INDENT_(2)y, x-x-y)

_SET_INDENT([[x-]])
assert_equals(_INDENT_(1)y, [[x-]y])

_SET_INDENT([  ])
assert_equals(_JOIN_INDENTED(0, a, b), 
[a
b
])
assert_equals(_JOIN_INDENTED(1, a, b), 
[  a
  b
])

assert_equals(_JOIN_INDENTED(1, a, _INDENT_MORE(b, c), d, e), 
[  a
    b
    c
  d
  e
])

assert_equals(_COMM_BLOCK(1, x, [BOMB]), [])

m4_define([COMMENT_OUTPUT])

assert_equals(_COMM_BLOCK(1, x, [BOMB]),
[  x
  BOMB
])

assert_equals(_POSSIBLY_REPEATED_COMMENT_BLOCK([comment-topic], [there], 1, x, [BOMB]),
[  x
  BOMB
])

assert_equals(_POSSIBLY_REPEATED_COMMENT_BLOCK([comment-topic], [here], 1, x, [BOMB]), [See the comment at there])

assert_equals(_SUBSTITUTE_LF_FOR_NEWLINE_AND_INDENT([first\nsecond]), [first
		second])

assert_equals(_SUBSTITUTE_LF_FOR_NEWLINE_AND_INDENT([first\\nsecond]), [first\\nsecond])