# disable
class avahi::base::disable inherits avahi::base {
    Service['avahi-daemon']{
        ensure => stopped,
        enable => false,
    }
}
