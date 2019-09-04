---
title: "JBL Bluetooth Lautsprecher mit Debian nutzen"
kind: article
description: "JBL Bluetooth Lautsprecher können mit Debian genutzt werden. Für mich waren jedoch zwei kleine Schritte notwendig."
---

In diesem Post möchte ich kurz beschreiben, welche Erfahrungen ich
diesen Sommer mit JBL Bluetooth Lautsprechern (Flip 4 und Charge 2)
und Debian gemacht habe. Die erste Verbindung der Lautsprecher mit
meinem Laptop verlief problemlos. Das Gerät wurde erkannt, die
Kopplung mit Bluetooth klappte und die Musik spielte aus
Lautsprechern, die besser klingen als die Laptop-Lautsprecher.

Leider hat das mit der zweite Verbindung nicht mehr funktioniert. Der
Lautsprecher konnte mit dem Laptop per Bluetooth verbunden werden.
Aber ich konnte kein Ton abspielen. Glücklicherweise gibt es eine
einfache Lösung dafür, die im [Debian Wiki zu A2DP][a2dp] und in einer
[Diskussion im Arch Wiki][arch] beschrieben wird.

Erst einmal habe ich sichergestellt, dass die Pakete installiert
waren, die im Debian Wiki Artikel als Requirements angegeben waren. Da
ich die GNOME Desktop-Umgebung verwende, habe ich kein zusätzliches
Pairing Tool installiert.

    $ apt install pulseaudio \
                  pulseaudio-module-bluetooth \
                  pavucontrol \
                  bluez-firmware
    # Restart the services
    $ service bluetooth restart
    $ killall pulseaudio

Im nächsten Schritt, habe ich den zweiten Workaround aus dem Wiki
umgesetzt, um Bluetooth für den ersten und automatisch gestarteten
PulseAudio-Prozess zu deaktivieren. Dazu habe ich die Datei
`/var/lib/gdm3/.config/pulse/default.pa` angelegt und mit folgenden
Zeilen befüllt.

    #!/usr/bin/pulseaudio -nF
    #

    # load system wide configuration
    .include /etc/pulse/default.pa

    ### unload driver modules for Bluetooth hardware
    .ifexists module-bluetooth-policy.so
      unload-module module-bluetooth-policy
    .endif

    .ifexists module-bluetooth-discover.so
      unload-module module-bluetooth-discover
    .endif

Diese Schritte – und vermutlich ein Neustart – haben das Problem
beseitigt. Seitdem spiele ich zuverlässig von meinem Laptop Musik ab
und Lisa von ihrem Laptop. Dort waren die Schritte auch zielführend.
Gelegentlich müssen wir nach dem Verbinden des Lautsprechers noch
darauf achten, dass in den Klang-Einstellungen von GNOME, der richtige
Modus für die Lautsprecher gewählt wird. Hier muss <samp>High Fidelity
Playback (A2DP-Ziel)</samp> ausgewählt sein.

[a2dp]: https://wiki.debian.org/BluetoothUser/a2dp

[arch]: https://wiki.archlinux.org/index.php/Talk:Bluetooth_headset#GDMs_pulseaudio_instance_captures_bluetooth_headset
