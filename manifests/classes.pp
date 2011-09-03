
class webserver::custom_php {
  class {'php::params':
    package        => "php",
    package_common => "php-common",
    memory_limit   => "129M"
  }
  
  include php
  
  include php::apc
  php::extension { 'mcrypt': }
  php::extension { 'mysql': }
  php::extension { 'gd': }
  php::extension { 'xml': }
  php::extension { 'mbstring': }
  php::extension { 'pecl-memcache': }
}

class webserver {
  include apache
  include memcached
  include webserver::custom_php
  include varnish
  include drupal

  include mysql::server
  include mysql::client
  
  include drush
}
