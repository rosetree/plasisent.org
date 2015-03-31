---
kind: article
category: crypto
title: "Betrifft „Editorial: Lasst PGP sterben!“"
created_at: 2015-02-21 21:40:42 +0200
tags:
  - Verschlüsselung
  - Apple
  - Google
  - heise online
  - Jürgen Schmidt
  - Matthias Spielkamp
  - Metadaten
  - PGP
  - pretty Easy privacy
  - TextSecure
---

In der bekannten und beliebten Zeitschrift *c’t*, schrieb Jürgen Schmidt das
Editoral mit dem Titel „[Lasst PGP sterben!][editorial]“. Dieses hat mir
überhaupt nicht gefallen.

> Wie gute Ende-zu-Ende-Verschlüsselung heute aussehen muss, demonstriert Apple
> mit iMessage

Ähm, falsch. Apple demonstriert mit iMessage vielleicht, wie ein Chat-Client
aussehen kann, der ohne große Kompetenz bedienbar ist. iMessage ist ohne Frage
[bequem benutzbar ohne zu lernen][easy], aber macht das eine *gute*
Ende-zu-Ende-Verschlüsselung aus? Eher nicht. Zumindest in meinen Augen ist die
Sicherheit, die eine Verschlüsselung bieten soll, wichtiger als dass die Tools
ohne zu Lernen bedienbar sind.

> Millionen von iPhone-Besitzern wissen nicht einmal, dass sie ihre
> Kurznachrichten verschlüsseln.

Und genauso viele iPhone-Besitzer können nicht überprüfen, ob die
Verschlüsselung wirklich Ende-zu-Ende ist. Apples iMessage ist keine freie
Software. Es kann also von niemandem geprüft werden, ob nicht ein Key von Apple
eingebaut wird.

> Das Chat-Programm TextSecure zeigt, wie man das in Bezug auf Offenheit und
> Sicherheit noch verbessern kann

[TextSecure] ist freie Software und wirklich nicht schlecht, hat aber auch
Probleme. Mir gefällt die Abhängigkeit von Google überhaupt nicht. Man benötigt
den Google Play Store für die Installation und die Nachrichten werden über
*Google Cloud Messaging* versendet und auch sonst [ist TextSecure stark mit
Google verdrahtet][ts-google]. Der Inhalt der Nachricht ist zwar sicher
verschlüsselt, aber Metadaten fallen dennoch an und wie wir ja wissen gab der
ehemalige NSA-Chef zu: „[Wir töten auf Basis von Metadaten][metadaten]“. Jetzt
muss man sagen, dass auch bei E-Mails Metadaten anfallen, aber die sind
wenigstens nicht an einer zentralen Stelle.

Einer Aussage von Jürgen Schmidt stimme ich allerdings zu. Es wäre natürlich
schön, wenn sichere Verschlüsselung unkompliziert wäre. In meinen Augen scheint
es in diese Richtung auch einen guten Fortschritt zu geben. Das *[pretty Easy
privacy][pep]* Projekt verwendet E-Mails und PGP um eine sichere Kommunikation
zu schaffen.

Bis pEp, oder eine andere einfache und sichere E-Mail-Verschlüsselung, größere
Verbreitung findet, müssen wir uns mit PGP begnügen. Dazu möchte ich einen
[Tweet] von Matthias Spielkamp zitieren:

> Weg mit PGP, bevor es sinnvolle Alternative für eMail-Encryption gibt, kann
> doch keine Strategie sein.


[editorial]: http://www.heise.de/ct/ausgabe/2015-6-Editorial-Lasst-PGP-sterben-2551008.html

[easy]: http://www.over-yonder.net/~fullermd/rants/userfriendly/2

[TextSecure]: https://github.com/WhisperSystems/TextSecure

[gps]: http://support.whispersystems.org/customer/portal/articles/1476204-why-do-i-need-google-play-installed-to-use-textsecure-on-android-

[ts-google]: https://github.com/WhisperSystems/TextSecure/search?q=google&utf8=%E2%9C%93

[metadaten]: http://www.heise.de/newsticker/meldung/Ex-NSA-Chef-Wir-toeten-auf-Basis-von-Metadaten-2187510.html

[pep]: http://pep-project.org

[tweet]: https://twitter.com/spielkamp/status/568715079635632128
