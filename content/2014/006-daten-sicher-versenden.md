---
kind: article
categories:
- Verschlüsselung
title: Daten sicher versenden
created_at: '2014-03-14 14:08:51 +0100'
tags: []
cleaned?: false
---

Egal was man tut, man wird seine Daten vermutlich nie ganz sicher/geheim
im Internet versenden können. Es gibt immer ein paar Schwachstellen, die
man nicht vermeiden kann. Aber man kann diese Schwachstellen so gut wie
möglich minimieren.

Als erstes braucht man einen Computer, der *nie* ans Internet
angeschlossen wird. Er sollte auch an kein WLAN angeschlossen sein und
man sollte ihn nicht mit Bluetooth verbinden.

Als Betriebsystem sollte man eine Linux Distribution wie
[Debian](https://www.debian.org/) verwenden, auf der GnuPG schon
installiert ist und die nicht viele Updates benötigt. Nach der
Installation des Betriebsystemes, sollte man sich ein neues PGP
Schlüsselpaar einrichten.

Das Passwort sollte möglichst stark sein. Am besten über 20 Zeichen und
nicht nur Buchstaben und Zahlen, sondern auch Sonderzeichen. Den
[öffentlichen
Schlüssel](http://www.email-nur-an-dich.de/begriffe/public-key) kann man
exportieren und mit einem USB-Stick auf einen anderen Computer
übertragen und ihn von dort weiter verbreiten.

Die geheimen Daten sollten den Computer ohne Internet­an­schluss *nie*
unverschlüsselt verlassen. Am besten sollte man darauf achten, dass sie
auch nicht in einem Notizbuch auf­geschrieben sind oder auf einem
anderen Computer verfasst wurden.

Damit der ganze Aufwand Sinn macht, sollte der Gegenüber genau die
gleichen Schritte durchgeführt haben. Es bringt nichts, wenn man ganz
genau darauf achtet, die Dateien sicher zu verschlüsseln, wenn der
Empfänger die Dateien, mit einem ans Internet angeschlossenen Windows
Computer, entschlüsselt und in der Cloud speichert.

Auch diese Vorkehrungen sind sicherlich nicht ganz perfekt, aber sie
erhöhen die Sicherheit schon sehr deutlich. Gleichzeitig wird es aber
auch aufwändiger die Daten zu lesen. Für weniger wichtige Daten – wie
zum Beispiel Terminabsprachen für den nächsten Spieleabend – lohnen sich
diese Schritte eher nicht.
