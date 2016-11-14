# SUSE's openQA tests
#
# Copyright © 2016 SUSE LLC
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

use base "consoletest";
use strict;
use warnings;
use testapi;
use utils;

sub run() {
    my $self = shift;

    select_console 'root-console';

    zypper_call("dup", timeout => 1400); # default 700

}
1;
