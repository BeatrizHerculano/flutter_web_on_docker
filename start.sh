#!/bin/sh
flutter pub get;

if [ "$DISPLAY" = "" ]; then
	flutter run -d web-server --web-port 3000 --web-hostname 0.0.0.0
else
	flutter run -d linux
fi
