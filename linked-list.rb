# Low-level arrays (as implemented in C or C++) are contiguous blocks of memory
# made up of many "cells", each of which contains a value. The
# one-block-of-memory approach makes accessing arbitrary values fast and easy,
# but it means that you have to know in advance how many array elements you
# want. Expanding arrays is an expensive operation that involves reserving a new
# block of memory and copying all the existing elements into it.
#
# To solve this problem, the linked list was created. Each "value" within a
# linked list is actually an object that contains two things: the value itself,
# and a reference to the "next" element in the list. Adding a new element is as
# simple as reserving the memory space for that element, and pointing the "next"
# reference of what was previously the last element to the new element.
#
# Implement a LinkedList class in Ruby or JavaScript. Do not use arrays or
# hashes, or any of the built-in data types for that matter. Your class should
# be capable of the following:
#
# Append a new value to the end of the list
# Prepend a new value to the beginning of the list
# Find whether a given value is in the list
# Insert a new value after a given value in the list
# Remove a given value from the list (warning: tricky!)
# Find the length of the list
# Implement to_s or toString to return all values in the list

require 'pry'

# define a class for a linked-list
class LinkedList
  attr_reader :first

  def initialize(value)
    @first = Node.new(nil, value)
  end

  # add a new node to the start of the list, and return a reference to the list to allow method chaining
  def prepend value
    @first = Node.new(@first, value)
    self
  end

  # add a new node to the end of the list, and return a reference to the list to allow method chaining
  def append value
    current = @first
    while current.next != nil
      current = current.next
    end
    current.next = Node.new(nil, value)
    self
  end

  # return a reference to the first node containing the target value, or nil
  # if the list does not contain the target value
  def find target
    current = @first
    while current
      if current.value == target
        return current
      end
      current = current.next
    end
    nil
  end

  # return true/false indicating whether the target value exists in the list
  def has_value target
    if find(target)
      return true
    end
    false
  end

  # insert a node after the first node containing a target value, and
  # return a reference to the list to allow method chaining
  def insert_after(target, value)
    prev = find(target)
    if !prev
      return nil
    end
    prev.next = Node.new(prev.next, value)
    self
  end

  # remove a node containing the target value from the list, and
  # return a reference to the list to allow method chaining
  def remove(target)
    if @first.value == target
      @first = @first.next
    end

    prev = nil
    current = @first
    while current
      if current.value == target
        prev.next = current.next
        return self
      end
      prev = current
      current = current.next
    end
    self
  end

  # return the length of the string
  def length
    count = 0
    current = @first
    while current
      count += 1
      current = current.next
    end
    count
  end

  # convert all the values in the list as a string
  def to_s
    values = []
    current = @first
    while current
      values.push(current.value)
      current = current.next
    end
    values.join(', ')
  end

end

# define a class for a single node in a linked-list
class Node
  attr_accessor :next
  attr_accessor :value

  def initialize(next_node, value)
    @next = next_node
    @value = value
  end
end

a = LinkedList.new('bear')
a.append('cat')
a.append('dog')


binding.pry
''
