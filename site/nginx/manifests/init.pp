# = Class: name
#
# Author: Name Surname <name.surname@mail.com>
class nginx {

	package {
	    'nginx':
	        ensure      => installed,
	        before     => File['doc_root'],
	}

	file {
	    'doc_root':
	        ensure  => directory,
	        path    => '/var/www',
	}

	file {
	    'nginx_conf':
	        ensure  => file,
	        source  => 'puppet:///modules/nginx/nginx.conf',
	        path	=> '/etc/nginx/nginx.conf',
	        require => Package['nginx'],
	        
	}

	file {
	    'nginx_default':
	        ensure  => file,
	        source  => 'puppet:///modules/nginx/default.conf',
	        path	=> '/etc/nginx/conf.d/default.conf',
	        require => Package['nginx'],
	        notify  => Service['nginx'],
	}

	file {
	    'index':
	        ensure  => file,
	        source  => 'puppet:///modules/nginx/index.html',
	        path	=> '/var/www/index.html',
	 }


	service {
	    'nginx':
	        ensure      => running,
	        enable      => true,
	        subscribe   => File['nginx_conf'],
	        require     => [Package['nginx'],File['nginx_conf']],
	        #require	    => [File[config],File[block]],
	}
	   

}

