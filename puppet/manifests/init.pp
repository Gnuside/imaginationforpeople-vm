
class i4p::packages {
  package { 
  "graphviz":
    ensure => installed;
  "libgraphviz-dev":
    ensure => installed;
  "fabric":
    ensure => installed;
  "postgis":
    ensure => installed;
  "libgdal-dev":
    ensure => installed;
  "python-virtualenv":
    ensure => installed;
  "git":
    ensure => installed;
  }
}

node "vagrant-debian-wheezy.vagrantup.com" {
  class{ "apt":  always_apt_update => true; }

  apt::key { 
  "B98321F9": 
  key_source => "http://ftp-master.debian.org/keys/archive-key-6.0.asc";
"473041FA": 
key_source => "http://ftp-master.debian.org/keys/archive-key-6.0.asc";
      "F42584E6": 
      key_source => "http://ftp-master.debian.org/keys/archive-key-6.0.asc"
  }

  Apt::Key <| |> -> Exec["apt_update"] 
  Exec["apt_update"] -> Package <| |>

  # globally set exec path
  Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

  include i4p::packages

  # FIXME: virtualenv --no-site-packages i4p-env
  # FIXME: install ruby1.9
  # FIXME: install rbenv

}
