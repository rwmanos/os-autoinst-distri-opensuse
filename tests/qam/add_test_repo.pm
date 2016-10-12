# SUSE's openQA tests
#
# Copyright © 2016 SUSE LLC
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.


use base "basetest";

use strict;

use utils;
use qam;
use testapi;

sub run {
    select_console 'root-console';

    #capture_state('before');

    my $repo = get_var('TEST_REPO');
    zypper_call("ar $repo test_repo");

    if (get_var('TEST_REPO_1')) {
        zypper_call("ar " . get_var('TEST_REPO_1') . " test_repo_1");
    }

    zypper_call("ref");

    #capture_state('between', 1);

}

sub test_flags {
    return {fatal => 1};
}

1;
