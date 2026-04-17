# go-auto-shutdown

Automatic controller shutdown service for GOcontroll Moduline controllers based on the KL15 ignition signal.

## Description

`go-auto-shutdown` monitors the KL15 ignition input(s) of the controller. When no KL15 signal is detected and no application is actively managing the controller shutdown (such as a Simulink model via `go-simulink`), this service will automatically shut down the controller.

This prevents the controller from remaining powered unnecessarily when the vehicle ignition is switched off, without requiring the running application to explicitly handle the shutdown condition.

If `go-simulink` is active, `go-auto-shutdown` assumes that the running application is responsible for conditionally shutting down the controller, and backs off to a lower polling rate.

Supported hardware:
- Moduline IV (3x KL15 inputs)
- Moduline Mini (3x KL15 inputs)
- Moduline Display (1x KL15 input)

## Build

Cross-compile for ARM64 using Zig:
```sh
zig build
```
The binary will be in `zig-out/bin/`.

To build with gcc (requires ARM64 cross-compiler and libiio):
```sh
make
```

## Usage

The controller type is auto-detected from the device tree. Optionally pass it as an argument:
```
go-auto-shutdown [type]
```
- `0` = Moduline IV
- `1` = Moduline Mini
- `2` = Moduline Display

## Changelog

### v1.2.0
- Auto-detect controller type from device tree (argument now optional)

### v1.1.0
- Added `build.zig` for cross-compilation from any platform

### v1.0.0
- Initial release
