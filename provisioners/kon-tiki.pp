include ::hugo

class { 'nodejs':
  repo_url_suffix => '18.x',
} -> package { ['bob', 'jazz-cli']:
  ensure   => 'present',
  provider => 'npm',
}

package { ['ImageMagick', 'ImageMagick-devel', 'git', 'dnf']:
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
    'packer'    => '1.8.5',
    'terraform' => '1.3.7',
  }
}

exec { 'dnf install -y "dnf-command(config-manager)"':
  path => ['/usr/bin', '/usr/sbin', '/usr/local/bin', '/usr/local/sbin'],
} -> exec { 'dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo':
  path => ['/usr/bin', '/usr/sbin', '/usr/local/bin', '/usr/local/sbin'],
} ->  package { ['gh']:
  ensure   => latest,
  provider => dnf,
}
