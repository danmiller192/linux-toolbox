# Sleep Fix
 
Credit: <https://forums.linuxmint.com/viewtopic.php?p=2403158#p2403158>

 The things that are allowed to wake the system can be viewed via the command

```
cat /proc/acpi/wakeup
```

Output will look like:

```
Device	S-state	  Status   Sysfs node
GP12	  S4	*enabled   pci:0000:00:07.1
GP13	  S4	*enabled   pci:0000:00:08.1
XHC0	  S4	*enabled   pci:0000:08:00.3
GP30	  S4	*disabled
GP31	  S4	*disabled
PS2K	  S3	*disabled
PS2M	  S3	*disabled
GPP0	  S4	*enabled   pci:0000:00:01.1
GPP8	  S4	*enabled   pci:0000:00:03.1
PTXH	  S4	*enabled   pci:0000:02:00.0
PT20	  S4	*disabled
PT24	  S4	*disabled
PT26	  S4	*disabled
PT27	  S4	*disabled
PT28	  S4	*disabled
PT29	  S4	*enabled   pci:0000:03:09.0
```

A specific item (e.g., GP30) can be toggled between enabled and disabled using the command

 ```
sudo sh -c 'echo "GP30" > /proc/acpi/wakeup'
 ```

This is a temporary change that is reset when the computer restarts. I turned GP12, GP13, XHC0, GPP0, GPP8, PTXH, and PT29 all off, and then turned them on one by one to find the one that caused the problem. It turns out that GPP0 was the problem, with Sysfs node pci:0000:00:01.1

In order to permanently disable the problem component, create a disable-wakeup.service file. I did this using Vim, but you can use any text editor. 

```
sudo gedit /etc/systemd/system/disable-wakeup.service
```

Then paste the following into the file

```
[Unit]
Description=Disable wakeup for specified PCI devices

[Service]
Type=oneshot
ExecStart=/bin/sh -c 'echo -n "disabled" > /sys/bus/pci/devices/0000:00:01.1/power/wakeup'

[Install]
WantedBy=multi-user.target
```

Then save and exit.

Finally, run the following two commands: 

```
sudo systemctl enable disable-wakeup.service
```

and 

```
sudo systemctl start disable-wakeup.service
```