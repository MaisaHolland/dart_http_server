# Mock Sever

## Getting Started

- Create a new route and handler to mock the response, take a look at [here](./lib/handlers/testing.dart)
- Run the server `dart run --enable-vm-service`. Without this argument hot reload does not work.
- Now you can access the server through `http://localhost:8080"`.
- Ready to test your feature.

## Running the app

### iOS

On the simulator run the app with `--dart-define="BASE_PATH=http://localhost:8080"`

On the physical device it is necessary to share macOS internet with the iPhone, 
set `BASE_PATH` to the computer hostname and run the server at 0.0.0.0 address (`server.dart file`).
Detailed instruction [here](https://mtm.dev/iphone-localhost-mac).

### Android

* Real device: to run the app on a real Android device pointing to your machine localhost,
use [ADB](https://developer.android.com/studio/command-line/adb) to create a reverse socket connection. You need your
device in USB debugging mode, then run `adb reverse tcp:8080 tcp:8080`. You need to add ADB to your PATH. Don't forget to change your host url to `localhost`

* Emulator: android emulator cannot access your machine localhost directly, run the app
with `--dart-define="BASE_PATH=http://10.0.2.2:8080"`. You can find more
info [here](https://developer.android.com/studio/run/emulator-networking#networkaddresses).
