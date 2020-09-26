notify { 'Provisioning Redmine': }

class { '::apache':
  purge_configs => true,
  default_vhost => false,
}

class { '::apache::mod::passenger': }

class { '::postgresql::server': }

class { '::redmine':
    version           => '4.1.1',
    database_password => 'vagrant',
    database_adapter  => 'postgresql',
    install_dir       => '/opt/redmine',
}
