# https://www.codeeval.com/open_challenges/4/
# CHALLENGE DESCRIPTION:
# Write a program which determines the sum of the first 1000 prime numbers.
require 'prime'
def sumprime()
  Prime.first(1000).inject(0, :+)
end