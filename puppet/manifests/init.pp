

node "vagrant-debian-squeeze.vagrantup.com" {
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


    package { 
      "graphviz":
        ensure => installed;
      "libgraphviz-dev":
        ensure => installed;
      "fabric":
       ensure => installed
    }

}
