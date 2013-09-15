#!/usr/bin/env ruby
# -*- coding: utf-8 :mode ruby-mode -*-

def print_methods()
  Class.constants.select do |c|
    if Class.const_get(c).is_a? Class
      klass = Class.const_get(c)
      klass.methods.each {|method| puts klass.to_s + "#" + method.to_s}
    end
  end
end

print_methods
