#!/usr/bin/env ruby

$:.unshift File.dirname(__FILE__)
require 'command'

Slim::Command.new(ARGV).run
