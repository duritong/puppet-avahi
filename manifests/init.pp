#
# avahi module
#
# Copyright 2008, Puzzle ITC
# Marcel Härry haerry+puppet(at)puzzle.ch
# Simon Josi josi+puppet(at)puzzle.ch
#
# This program is free software; you can redistribute 
# it and/or modify it under the terms of the GNU 
# General Public License version 3 as published by 
# the Free Software Foundation.
#

class avahi {
    include avahi::base
}

class avahi::base {
    package{'avahi':
        ensure => present,
    }
    file{'/etc/init.d/avahi-daemon':
        source => "puppet://${server}/avahi/init.d/${operatingsystem}/avahi-daemon",
        require => Package['avahi'],
        before => Service['avahi-daemon'],
        owner => root, group => 0, mode => 0755;
    }
    service{'avahi-daemon':
        ensure => running,
        enable => true,
        hasstatus => true,
        require => Package[avahi],
    }
}
