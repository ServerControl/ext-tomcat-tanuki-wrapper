package ServerControl::Extension::TomcatTanukiWrapper;

use strict;
use warnings;

our $VERSION = '0.1.0';

use ServerControl::Extension;
use ServerControl::Module;

use base qw(ServerControl::Extension);

# skip every default behaviour
skip_start;
skip_stop;
skip_status;
skip_restart;

# register hooks
__PACKAGE__->register('before_start', sub { shift->before_start(@_); });
__PACKAGE__->register('after_stop',   sub { shift->after_stop(@_); });


sub before_start {
   my ($class, $sc) = @_;

   print ">>> STARTING....\n";
}

sub after_stop {
   my ($class, $sc) = @_;

   print "<<< STOPPING\n";
}

1;
