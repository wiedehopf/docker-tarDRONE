# docker-tarDRONE

Modify the `.env` file within the project roof directory with:

TZ: Your current TimeZone\
LAT/LONG: The lat/long of the remoteID receiver\
USB_DEVICE: The device of your sniffle receiver dongle (normally /dev/ttyUSB0 if you have no other devices connected)\

Run with: `DOCKER_BUILDKIT=1 docker-compose -f docker-compose-tarDRONE.yml up`
