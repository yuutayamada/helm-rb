#!/usr/bin/env ruby
# -*- coding: utf-8 :mode ruby-mode -*-

print_methods = lambda do
  def method_missing(name)
    # do nothing if instance_methods method wasn't exist
    nil
  end

  begin
    pretty_print = lambda do |klass|
      print = lambda {|method| puts klass.to_s + "#" + method.to_s}
      klass.instance_methods(false).each {|method| print.call(method)}
      klass.singleton_methods(false).each {|method| print.call(method)}
      klass.public_instance_methods(false).each {|method| print.call(method)}
      klass.private_instance_methods(false).each {|method| print.call(method)}
    end

    print_modules = lambda do
      Module.constants.select do |c|
        klass = RbConfig.const_get(c)
        if klass.class == Class || klass.class == Module
          pretty_print.call(klass)
        end
      end
    end

    print_other_modules = lambda do
      `ri -l --no-pager`.split.each do |klass|
        pretty_print.call(klass)
      end
    end

    print_modules.call
    print_other_modules.call

  rescue Exception => e
    puts e
  end
end

print_methods.call
