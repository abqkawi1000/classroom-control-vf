  file {
    '.bashrc':
        ensure  => file,
        source  => 'puppet:///modules/skeleton/bashrc',
       
}
