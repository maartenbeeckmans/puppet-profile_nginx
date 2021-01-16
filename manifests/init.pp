#
#
#
class profile_nginx (
  Hash           $vhosts,
  Boolean        $manage_firewall_entry,
  Array[Integer] $ports,
  Boolean        $manage_prometheus_exporter,
) {
  include nginx

  create_resources('profile_ngins::vhost', $vhosts)

  if $manage_firewall_entry {
    firewall { '00080 nginx':
      dport  => $ports,
      action => 'accept',
    }
  }

  if $manage_prometheus_exporter {
    include profile_prometheus::nginx_vts_exporter
  }
}
