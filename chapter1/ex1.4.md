#Exercise 1.4
Observe that our model of evaluation allows
 for combinations whose operators are compound
 expressions. Use this observation to describe 
the behavior of the following procedure:

``
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
``
##Solution:
- if b is less than 0, it subtracts b from a because that will result 
  in adding
- if b is greater than 0 it adds b to a

It results in the same output either way, but does that by
 outputting 'code' in the form of + or -

