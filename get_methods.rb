#!/usr/bin/env ruby
# -*- coding: utf-8 :mode ruby-mode -*-

def print_methods()
  def pretty_print(klass, literal)
    klass.methods.each do |method|
      class_name = literal ? klass.class.to_s : klass.to_s
      puts class_name + "#" + method.to_s
    end
  end

  Class.constants.select do |c|
    if Class.const_get(c).is_a? Class
      klass = Class.const_get(c)
      pretty_print(klass, nil)
    end
  end

  ["", 0, //, [], {}].each do |literal|
    pretty_print(literal, true)
  end
end

print_methods
