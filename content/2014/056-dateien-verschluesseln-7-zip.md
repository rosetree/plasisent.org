---
kind: article
categories:
- Verschlüsselung
title: 'Dateien verschlüsseln: 7-Zip'
created_at: '2014-05-06 18:15:15 +0200'
tags:
- Dateien verschlüsseln
cleaned?: false
---

Zum verschlüsselten Verteilen von Dateien eignet sich [das freie
Kompressionsprogramm 7-Zip](http://www.7-zip.org/). Dieses ist sowohl
für Windows, als auch für Linux verfügbar. Auf der Homepage von 7-Zip
steht auch, dass es von Packprogrammen auf Mac OS unterstützt wird, aber
das kann ich nicht nachprüfen.

Der größte Vorteil von 7-Zip ist die gute Unterstützung von vielen
verschiedenen Kompressionsmethoden. Damit können nicht nur 7z Dateien
entpackt werden, sondern auch die ganz normalen .zip Dateien und die
unter Linux geläufigen Archive wie tar, bz2 und gzip. Das Programm ist –
meiner Erfahrung nach – wegen der vielfältigen Unterstützung weit
verbreitet und kann deswegen gut verwendet werden, wenn verschlüsselte
Dateien ausgetauscht werden sollen, ohne dass ein neues Programm
installiert werden muss.

Der verwendete Algorithmus bei dem 7z Dateiformat kom­pri­miert das
Archiv sehr gut. Als ich 7-Zip im Vergleich mit zip testete, waren die
Archive von 7-Zip immer kleiner. Dadurch lassen sich die verschlüsselten
Dateien auch ohne Probleme über das Internet verteilen.

Um die Dateien zu verschlüsseln, wird der [Advanced Encryption
Standard](https://de.wikipedia.org/wiki/Advanced_Encryption_Standard "Der Wikipedia Artikel des AES")
(AES) mit einer Schlüsselstärke von 256-Bit verwendet. Diese
Ver­schlüs­selung ist so stark, dass sie sogar von den USA für Dokumente
mit der höchsten Geheimhaltungsstufe zugelassen werden.

Ein Nachteil ist in meinen Augen, dass immer erst ein Passwort
ausgemacht werden muss. Dazu böte sich zum Beispiel ein per­sönliches
Treffen oder mit [PGP verschlüsselte
E-Mails](http://www.email-nur-an-dich.de "E-Mails mit PGP verschlüsseln.")
an. Es ist allerdings eine größere Hürde, als wenn die [Dateien mit PGP
verschlüsselt](http://plasisent.org/mehrere-dateien-mit-pgp-verschluesseln/ "Mehrere Dateien mit PGP verschlüsseln")
werden könnten.

Trotzdem finde ich das Programm sehr hilfreich, da es sehr
be­nutzerfreundlich ist, viele verschiedene Funktionen bietet und eine
sehr starke Ver­schlüs­selung unterstützt und dadurch sehr zur
Sicherheit beiträgt.

Ich habe vor in Zukunft nur noch 7-Zip Archive auf diesem Blog zu
verbreiten. Davor hätte ich aber ein paar Fragen die du gerne in den
Kommentaren beantworten kannst. Kennst du 7-Zip schon? Benutzt du es
auch? Wenn nein: warum nicht?

Dieser Artikel ist Teil meiner Reihe zum [Verschlüsseln von
Dateien](http://plasisent.org/tag/dateien-verschluesseln/ "Themenreihe: Dateien verschlüsseln.").
