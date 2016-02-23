class memcached {
    
    package {
        'memcached':
            ensure      => installed,
    }

    file {
        'memcached-config':
            ensure  => file,
            source  => 'puppet:///modules/memcached/memcached',
            path    => '/etc/sysconfig/memcached',
            owner   => 'root',
            group   => 'root',
            mode    => '0644',
            require => Package['memcached'],
            }
    
    service {
        'memcached':
            ensure      => running,
            enable      => true,
            subscribe	=> File['memcached-config'],
            
    }
}


