# SDSC "beagle" roll

## Overview

This Rocks roll bundles the BEAGLE bioinformatics package.

BEAGLE is a high-performance library that can perform the core calculations at
the heart of most Bayesian and Maximum Likelihood phylogenetics packages.

For more information about BEAGLE please visit the <a
href="http://code.google.com/p/beagle-lib/" target="_blank">official web
page</a>.


## Requirements

To build/install this roll you must have root access to a Rocks development
machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must
download the appropriate beagle source file(s) using a machine that does have
Internet access and copy them into the `src/beagle` directory on your Rocks
development machine.


## Dependencies

Unknown at this time.


## Building

To build the beagle-roll, execute this on a Rocks development
machine (e.g., a frontend or development appliance):

```shell
% make 2>&1 | tee build.log
```

A successful build will create the file `beagle-*.disk1.iso`.  If you built the
roll on a Rocks frontend, proceed to the installation step. If you built the
roll on a Rocks development appliance, you need to copy the roll to your Rocks
frontend before continuing with installation.

This roll source supports building with different compilers.
The `ROLLCOMPILER` make variable can be used to
specify the names of compiler modulefiles to use for building the
software, e.g.,

```shell
% make ROLLCOMPILER=intel 2>&1 | tee build.log
```

The build process recognizes "gnu", "intel" or "pgi" as the value for the
`ROLLCOMPILER` variable.  The default value is "gnu".

The value of the `ROLLCOMPILER` variable is incorporated into
the names of the produced rpms.  For example,

```shell
make ROLLCOMPILER=intel 2>&1 | tee build.log
```

produces a roll containing an rpm with a name that begins
`beagle_intel`.



## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll beagle
% cd /export/rocks/install
% rocks create distro
% rocks run roll beagle | bash
```

In addition to the software itself, the roll installs BEAGLE environment module
files in:

```shell
/opt/modulefiles/applications/beagle.
```


## Testing

The beagle-roll includes a test script which can be run to verify proper
installation of the roll documentation, binaries and module files. To
run the test scripts execute the following command(s):

```shell
% /root/rolltests/beagle.t 
```
