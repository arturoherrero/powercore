# PowerCore

[![Code Climate](https://codeclimate.com/github/arturoherrero/powercore/badges/gpa.svg)](https://codeclimate.com/github/arturoherrero/powercore)
[![Build Status](https://travis-ci.org/arturoherrero/powercore.svg?branch=master)](https://travis-ci.org/arturoherrero/powercore)

PowerCore extends the Ruby Core with useful extensions.

There are Ruby gems doing something similar, some of the more popular are:
[ActiveSuppor Core Extensions][1] or [Powerpack][2].

In this case, this is just a collection of extensions for reference, **not** a
Ruby gem. Who wants a new dependency in the code base? So, just borrow the code
that you consider useful, but be careful; most of the time I have created new
methods but sometimes I have overridden the default Ruby implementation, or even
worse, I have removed Ruby methods to do some tricks. Come and see!

- [Array](#array)
  - [`average`](#average)
  - [Negative index `drop`](#negative-index-drop)
  - [`head`](#head)
  - [`histogram`](#histogram)
  - [`mean`](#mean)
  - [`median`](#median)
  - [`mode`](#mode)
  - [`percentile`](#percentile)
  - [`sum`](#sum)
  - [Negative index `take`](#negative-index-take)
  - [`tail`](#tail)
  - [`transpose` array of ranges](#transpose-array-of-ranges)
- [Date](#date)
  - [`now`](#now)
- [Fixnum](#fixnum)
  - [`clamp`](#clamp)
  - [`degrees`](#degrees)
  - [`negative`](#negative)
  - [`ordinal`](#ordinal)
- [Hash](#hash)
  - [`compact`](#compact)
  - [`except`](#except)
- [Kernel](#kernel)
  - [`λ`](#λ)
- [Object](#object)
  - [`assert`](#assert)
  - [`in?`](#in?)
  - [`metaclass`](#metaclass)
  - [`not_nil?`](#not_nil?)
  - [Smalltalk's conditionals](#smalltalks-conditionals)
  - [Pipe operator](#pipe-operator)
- [Proc](#proc)
  - [`>>`](#>>)
  - [`<<`](#<<)
- [String](#string)
  - [`first`](#first)
  - [`last`](#last)
  - [`to_bool`](#to_bool)


## Array

#### `average`

Calculate the mean of the elements.

```ruby
[1, 2, 3, 4].average  # => 2.5
```

#### Negative index `drop`

Drop n elements from end of the array.

```ruby
[1, 2, 3, 4].drop(-2)  # => [1, 2]
```

If you pass a positive number, it delegates to the original implementation.

```ruby
[1, 2, 3, 4].drop(2)  # => [3, 4]
```

#### `head`

Return the head of the array.

```ruby
[1, 2, 3].head  # => 1
```

#### `histogram`

Build the histogram in a hash.

```ruby
[2, 1, 2, 2, 3, 3].histogram  # => {1=>1, 2=>3, 3=>2}
```

#### `mean`

Calculate the mean of the elements.

```ruby
[1, 2, 3, 4].mean  # => 2.5
```

#### `median`

Calculate the median of the elements.

```ruby
[1, 2, 3, 4, 5].median  # => 3
[1, 2, 3, 4].median     # => 2.5
```

#### `mode`

Find the mode value/s.

```ruby
[1, 2, 3, 4].mode     # => [1, 2, 3, 4]
[1, 2, 2, 4].mode     # => [2]
[1, 1, 2, 4, 4].mode  # => [1, 4]
```

#### `percentile`

Return the percentile value for a given percentage.

```ruby
[1, 2, 3, 4].percentile(49)     # => 2
[1, 2, 3, 4].percentile(50)     # => 3
[1, 2, 3, 4, 5].percentile(50)  # => 3
```

#### `sum`

Calculate the sum of the elements.

```ruby
[1, 2, 3, 4].sum     # => 10
["a", "b", "c"].sum  # => "abc"
```

#### Negative index `take`

Returns n elements from end of the array.

```ruby
[1, 2, 3, 4].take(-2)  # => [3, 4]
```

If you pass a positive number, it delegates to the original implementation.

```ruby
[1, 2, 3, 4].take(2)  # => [1, 2]
```

#### `tail`

Return the tail of the array.

```ruby
[1, 2, 3, 4].tail  # => [2, 3, 4]
```

#### `transpose` array of ranges

Assumes that self is an array of ranges and transposes the rows and columns.

```ruby
[(1..2), (3..4)].transpose  # => [[1, 3], [2, 4]]
```

It also works with the original implementation, assuming an array of arrays.

```ruby
[[1, 2], [3, 4]].transpose  # => [[1, 3], [2, 4]]
```


## Date

#### `now`

Return the current day.

```ruby
Date.now  # => #<Date: 2016-03-29 ((2457477j,0s,0n),+0s,2299161j)>
```


## Fixnum

#### `clamp`

Clamp a comparable between a lower and upper bound.

```ruby
1.clamp(3, 6)  # => 3
5.clamp(3, 6)  # => 5
8.clamp(3, 6)  # => 6

1.clamp(3..6)  # => 3
5.clamp(3..6)  # => 5
8.clamp(3..6)  # => 6
```

#### `degrees`

Convert a number of degrees into radians.

```ruby
90.degrees  # => 1.5707963267948966
```

#### `negative`

Negate the number.

```ruby
1.negative  # => -1
```

#### `ordinal`

Return the ordinal of the number.

```ruby
1.ordinal  # => "1st"
2.ordinal  # => "2nd"
```


## Hash

#### `compact`

Return a copy of self with all nil elements removed.

```ruby
{a: 1, b: nil, c: 3}.compact  # => {a: 1, c: 3}
```

#### `except`

Return the hash without keys specified.

```ruby
{a: 1, b: nil, c: nil, d: 4}.except(:b, :d)  # => {a: 1, c: nil}
```


## Kernel

λ is lambda.

```ruby
my_proc = λ { }
```


## Object

#### `assert`

Assert an expression.

```ruby
assert(1 == 2)  # => AssertError: AssertError
assert(1 == 1)  # => nil
```

#### `in?`

Return true if self is present in the given object.

```ruby
1.in?([1, 2, 3])            # => true
"lo".in?("hello")           # => true
:b.in?({ a: 100, b: 200 })  # => true
```

#### `metaclass`

Return the eigenclass.

```ruby
Object.new.metaclass  # => #<Class:#<Object:0x007fc6427d1058>>
```

#### `not_nil?`

Return true when an object is not nil.

```ruby
nil.not_nil?  # => false
1.not_nil?    # => true
```

#### Smalltalk's conditionals

Emulate Smalltalk's conditionals.

```ruby
(1 == 1).--> { true } { false }  # => true
(4 == 2).--> { true } { false }  # => false
```

#### Pipe operator

Pipe operator à la Bash/Elixir.

```ruby
[1,2,3] |
  ->(array)  { array.first } |
  ->(int)    { int.to_s } |
  ->(string) { string + "2" }
# => "12"

[1,2,3] | :first | :to_s | ->(s) { s + "2" }  # => "12"
```


## Proc

#### >>

Proc forward composition.

```ruby
multiply_2 = ->(var) { var * 2 }
sum_3      = ->(var) { var + 3 }
multiply_2_then_add_3 = multiply_2 >> sum_3
multiply_2_then_add_3.call(3)  # => 9
```

#### <<

Proc reverse composition.

```ruby
multiply_2 = ->(var) { var * 2 }
sum_3      = ->(var) { var + 3 }
sum_3_then_multiply_2 = multiply_2 << sum_3
sum_3_then_multiply_2.call(3)  # => 12
```


## String

#### `first`

Return the first chars of the string.

```ruby
"abc".first     # => "a"
"abc".first(2)  # => "ab"
```

#### `last`

Return the last chars of the string.

```ruby
"abc".last     # => "c"
"abc".last(2)  # => "bc"
```

#### `to_bool`

Convert string to boolean.

```ruby
"true".to_bool   # => true
"false".to_bool  # => false
```


[1]: http://edgeguides.rubyonrails.org/active_support_core_extensions.html
[2]: https://github.com/bbatsov/powerpack
