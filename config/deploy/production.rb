server "humani.se",
  user: fetch(:user),
  roles: %w{app web db},
  ssh_options: {
    keys: %w(~/.ssh/id_rsa),
    forward_agent: false,
    auth_methods: %w(publickey)
  }
