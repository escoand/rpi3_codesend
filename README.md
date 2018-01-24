# codesend for RPi3 for use with HomeAssistant

Binary for sending 433MHz codes with HomeAssistant on the RPi3.

## Problem

The right HomeAssistant component for this is actually rpi-rf.
But there seems to be some timing problems so the requested pulselength is maybe not reached.
So there are maybe sometimes missing switch actions.

    # configuration.yaml
    switch:
      - platform: command_line
        gpio: 17
        switches:
          switch_a:
            code_on: 123456
            code_off: 456789
            protocol: 4

## Solution

You can use the command_line component and the codesend binary instead.
The switch actions are much more reliable with this solution.
Additionally you can use the friendly_name parameter which is not present with rpi-rf.

    # configuration.yaml
    switch:
      - platform: command_line
        switches:
          switch_a:
            friendly_name: Schwibbogen Küche
            command_on: /config/bin/codesend.sh 123456 4
            command_off: /config/bin/codesend.sh 456789 4

## HowTo

Download these files and put them where you want to.
I prefere the configuration folder so I have no problems with an update of my docker container. Thats it!
