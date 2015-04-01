---
kind: article
categories:
- Freie Software
title: Code Horror in Sicherheitssoftware
created_at: '2014-07-11 17:26:32 +0200'
tags:
- Diff
cleaned?: false
---

Seit dem Heartbleed Bug verfolge ich die Entwicklung von
[LibreSSL](http://www.libressl.org/ "OpenBSD Fork von OpenSSL"), einem
Fork von OpenSSL. Wenn ich so sehe, was die OpenBSD Entwickler an
Quelltext von OpenSSL bereinigen, bleibt mir immer wieder der Mund offen
stehen.

[Das ist der
Wahnsinn!](https://secure.freshbsd.org/commit/openbsd/97efb3854e29f2f12b93ff73e2039f005a6d0fb5)
Richtig schlimm – also nicht ganz, immer­hin ist das ja die
Ver­bes­se­rung, aber der Code der Ver­gan­gen­heit ist … *schauder*.
Ich selbst bin jung und dumm, kein erfahrener C-Pro­grammierer und
sollte daher niemandes Quelltext verurteilen; aber das hätte vermutlich
sogar ich schöner hin bekommen.

Hierzu passt auch Rainer Königs [Buchtipp für
Softwareentwickler](http://koenig-haunstetten.de/2013/12/13/buchtipp-fuer-softwareentwickler/ "Rainer König empfehlt das Buch „The Art of Readable Code“."),
wo er – unter anderem – schreibt:

> Auch in den Tiefen des Linux-Kernels findet man Dinge die nicht
> unbedingt als Musterlösung durchgehen würden.

Leider hat er Recht. Vermutlich sieht es noch bei vielen anderen FLOSS
Pro­jek­ten so aus. Der Vorteil von freier Software ist aber, dass die
Probleme gesehen werden können. Und dass die Soft­ware knallhart
überarbeitet werden kann, wie es im Beispiel von LibreSSL geschieht.

Um meine Software (beziehungsweise andere Entwickler, die den Quelltext
lesen wollen) vor schlechtem Quelltext zu schützen werde ich Rainers
Tipp befolgen und mir demnächst auch dieses Buch zulegen.
