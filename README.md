Tool to scan bluetooth devices on Mac OS X

## Output example
    bscan -t 5 -a -n
    10-68-3f-5e-a2-ff Nexus 4
    00-1f-5b-79-94-38 S4
    c0-f8-da-bb-00-20 Broadcom Bluetooth Device

## Usage
bscan [-a] [-n] [-t <seconds>]

### Options
a - print device's address  
n - print device's name (if any)  
t - scan timeout in seconds (default is 10)  
