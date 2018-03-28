include ::hugo

class { 'nodejs':
  repo_url_suffix       => '8.x',
  nodejs_package_ensure => '8.10.0',
} -> package { ['bob']:
  ensure   => 'present',
  provider => 'npm',
}
