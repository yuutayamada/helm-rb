#!/usr/bin/env ruby
# -*- coding: utf-8 :mode ruby-mode -*-

def get_classes()
  classes = Class.constants.select {|c| RbConfig.const_get(c).is_a? Class}
  classes
end

def print_methods()
  class_list = get_classes()
  class_list.each do |krass|
    krass.methods.each {|method| puts krass.to_s + "#" + method.to_s}
  end
end

print_methods
