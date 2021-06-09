include ::hugo

class { 'nodejs':
  repo_url_suffix => '14.x',
} -> package { ['bob', 'jazz-cli']:
  ensure   => 'present',
  provider => 'npm',
}

package { ['ImageMagick', 'ImageMagick-devel', 'python3']:
  ensure   => 'present',
  provider => 'yum',
}

class { 'python' :
  version  => 'system',
  pip      => 'latest',
  dev      => 'latest',
  gunicorn => 'absent',
} -> exec { 'python3 -m pip install --upgrade pip':
  cwd  => '/tmp',
  path => ['/usr/bin', '/usr/sbin', '/usr/local/bin', '/usr/local/sbin'],
} -> exec { 'python3 -m pip install ansible':
  cwd  => '/tmp',
  path => ['/usr/bin', '/usr/sbin', '/usr/local/bin', '/usr/local/sbin'],
} -> exec { 'python3 -m pip install awscli':
  cwd  => '/tmp',
  path => ['/usr/bin', '/usr/sbin', '/usr/local/bin', '/usr/local/sbin'],
}

class { 'hashicorp_install':
  packages => {
    'packer'    => '1.7.2',
    'terraform' => '0.15.5',
  }
}
