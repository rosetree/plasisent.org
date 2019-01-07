---
kind: article
categories:
- Verschlüsselung
title: 'Dateien verschlüsseln: PGP'
created_at: '2014-03-31 20:19:42 +0200'
tags:
- PGP
- Dateien verschlüsseln
cleaned?: false
---

In einer Themenreihe „Dateien verschlüsseln“ beschäftige ich mich mit
verschiedenen Programmen und Möglichkeiten, um Dateien vor dem Zugriff
Unbefugter zu schützen. Wer schon seine [E-Mails mit PGP
verschlüsselt](http://www.email-nur-an-dich.de/ "Anleitungen und
Erklärungen zum Verschlüsseln von E-Mails mit PGP"), für den bietet
sich eine Verschlüsselung einzelner Dateien mit OpenPGP definitiv an.
Aber auch für alle anderen hat PGP viele Vorteile zu bieten.

OpenPGP ist ein offener Standard, der weit verbreitet ist. Freie
Implementationen sind für alle großen Betriebssysteme vor­handen; somit
können verschlüsselte Dateien ohne Probleme zwischen Linux, Windows und
Mac ausgetauscht werden.

Das ist besonders wichtig, wenn eine Datei an einen Freund
weitergegeben werden soll, der ein anderes Betriebssystem hat. PGP ist
genau dafür gemacht, für die Kommunikation zwischen zwei Stellen. Die
Datei wird mit dem Public Key verschlüsselt und kann nur noch mit dem
richtigen Private Key entschlüsselt werden, es muss nicht erst ein
Passwort übermittelt werden, dass zum Ver- und Entschlüsseln genutzt
wird. PGP verwendet somit ein asymmetrisches Kryptosystem.

<del cite="https://plasisent.org/0e4d0frw">Schlecht für mehrere Benutzer und Dateien</del>
---------------------------------------------

<del cite="https://plasisent.org/0e4d0frw">Der Nachteil dieses Systems
ist sein Vorteil. Eine Datei wird genau für eine Person verschlüsselt
und kann nur von einer Person entschlüsselt werden. Soll eine Datei an
mehrere Benutzer verteilt werden, bietet sich dieses System nicht mehr
an, da die Datei in diesem Fall für jeden Benutzer speziell
verschlüsselt und übertragen werden muss.</del>

**Update:** Hauke Laging hat mich in einem Kommentar darauf
hingewiesen, dass der obere Absatz falsch ist. PGP verschlüsselt
Dateien symmetrisch (also mit einem Schlüssel, der immer gleich ist)
und verschlüsselt diesen Schlüssel mit dem Public Key des Empfängers.
Dadurch wird die zu übertragende Datei nur sehr geringfügig größer und
das System bleibt auch für mehrere Benutzer praktikabel. Ich bitte
darum meinen Fehler zu ent­schul­digen und danke Hauke für den
Hinweis.

Es gibt ein weiteres Problem. Wem ist aufgefallen, dass ich bisher immer
von „einer Datei“ schrieb? <del cite="https://plasisent.org/0e4d0frw">Das
hat einen Grund. PGP kann nämlich nur einzelne Dateien verschlüsseln.
Wer mehrere Urlaubsbilder verschlüsselt an seine Freunde weiter geben
möchte, muss diese demnach nicht nur für jede Person verschlüsseln,
sondern auch jede Datei extra.</del>

**Update:** Und in einem weiteren Kommentar hat mich
[Hauke](http://www.openpgp-schulungen.de/ "Mehr über OpenPGP
Schulungen.") darauf aufmerksam gemacht, dass ich auch das in
Unwissenheit geschrieben habe. Man kann also auch mehrere Dateien auf
einmal mit PGP verschlüsseln. (Es werden allerdings immer noch
einzelne Dateien angelegt.)

Dieser Nachteil lässt sich mit der Verwendung von Zip-Dateien
überwinden, aber wenn es sich um Dateien handelt, die regelmäßig
geändert werden (zum Beispiel eine Todo-Liste auf dem USB-Stick), dann
ist das sehr unpraktisch. <ins>*Update*: Mit <code>gpg-zip</code> gibt
es übrigens ein Commandline Tool, das [mehrere Dateien in einer
Zip-Datei verschlüsseln](http://plasisent.org/0e4m1e8p) kann.</ins>

USB-Sticks oder ganze Partitionen lassen sich mit PGP übrigens gar nicht
verschlüsseln. Die Verschlüsselung von USB-Sticks wäre ohnehinn nicht
sinnvoll, immerhin könnte der Stick nur geöffnet werden, wenn der
Private Key schon auf den PC übertragen wurde und genau das Übertragen
sollte verschlüsselt stattfinden.

Gute Integration in Windows mit Gpg4win
---------------------------------------

Nutzt man die Stärken der Datei Verschlüsselung von PGP für sich aus,
kann sich die Verwendung durchaus lohnen. Die freie Version von PGP für
Windows ([Gpg4win](http://gpg4win.org/ "GnuPG für Windows")) integriert
das Verschlüsseln von Dateien direkt in den Datei Explorer. So können
einzelne Dateien direkt mit einem Rechtsklick verschlüsselt werden. Wer
Windows und dieses Programm für die sicheren E-Mails sowieso installiert
hat, der hat keinen großartigen Mehraufwand.

Etwas schlechter sieht es dagegen unter Linux aus. Wer nicht gerne das
Terminal verwendet, der muss sich mit der eher schlechten als rechten
[Oberfläche des Gnu Privacy Assistant
(GPA)](http://www.gnupg.org/related_software/gpa/screenshots.html "Screenshots von GPA")
begnügen. Damit lässt sich umgehen, aber es ist nicht optimal.

Fazit
-----

Die Verschlüsselung von Dateien mit PGP kann gut verwendet werden, wenn
einzelne Dateien mit anderen ausgetauscht werden sollen. Durch die
Beschränkung auf den jeweiligen Private Key, ist dies eine sehr sichere
Variante. <del cite="https://plasisent.org/0e4d0frw">Nicht geeignet
ist dieses System dagegen um mehrere Dateien zu teilen, oder um
Dateien an viele Leute zu schicken.</del> Auch die Oberfläche unter
Linux lässt viele Wünsche offen; mit der Windows Version lässt sich
dagegen gut arbeiten.

Weiterführende Links
--------------------

-   [Schlüsselpaar im CLI
    erzeugen](http://www.email-nur-an-dich.de/anleitungen/gnupg/schluesselpaar-erzeugen)
-   [Anleitung zu GnuPG im
    Terminal](http://wiki.ubuntuusers.de/GnuPG#Dateioperationen)
-   [Anleitung für
    Windows](http://gpg4win.org/doc/de/gpg4win-compendium_24.html#id6)
