Instruqt Shell base image
-------------------------

This base image serves as base image for all shell containers.
If you need to start any processes, put them in /start.sh, which will be started on boot.

Build & push:
```
make package
make publish
```
