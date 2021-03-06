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

The sdsc-roll must be installed on the build machine, since the build process
depends on make include files provided by that roll.

The roll sources assume that modulefiles provided by SDSC compiler
rolls are available, but it will build without them as long as the environment
variables they provide are otherwise defined.


The beagle roll requires the presence of the java runtime environment and the java compiler. If neither is installed, running:

```shell
% yum install java-1.8.0-openjdk-devel
```

for example will install both (that is the "java" and "javac" executables).

One should also be aware that if the java runtime environment ( e.g. java-1.8.0-openjdk) is installed but the java compiler is not, one should install the correct devel package.

For example, if java-1.8.0-openjdk is already installed, then one should install java-1.8.0-openjdk-devel as above.

Also note that if a particular java environment is installed (e.g. java-1.8.0-openjdk) and a different centos yum package (such as java-11-openjdk) is then installed without removing the previous one, then the exising links to "java" and "javac" will still point to the executables from the first package that was installed.

In contrast, if the the oracle java rpm is downloaded and installed (such as jdk-12.0.1_linux-x64_bin.rpm), then the links to /bin/java and /bin/javac will be overwritten and point to the jdk-12 executables.

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

This roll also supports the `ROLLOPTS` make variable.  If it contains 'cuda',
options are passed to the build to produce beagle with CUDA support.


## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll beagle
% cd /export/rocks/install
% rocks create distro
```

Subsequent installs of compute and login nodes will then include the contents
of the beagle-roll.  To avoid cluttering the cluster frontend with unused
software, the beagle-roll is configured to install only on compute and
login nodes. To force installation on your frontend, run this command after
adding the beagle-roll to your distro

```shell
% rocks run roll beagle host=NAME | bash
```

where NAME is the DNS name of a compute or login node in your cluster.

In addition to the software itself, the roll installs BEAGLE environment module
files in:

```shell
/opt/modulefiles/applications/beagle
```


## Testing

The beagle-roll includes a test script which can be run to verify proper
installation of the roll documentation, binaries and module files. To
run the test scripts execute the following command(s):

```shell
% /root/rolltests/beagle.t 
```
