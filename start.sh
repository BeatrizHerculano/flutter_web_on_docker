#!/bin/sh
flutter pub get; flutter run -d web-server --web-port 3000 --web-hostname 0.0.0.0
