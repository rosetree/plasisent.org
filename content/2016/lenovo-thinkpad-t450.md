---
kind: article
title: Lenovo ThinkPad T450
---

Seit Ende 2011 nutzte ich einen schon damals nicht besonders leistungsstarkes
Notebook von Lenovo. Günstig sollte es damals sein, hauptsache klein und
transportabel für die Berufsschule. Seinen Zweck hat es überlebt und auch lange
nach der Schule, habe ich es in meinem Beruf Tag für Tag genutzt. Was ich
verpasst habe, erfahre ich jetzt, nachdem mir die Firma ein neues Arbeitsgerät
spendierte.

schöner, schneller, schmaler
-----

Mein neues Laptop ist ein **Lenovo ThinkPad T450**, mit US-Tastatur,
14&nbsp;Zoll Bildschirm-Diagonale und dabei sogar etwas leichter, als mein
vorheriges ThinkPad Edge&nbsp;325 (E325) mit 13,3&nbsp;Zoll.

![Höhenvergleich zwischen dem E325 und dem T450. Das unten liegende T450 ist schmaler und damit angenehmer beim Transport.](http://plasisent.org/2016/e325-vs-t450.jpg)

Das T450 kommt zudem mit deutlich mehr Leistung als das Edge. Musste ich mich
früher mit einem 1,6-GHz Prozessor begnügen, kommt nun ein i5 mit
2&nbsp;×&nbsp;2,3-GHz zum Einsatz. Der Arbeitsspeicher hat sich auf
7,7&nbsp;GiB mehr als verdoppelt. Auch die SSD bringt gegenüber der anderen
Festplatte einige Geschwindigkeits-Vorzüge mit sich.

### Performance-Beispiel: Twitter

Zahlen. Aber Zahlen, die sich im Alltag bemerkbar machen. Beispielsweise bei
[Twitter][]. Mit dem obsoleten Modell war diese Seite ein Horror. Lange
Ladezeiten, Abstürze, noch mehr lange Ladezeiten, schlechte Reaktionszeiten –
ein gewaltiges Armutszeugnis für einen großen Internet-Konzern. Jetzt kann ich
Twitter besuchen und es kommt mir vor, als wäre es eine normale, gut
programmierte und optimierte Internetseite. Ich werde mich in der nächsten Zeit
nicht mehr bei jedem Seiten-Aufruf fragen, ob ich meinen Account löschen soll.

[twitter]: https://twitter.com/plasisent/status/689479484861472768

### Performance-Beispiel: [Blog mit Nanoc][quelltext]

[quelltext]: https://github.com/rosetree/plasisent.org

Selbst [dieses Blog][plasisent] macht mit mehr Performance mehr Spaß. Die
Website selbst ist sehr minimalistisch und machte bisher keinem Browser
Schwierigkeiten. Sie wird aber vor der Veröffentlichung von einem [Quelltext][]
generiert. Dieser Prozess benötigte auf meinem alten System circa
70-100&nbsp;Sekunden. Ziemlich anstrengende Wartezeit, wenn man nur kurz sehen
möchte wie der neue Post gerade im Layout aussieht. Jetzt erhalte ich das selbe
Ergebniss in unter 20&nbsp;Sekunden. Es ist eine Freude!

[plasisent]: http://plasisent.org/

Um die Zeit des Generierens besser nutzen zu können, schrieb ich mir ein
kleines [Build-Skript][]. Dieses sendet bei Vollendung des Vorgangs eine
System-Benachrichtigung. Mit dieser Hilfe kann ich eine Nachrichtenseite lesen
und bei der Benachrichtigung in den Local-Blog-Tab wechseln. Jetzt lohnt sich
dieses Skript fast nicht mehr.

[build-skript]: https://github.com/rosetree/plasisent.org/blob/master/build

Das Setup des T450
----

Ich bleibe meiner ersten Linux-Distribution treu: Ubuntu. Installiert habe ich
das aktuelle [Ubuntu 15.10][1510], im April werde ich auf die nächste
[Long-Term-Support][lts] (LTS) Version upgraden, damit erhalte ich Updates bis
ins Jahr&nbsp;2021.

[1510]: http://releases.ubuntu.com/15.10/
[lts]: https://wiki.ubuntu.com/LTS

Zum ersten Mal habe ich bei der Installation die
[Festplatten-Verschlüsselung][sda3_crypt] aktiviert; anhand einer
[Anleitung][sda3_crypt] von [Micah Lee][]. Ebenfalls einer [Empfehlung
Lees][ti_diceware] folgend, habe ich die [Passphrase][] mit [Diceware][]
erstellt.

[micah lee]: https://micahflee.com/
[sda3_crypt]: https://theintercept.com/2015/04/27/encrypting-laptop-like-mean/
[ti_diceware]: https://theintercept.com/2015/03/26/passphrases-can-memorize-attackers-cant-guess/
[passphrase]: https://xkcd.com/936/
[diceware]: https://de.wikipedia.org/wiki/Diceware

Der Umzug meiner Dokumente, war mit Hilfe der Verschlüsselten Backups von
[Restic][] zügig erledigt. In den kommenden Tagen folgen über 100&nbsp;GB
Bilder und Musik. Ansonsten installierte ich gleich die für mich übliche
Software: [Git][], [Neovim][], [RVM][], [Nanoc][], [Git Cola][], [PHP][],
[Apache2][], [Restic][], [Ledger][], [Pass][].

[git]: https://git-scm.org/ "git - the stupid content tracker (quelle: git manual)"
[neovim]: https://neovim.io/ "Vim for the 21st century."
[rvm]: https://rvm.io/ "The Ruby Version Manager"
[nanoc]: https://nanoc.ws/ "a static site compiler written in Ruby"
[git cola]: https://git-cola.github.io/ "The highly caffeinated Git GUI"
[php]: https://www.php.net/ "Eine Script-Sprache für Web Entwicklung"
[apache2]: https://httpd.apache.org/ "Apache Hypertext Transfer Protocol Server"
[restic]: https://restic.github.io/ "restic · Backups done right!"
[ledger]: http://ledger-cli.org/ "Command-line, double-entry account reporting tool"
[pass]: http://www.passwordstore.org/ "stores, retrieves, generates, and synchronizes passwords securely"

Und das veraltete Edge?
-----

Noch bin ich unschlüssig, was ich mit dem ausgemusterten Laptop anstellen soll.
Es gibt ein paar Möglichkeiten, die ich in Betracht ziehe. Nicht alle sind
gleich sinnvoll oder erstrebenswert.

### Ausmusterung: Spende

Im Web finden sich viele verschiedene Aufrufe, alte und nicht mehr genutzte
Laptops weiterzugeben (aktuelles Beispiel [Web We Want: Your Smart Phone Is
Dump][www]). [Refugees on Rails][RoR] erwähnte ich bereits. Das Framework
<em>Ruby on Rails</em>, mit dem Flüchtlingen in deren Projekt das Programmieren
beigebracht werden soll, verwenden wir in der Firma auch sehr gerne. Es gibt
aber bestimmt noch weitere Projekte.

[www]: https://webwewant.org/news/smart-phone-dumb/
[RoR]: http://refugeesonrails.org

Vorher müsste ich aber die Festplatte tauschen. Zum einen ist eine SSD deutlich
angenehmer zum Arbeiten und zum anderen will ich nicht, dass meine Daten für
andere herstellbar sind.

### Ausmusterung: Tests & Experimente

Eine sinnvolle Verwendung für das Edge wäre auch als Testgerät für die [CODE
MASCHINE][]. Immerhin habe ich dank dieser Firma ein schnelles Notebook und ich
würde gerne vermeiden, dass wir selbst Web-Anwendungen mit Twitter-Performance
entwickeln. Ein weiteres Testgerät kann dafür nicht schaden. Verschiedene
Betriebsysteme und Browser installieren und wir haben ein langsames Gerät für
unsere Tests.

[code maschine]: http://codemaschine.de/

Kombinierbar wäre dies mit einem Vorhaben, das ich seit langem im Hinterkopf
habe, aber aus Zeit- und Sicherheits-Gründen bisher nicht anging. Ich würde
gerne ein bisschen mit dem [Kernel-Quelltext][kernel] vertraut werden und den
Kompiliervorgang kennenlernen. Aber einen selbst gebauten Linux-Kernel will ich
nicht auf meinem Produktiv-System installieren. Mit der Ausmusterung hätte ich
jedoch ein Gerät, dessen System ich auch ohne größeren Schaden komplett
zerschießen könnte.

[kernel]: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/

### Ausmusterung: Alt aber sicher

Die Internetseite über [OpenPGP-Schulungen][pgp] empfiehlt, einen alten Rechner
als [sicheren Zweitrechner][aas] zu nutzen. Für mich wäre
das ein [Debian][], mit verschlüsselter Festplatte, ohne Zugang zum Internet
und eigenem [offline PGP-Hauptschlüssel][].

[pgp]: http://openpgp-schulungen.de/
[aas]: http://alt-aber-sicher.de/
[debian]: https://www.debian.org/
[offline PGP-Hauptschlüssel]: http://openpgp-schulungen.de/glossar/offline-hauptschluessel/

Im Prinzip kein unsinniger Gedanke. In Anbetracht der Menge an wichtiger
Informationen, die mir verschlüsselt zugeschickt werden, ist dieses Unterfangen
jedoch nicht die Mühe wert. Beziehungsweise die anderen Möglichkeiten der
Weiterverwendung sind in meinen Augen erstrebenswerter.

Abschließende Gedanken
-----

Der Umstieg hat sich total gelohnt und schon nach wenigen Stunden möchte ich
mein neues T450 nicht mehr missen. Bleibt die Frage, was ich mit meinem alten
Edge anfange (Vorschläge nehme ich gerne per Mail an
<a href="mailto:micha@rosetree.de?subject=Vorschlag%20und%20Re:%20Lenovo%20ThinkPad%20T450">micha@rosetree.de</a>
entgegen) und vor allem gilt es zu klären: Welcher [Sticker][] wird das T450
als erstes personalisieren? Vorschläge per Mail ;)

[sticker]: http://plasisent.org/2014/laptop-stickermania/
