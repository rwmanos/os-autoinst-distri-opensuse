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
    pkcon_quit;
    zypper_call "ref -f";

    if (get_var("VERSION", "") =~ /SP1/) {
        zypper_call "ar --no-gpgcheck http://download.suse.de/ibs/QA:/Maintenance/SLE_12_SP1/QA:Maintenance.repo";
    }
    elsif (get_var("VERSION", "") =~ /SP2/) {
        zypper_call "ar --no-gpgcheck http://download.suse.de/ibs/QA:/Maintenance/SLE_12_SP2/QA:Maintenance.repo";
    }
    zypper_call "in repose";

    # Create SSH key and allow connection to localhost.
    script_run "ssh-keygen -b 2048 -t rsa -f /root/.ssh/id_rsa -q -N \"\"";
    script_run "cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys";
    # Add 'localhost' to the list of known hosts.
    script_run "ssh -o StrictHostKeyChecking=no root\@localhost \"uptime\"";

    script_run "repose-reset root\@localhost";

    zypper_call "dup", timeout => 1400; # default 700

}
1;
