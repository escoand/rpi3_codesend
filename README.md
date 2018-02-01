# codesend for RPi3 for use with HomeAssistant

Binary for sending 433MHz codes with [HomeAssistant](https://home-assistant.io/) on the RPi3 reliably.

## Problem

The right HomeAssistant component for this is actually [rpi-rf](https://home-assistant.io/components/switch.rpi_rf/).
But there seems to be some timing problems so the requested pulselength is maybe not reached.
So there are maybe sometimes missing switch actions.

    # configuration.yaml
    switch:
      - platform: rpi_rf
        gpio: 17
        switches:
          switch_a:
            code_on: 123456
            code_off: 456789
            protocol: 4

## Solution

You can use the [command_line](https://home-assistant.io/components/switch.command_line/) component and the [codesend](https://github.com/ninjablocks/433Utils/blob/master/RPi_utils/codesend.cpp) binary instead.
The switch actions are much more reliable with this solution.
Additionally you can use the `friendly_name` parameter which is not present with rpi-rf.

    # configuration.yaml
    switch:
      - platform: command_line
        switches:
          switch_a:
            friendly_name: Schwibbogen Küche
            command_on: /config/bin/codesend 123456 4
            command_off: /config/bin/codesend 456789 4

## HowTo

Download the binary file and put it where you want.
I prefere the configuration folder so I have no problems with an update of my docker container.
Thats it!
