#!/bin/bash

# Rather hacky script to take ownership over pulseaudio to prevent gdm to catch my headset before my own user

chown mpdeimos:mpdeimos /usr/bin/pulseaudio
chmod 700 /usr/bin/pulseaudio
