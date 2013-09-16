class ssh {
  package { 'ssh':
    ensure => present
  }

  service { 'ssh':
    ensure  => running,
    enable  => true,
    require => Package['ssh']
  }

  file { '/etc/ssh/ssh_known_hosts':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644'
  }
}
