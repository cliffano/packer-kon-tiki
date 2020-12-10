include ::hugo

class { 'nodejs':
  repo_url_suffix => '14.x',
} -> package { ['bob', 'jazz-cli']:
  ensure   => 'present',
  provider => 'npm',
}

package { ['ImageMagick', 'ImageMagick-devel']:
  ensure   => 'present',
  provider => 'yum',
}

class { 'python' :
  version    => 'system',
  pip        => 'present',
  dev        => 'present',
  virtualenv => 'present',
  gunicorn   => 'absent',
}

python::pip { 'ansible' :
  ensure  => latest,
  pkgname => 'ansible',
}

python::pip { 'awscli' :
  ensure  => latest,
  pkgname => 'awscli',
}

package { ['unzip', 'wget']:
  ensure   => 'present',
  provider => 'yum',
} -> class { 'hashicorp::terraform':
  version => '0.11.5',
}
