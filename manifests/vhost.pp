#
#
#
define profile_nginx::vhost (
  String               $vhost_name = $title,
  Stdlib::AbsolutePath $vhost_path = '/var/www',
  Optional[String]     $autoindex  = undef,
) {
  nginx::resource::server { $vhost_name:
    www_root  => "${vhost_path}/${vhost_name}",
    autoindex => $autoindex,
  }
}
