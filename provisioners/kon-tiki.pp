include ::hugo

class { 'nodejs':
  repo_url_suffix       => '8.x',
  nodejs_package_ensure => '8.10.0',
} -> package { ['bob']:
  ensure   => 'present',
  provider => 'npm',
}

package { ['ImageMagick', 'ImageMagick-devel']:
  ensure   => 'present',
  provider => 'yum',
}

include pip
pip::install { 'awscli':
  ensure => present,
}

package { ['unzip', 'wget']:
  ensure   => 'present',
  provider => 'yum',
} -> class { 'hashicorp::terraform':
  version => '0.11.5',
}
