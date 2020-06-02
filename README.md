# Ruby on Rails Questions

## 1. Do arguments in Ruby get passed by reference or by value?

Ruby officially passes its arguments by value. To prove it let's take a look on the following examples:

### Example 1

```ruby
def example(argument)
  argument += 1
end

one = 1
example(one)
p one
# 1
```

### Example 2

```ruby
def sort_array(array)
  array.sort
end

my_array = [3, 2, 1]
sort_array(my_array)
p my_array
# [3, 2, 1]
```

## 2. Write a single line of Ruby code that prints the Fibonacci sequence of any length as an array.

```ruby
->(limit, array) { (0..limit).each { |i| if i < 2 then array << i else array << (array[i - 1] + array[i - 2]) end }; p array }.call(10, [])
# [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
```

The above line prints the Fibonacci sequence up to 10 as an array. Any length can be specified via the first argument in the call method.

## 3. How is a block different from a Proc ?

Procs are objects while blocks are not. That means it is possible to store Procs in variables, call methods on them, and they can also return themselves. Blocks instead are used as arguments for method calls.

## 4. Mention what is the difference between String and Symbol?

- First of all the syntax is different: Symbols are written like `:symbol`, while Strings are written either with single quotes (`'This is a String'`) or with double quotes (`"I'm a String too"`) depending on the needs. 

- Symbols are immutable objects while Strings in Ruby are mutable. 

- Symbols are not collected by Ruby's Garbage collector, while Strings are. 

- Symbols are well known for having better performance than Strings.

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
