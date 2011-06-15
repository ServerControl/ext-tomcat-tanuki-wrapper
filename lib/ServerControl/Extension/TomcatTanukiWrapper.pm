package ServerControl::Extension::TomcatTanukiWrapper;

use strict;
use warnings;

our $VERSION = '0.1.0';

use ServerControl::Extension;
use ServerControl::Module;
use ServerControl::FsLayout;
use ServerControl::Commons::Process;

use base qw(ServerControl::Extension);

# skip every default behaviour
ServerControl::Module->skip_start;
ServerControl::Module->skip_stop;
ServerControl::Module->skip_status;
ServerControl::Module->skip_restart;

# register hooks
__PACKAGE__->register('before_start', sub { shift->before_start(@_); });
__PACKAGE__->register('before_stop',   sub { shift->before_stop(@_); });


sub before_start {
   my ($class, $sc) = @_;

   my $args = ServerControl::Args->get;
   my ($name, $path) = ($args->{"name"}, $args->{"path"});
   my $tanuki_wrapper = ServerControl::FsLayout->get_file("Exec", "tanukiwrapper");

   spawn("$path/$tanuki_wrapper start");
}

sub before_stop {
   my ($class, $sc) = @_;

   my $args = ServerControl::Args->get;
   my ($name, $path) = ($args->{"name"}, $args->{"path"});
   my $tanuki_wrapper = ServerControl::FsLayout->get_file("Exec", "tanukiwrapper");

   spawn("$path/$tanuki_wrapper stop");
}

1;
