# Resolver Pintool

The `Resolver` pintool runs ontop of the [Intel Pin](https://software.intel.com/en-us/articles/pin-a-dynamic-binary-instrumentation-tool) DBI framework and collects data.

This pintool is labeled only as a prototype.

# Compilation

To compile the pintool, you first will need to [download](https://software.intel.com/en-us/articles/pin-a-binary-instrumentation-tool-downloads) and extract Pin.

Follow the build instructions below for your respective platform.

## Building for MacOS or Linux

On MacOS or Liunux, one can compile the pintool using the following commands.

```
# Location of this repo / pintool source
cd ~/resolver

# Location where you extracted Pin
export PIN_ROOT=~/pin
export PATH=$PATH:$PIN_ROOT
make
make TARGET=ia32
```

The resulting binaries will be placed inside a directory whose name depends on the arch/platform/build type.

* obj-intel32/Resolver.[so|dylib]
* obj-intel64/Resolver.[so|dylib]

## Building for Windows

To compile the Windows pintool, you must have at least Visual Studio 2015 installed.

Launch a command prompt and build the pintool with the following commands.

### 32bit Pintool

```
"C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" x86

REM Location of this repo / pintool source
cd C:\Users\user\Resolver

REM Location where you extracted Pin
set PIN_ROOT=C:\pin
set PATH=%PATH%;%PIN_ROOT%
build-x86.bat
```

### 64bit Pintool

```
"C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" x86_amd64

REM Location of this repo / pintool source
cd C:\Users\user\Resolver

REM Location where you extracted Pin
set PIN_ROOT=C:\pin
set PATH=%PATH%;%PIN_ROOT%
build-x64.bat
```

The resulting binaries will be labaled based on their architecture (eg, 64 is the 64bit pintool).

* Resolver.dll
* Resolver64.dll

Compiling a pintool on Windows can be more arduous. If you use a pre-built binary, please be sure to use the pintool that matches your version of Pin.

# Usage

Once compiled, usage of the pintool is straightforward. Simply provide the compiled `Resolver` pintool to `pin` via the `-t` argument. The resulting code coverage data will be written to the file `trace.log` at the end of execution.

Here is an example of us instrumenting a 64bit binary called `test` with our `Resolver` pintool.

```
$ pin -t obj-intel64/Resolver.dylib -- ./test
```

# Authors

* Agustin Gianni ([@agustingianni](https://twitter.com/agustingianni))
