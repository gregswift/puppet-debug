# == Class: debug
#
# This class is intended to clean up after the puppet_debug switch,
# which is a file that will exist on a puppet agent in the puppet varlib.
# Leaving the switch enabled will flood logs files, and is rarely a good
# idea.
#
# When the switch is enabled, the fact $::puppet_debug will return true.
# Otherwise it will return false.
#
# === Parameters
#
# [*clear*]
#   Set to false if you want debug to stay on until manually disabled
#   or until this is set back to true
#
# === Facts
#
# [*puppet_varlib*]
#   This fact provides the base path for the puppet_debug file.
#
# === Examples
#
#  class { debug: }
#
# === Authors
#
# Greg "xaeth" Swift <gregswift@gmail.com>
#
# === Copyright
#
# Copyright 2014 Greg Swift
#
class debug (
  $clear = true,
) {

  if $::puppet_debug {
    $file_ensure = $clear ? {
      false   => present,
      default => absent,
    }
  } else {
    $file_ensure = absent
  }

  file { "${::puppet_varlib}/puppet_debug":
    ensure => $file_ensure,
  }

}