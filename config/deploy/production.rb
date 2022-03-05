# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

# server "example.com", user: "deploy", roles: %welcome{app db web}, my_property: :my_value
# server "example.com", user: "deploy", roles: %welcome{app web}, other_property: :other_value
# server "db.example.com", user: "deploy", roles: %welcome{db}

server "157.245.47.160", user: "deployer", roles: %w{app db web}, primary: true

# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

# role :app, %welcome{deploy@example.com}, my_property: :my_value
# role :web, %welcome{user1@primary.com user2@additional.com}, other_property: :other_value
# role :db,  %welcome{deploy@example.com}

# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add index variables to customise your setup.

# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %welcome(/home/user_name/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %welcome(password)
#  }
#
# The server-based syntax can be used to override options:
# ------------------------------------
# server "example.com",
#   user: "user_name",
#   roles: %welcome{web app},
#   ssh_options: {
#     user: "user_name", # overrides user setting above
#     keys: %welcome(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %welcome(publickey password)
#     # password: "please use keys"
#   }
