class hiera_example ($message = hiera('hiera_info', 'default hiera info')) {

    $env_info = hiera('env_message', 'default message')
    file { '/tmp/hiera_example.txt':
        ensure  => file,
        content => "hiera message: ->$message<-, and env_message: $env_info\n",
    }
}
