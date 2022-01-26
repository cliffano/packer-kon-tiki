include ::hugo

class { 'nodejs':
  repo_url_suffix => '16.x',
} -> package { ['bob', 'jazz-cli']:
  ensure   => 'present',
  provider => 'npm',
}

package { ['ImageMagick', 'ImageMagick-devel']:
  ensure   => 'present',
  provider => 'yum',
}

class { 'python' :
  ensure   => 'latest',
  pip      => 'latest',
  dev      => 'latest',
  gunicorn => 'absent',
} -> exec { 'python3 -m pip install --upgrade pip':
  cwd  => '/tmp',
  path => ['/usr/bin', '/usr/sbin', '/usr/local/bin', '/usr/local/sbin'],
} -> exec { 'python3 -m pip install ansible':
  cwd         => '/tmp',
  environment => ['LANG=en_US.UTF-8', 'LC_ALL=en_US.UTF-8'],
  path        => ['/usr/bin', '/usr/sbin', '/usr/local/bin', '/usr/local/sbin'],
} -> exec { 'python3 -m pip install awscli':
  cwd  => '/tmp',
  path => ['/usr/bin', '/usr/sbin', '/usr/local/bin', '/usr/local/sbin'],
}

class { 'hashicorp_install':
  packages => {
    'packer'    => '1.7.9',
    'terraform' => '1.1.4',
  }
}
