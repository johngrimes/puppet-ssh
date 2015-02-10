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

  file { 'sshd_config':
    path   => '/etc/ssh/sshd_config',
    ensure => file,
    source => 'puppet:///modules/ssh/sshd_config',
    owner  => 'root',
    group  => 'root',
    mode   => '644',
    notify => Service['ssh']
  }
}
