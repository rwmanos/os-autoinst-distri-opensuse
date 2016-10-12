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

    select_console 'root-console';

    script_run("repose-install root\@localhost -- sle-module-web-scripting");

}
1;
