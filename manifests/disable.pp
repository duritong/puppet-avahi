# manifests/disable.pp
class avahi::disable inherits avahi {
    include avahi::base::disable
}
