---
kind: article
categories:
- Verschlüsselung
title: Mehrere Dateien mit PGP verschlüsseln
created_at: '2014-04-22 06:51:13 +0200'
tags:
- PGP
- Dateien verschlüsseln
cleaned?: false
---

Inzwischen habe ich mich intensiv damit auseinander gesetzt, wie man
mehrere Dateien mit PGP verschlüsseln kann und bin von den verschiedenen
Möglichkeiten von PGP positiv überrascht. Es gibt nicht nur ein
einfaches und effektives Verfahren zum Ver­schlüsseln, sondern auch eine
grafische Oberfläche, die sowohl auf Linux als auch auf Windows läuft.

Dateien auf einmal verarbeiten
------------------------------

Zum einen hat Hauke Laging in seinem Kommentar darauf hin­ge­wiesen,
dass man – sofern man PGP über das Command Line In­terface (CLI)
verwendet – den Parameter `--multifile` verwenden und anstatt einer
einzelnen Datei, mehrere Dateien angeben kann, die verschlüsselt
werden sollen. Mit diesem Parameter wird für jede Quelldatei eine
verschlüsselte Datei erstellt.

Sollen die Dateien weitergegeben werden, halte ich dieses Ver­fahren
zumindest ab einer gewissen Anzahl an Dateien aber nicht für sonderlich
optimal. Sinnvoll fände ich das zum Beispiel, wenn man alle Dateien, die
einmal als Backup gespeichert wurden, ver­schlüsseln möchte, aber
trotzdem schnell auf einzelne Dateien zugreifen will. Dafür ist ein
Aufruf mit diesem Parameter eher geeignet als die nächste Möglichkeit,
wie Dateien verschlüsselt werden können.

Dateien in einem Archiv verschlüsseln
-------------------------------------

Viele Dateien können erst in ein Archiv gepackt und dann dieses dann mit
PGP verschlüsselt werden. Dadurch ergibt sich der Vor­teil, dass nur
eine Datei transportiert und verschlüsselt werden muss, was den
zeitlichen Aufwand ein wenig reduzieren kann. Ob das ins Gewicht fällt,
hängt allerdings von der Größe und der Anzahl der Dateien ab.

Diesen Weg geht auch die [Oberfläche
Kleopatra](http://kde.org/applications/utilities/kleopatra/ "Die Übersichtsseite von Kleopatra."),
die von der freien Windows Version
[Gpg4win](http://gpg4win.org/ "GnuPG für Windows (unterstützt vom BSI).")
verwendet wird und auch für Linux verfügbar ist. Wenn man im Windows
Explorer mehrere Dateien markiert und in dem Datei Menü, die
Ver­schlüs­sel­ungs­option auswählt, gibt es die Auswahlmöglichkeit die
Dateien mit TAR zu archivieren. Das kann man auch auf den [Screenshots
in der Dokumentation von
Gpg4win](http://gpg4win.org/doc/en/gpg4win-compendium_24.html#id5 "Die Dokumentation von Gpg4win. Abschnitt Dateien verschlüsseln und signieren.")
sehen. Unter Ubuntu ist diese Funk­tionalität leider nicht in den
Explorer eingebaut, aber im Fenster von Kleopatra, kann man die gleichen
Einstellungen, wie die Screenshots zeigen, auch öffnen. Wer eine Linux
Distribution mit [KDE](http://kde.org/) verwendet (zum Beispiel
Kubuntu), kann das Verschlüsseln von Dateien auch direkt im Explorer
starten.

Und der Vollständigkeit halber: Das gleiche lässt sich mit dem CLI
erledigen, in dem man die Dateien zuerst mit `tar` in ein Archiv packt
und dieses mit `gpg` verschlüsselt. Oder – und das ist deutlich
einfacher – man verwendet den Befehl `gpg-zip`, der mit vielen [gleichen
Aufrufsparemetern](http://www.gnupg.org/documentation/manuals/gnupg/gpg_002dzip.html "Dokumentation von gpg-zip. Dort werden die Parameter beschrieben.")
funktioniert, wie der normale Befehl. Damit wird das Archiv erstellt und
sofort verschlüsselt.

Damit gibt es genug komfortable Möglichkeiten, um auch mehrere Dateien
mit PGP verschlüsselt auszutauschen oder zu speichern. Sehr viel mehr,
als ich gedacht hätte und es auch hier dargestellt habe. Naja, lieber
spät etwas lernen als gar nicht.

[![Logo: geprüfter
Artikel](http://www.openpgp-schulungen.de/grafiken/gepruefter_artikel.png)](http://www.openpgp-schulungen.de/fuer/webautoren/ "Übersicht, über Artikel, die von Hauke Laging geprüft und verbessert wurden.")

*Die erste Version dieses Artikels wurde von Hauke Laging inhaltlich
überprüft und signiert. ([Signatur und signierte Datei
herunter­la­den](https://plasisent.org/assets/files/mehrere-dateien-mit-pgp-verschluesseln.zip "Beide Dateien sind in einer ZIP-Datei gespeichert.").)
Im Nachhinein wurden von mir noch kleinere Ver­bes­se­rungen
vorgenommen, die den Inhalt aber nicht änderten.\
*
