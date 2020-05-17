---
title: Docker und Wifi on ICE der Deutschen Bahn
kind: article
description: Bei meiner letzten Bahnfahrt hatte ich Verbindungsprobleme mit dem ICE WLAN und meinem Linux Laptop. Hier notiere ich mir, wie ich sie umgehen konnte.
---

Das schöne am Bahnfahren ist, neben größerem Schutz von Menschenleben
und der Umwelt, dass die Zeit <del>für Filme</del> produktive
Tätigkeiten genutzt werden kann. Dafür bietet die Deutsche Bahn
[WLAN im ICE][].

Leider funktionierte das bei mir unter Linux nicht ohne weiteres. Und
auch andere Nutzer hatten Probleme damit, wie ich bei einer kurzen
Recherche auf meinem Shiftphone herausgefunden habe: [WIFIonICE
blockiert Linux][] und [Warum klappt Login im neuen WifionICE mit
Ubuntu nicht mehr?][ubuntu] sind passende Themen in der Bahn
Community.

In der Diskussion unter den Artikeln gibt es Hinweise darauf, dass die
WLAN Verbindung nicht funktioniert, wenn [Docker][] verwendet wird.
Das nutze ich privat und im Studium sehr häufig. Also helfen mir die
Work-Arounds, die dort angeboten werden.

Soweit ich das bisher verstehe, hat das folgenden Hintergrund (nicht
weiter überprüft): Docker richtet Netzwerk Bridges im System ein.
Diese bestimmen einen IP-Adressbereich. Anfragen an eine IP-Adresse in
diesem Bereich, werden innerhalb des Computers an diese Bridge
umgeleitet. Dadurch ist eine Verbindung zu dem WIFI on ICE Angebot
nicht möglich.

Als Work-Around muss also:

1.  Die betroffene IP-Adresse herausgefunden werden. Dieser Schritt
    ist relativ einfach, in den Forumposts wurden die Bereiche
    `172.16.255.255`, `172.17.255.255` und `172.18.255.255` genannt.

1.  Der Name der Bridge ermittelt werden, die einen Bereich mit dieser
    IP-Adresse definiert. Um den Namen der Bridge zu ermitteln, habe
    ich das Command Line Interface `ip addr` verwendet. Die Ausgabe
    enthält mehrere Netzwerk Devices auf und welche Adressbereiche
    verwendet werden.
   
    <pre><code>$ ip addr
    ✂️schnipp
    10: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default 
     link/ether 01:22:32:43:52:6d brd ff:ff:ff:ff:ff:ff
     inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
        valid_lft forever preferred_lft forever
    11: br-e32936a17caf: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
     link/ether 12:42:b3:47:5b:63 brd ff:ff:ff:ff:ff:ff
     inet 172.18.0.1/16 brd 172.18.255.255 scope global br-e32936a17caf
        valid_lft forever preferred_lft forever
    ✂️schnapp
    </code></pre>

    Bei mir hat das etwa diese Ausgabe derzeit. Die Namen der Netzwerk
    Devices, die ich im nächsten Schritt benötige, sind `docker0` und
    `br-e32936a17caf`.

1.  Die betroffene Bridge aus dem System gelöscht werden (einfach
    Deaktivieren hat bei meinen kurzen Tests nicht ausgereicht). Dafür
    sind System-Administrator-Rechte notwendig, weshalb das mit `sudo`
    ausgeführt wird.
    
    ```
    $ sudo ip link delete <name>
    ```

1.  Falls das noch nicht ausreicht, ist eine Option den Docker Dienst
    zu deaktiveren. Mit Docker hatte ich auch nach dem Löschen der
    Bridge keine Probleme. Eventuell war ein Reboot notwendig.

Online lässt sich ein [Script für die automatische Verbindung mit dem
ICE WLAN][autoconnect] finden. Das habe ich aber bislang nicht
ausprobiert.

Jetzt wo ich das einmal aufgeschrieben habe, kann ich bei der nächsten
Bahnfahrt vermutlich etwas schneller in das WLAN der Deutschen Bahn.
Vielleicht helfen die Hinweise auch dem ein oder anderen Linux und
Docker User, das würde mich freuen.

[wlan im ice]: https://inside.bahn.de/wifionice-wlan-ice-login/

[wifionice blockiert linux]: https://community.bahn.de/questions/1277967-wifionice-blockiert-linux

[ubuntu]: https://community.bahn.de/questions/1271091-klappt-login-neuen-wifionice-ubuntu-mehr

[docker]: https://www.docker.com/

[Autoconnect]: https://gist.github.com/dicer/b21300fbbfdd8cf011756a8673b6f69c
