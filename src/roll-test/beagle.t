#!/usr/bin/perl -w
# beagle roll installation test.  Usage:
# beagle.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $output;
my $installedOnAppliancesPattern = '.';
my $isInstalled = -d '/opt/beagle';

my $TESTFILE = 'tmpbeagle';

my %CXX = ('gnu' => 'g++', 'intel' => 'icpc', 'pgi' => 'pgCC');

open(OUT, ">$TESTFILE.sh");
print OUT <<END;
#!/bin/bash
module load ROLLCOMPILER beagle
$CXX{"ROLLCOMPILER"} -o${TESTFILE}.exe \${BEAGLE_HOME}/examples/matrixtest/matrixtest.cpp -I\${BEAGLE_HOME}/include \${BEAGLE_HOME}/lib/libhmsbeagle.so
./${TESTFILE}.exe
END
close(OUT);

# beagle-install.xml
if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'beagle is installed');
} else {
  ok(! $isInstalled, 'beagle is not installed');
}
SKIP: {

  skip 'beagle roll not installed', 6 if ! $isInstalled;

  $output = `bash $TESTFILE.sh 2>&1`;
  like($output, qr/-1574/, 'beagle example run');

  `/bin/ls /opt/modulefiles/applications/beagle/1.1 2>&1`;
  ok($? == 0, 'beagle 1.1. module installed');
  `/bin/ls /opt/modulefiles/applications/beagle/.version.1.1 2>&1`;
  ok($? == 0, 'beagle 1.1 version module installed');
  `/bin/ls /opt/modulefiles/applications/beagle/2.1 2>&1`;
  ok($? == 0, 'beagle 2.1. module installed');
  `/bin/ls /opt/modulefiles/applications/beagle/.version.2.1 2>&1`;
  ok($? == 0, 'beagle 2.1 version module installed');
  ok(-l '/opt/modulefiles/applications/beagle/.version',
     'beagle version module link created');

} 

`rm -f $TESTFILE*`;
