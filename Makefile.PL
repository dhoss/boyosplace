# IMPORTANT: if you delete this file your app will not work as
# expected.  you have been warned
use inc::Module::Install;

name 'BoyosPlace';
all_from 'lib/BoyosPlace.pm';

requires 'Catalyst::Runtime' => '5.7014';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'Catalyst::Plugin::Authentication';
requires 'Catalyst::Plugin::Authorization::Roles';
requires 'Catalyst::Plugin::Cache::Memcached';
requires 'Catalyst::Plugin::Session';
requires 'Catalyst::Plugin::Session::Store::FastMmap';
requires 'Catalyst::Plugin::Session::State::Cookie';
requires 'parent';
requires 'Config::General';
requires 'DBIx::Class::InflateColumn::FS';
requires 'DBIx::Class::InflateColumn::DateTime';
                 
requires 'File::MimeInfo';
requires 'Imager';
requires 'MIME::Types';
requires 'HTTP::Date';
requires 'DateTime';
requires 'Moose';     
requires 'Catalyst::Controller::HTML::FormFu';            
catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
