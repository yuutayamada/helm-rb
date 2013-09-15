#!/usr/bin/env ruby
# -*- coding: utf-8 :mode ruby-mode -*-

def print_methods()

  def pretty_print(klass)
    def print(klass, method)
      puts klass.to_s + "#" + method.to_s
    end

    klass.methods.each do |method|
      print(klass, method)
    end

    klass.instance_methods.each do |method|
      print(klass, method)
    end
  end

  Module.constants.select do |c|
    klass = Module.const_get(c)
    if klass.class == Class || klass.class == Module
      pretty_print(klass)
    end
  end

end

print_methods
