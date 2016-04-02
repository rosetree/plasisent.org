---
kind: article
title: Dateien verschlüsseln mit ctmg
---

Für Nerds und andere Menschen, die unter Linux mit dem <abbr
title="Command&nbsp;Line&nbsp;Interface">CLI</abbr> umgehen können.

[ctmg][] ist ein kleines [Bash][]-Script, mit dem verschlüsselte
Datei-Container auf einfache Weise verwaltet werden können. Und „klein“ ist es
wirklich; die [ausführbare Datei `ctmg.sh`][ctmg.sh] enthält weniger als
170&nbsp;Zeilen Code.
Durch diese schlanke Größe ist es auch nicht verwunderlich, dass ctmg von der
Verschlüsselung selbst die Finger lässt. Es versteht sich lediglich als Wrapper
für die schon vorhandenen Programme [LUKS][] und [cryptsetup][]. Dieses kleine
Helferlein orientiert sich damit an der [Unix-Philosophie][unix].

[ctmg]: https://git.zx2c4.com/ctmg/about/
[bash]: https://de.wikipedia.org/wiki/Bash_%28Shell%29
[ctmg.sh]: https://git.zx2c4.com/ctmg/tree/ctmg.sh

[luks]: https://de.wikipedia.org/wiki/Dm-crypt#LUKS
[cryptsetup]: http://linux.die.net/man/8/cryptsetup
[unix]: https://de.wikipedia.org/wiki/Unix-Philosophie

Für diese bewährten Programme, bietet ctmg ein sehr intuitives Interface an.
Der Befehl <kbd>ctmg new MeinenGeheimenContainer 42MiB</kbd> legt – wenig
überraschend – einen neuen Container mit 42&nbsp;MiB verfügbarem Speicherplatz
an, der mit <kbd>ctmg open MeinenGeheimenContainer</kbd> im aktuellen
Verzeichnis geöffnet wird.

MiB
: Diese Abkürzung steht für *Mebibyte*. Hier werden die Größen nach dem
  [Binär-System][10] berechnet und nicht – wie bei *Megabyte* (MB) – nach dem
  Dezimal-System. (Siehe auch den [Wikipedia-Artikel zu „Byte“][byte].)

  [10]: https://de.wikipedia.org/wiki/Dualsystem
  [byte]: https://de.wikipedia.org/wiki/Byte#Vergleich

Bekannte Probleme
-----

Leider benötigt dieses kleine Script root-Rechte. Es kann also nur von
Benutzern verwendet werden, die sudo-Rechte haben. Das [README von ctmg][ctmg]
warnt auch davor, es in Pfaden auszuführen, die von bösartigen Usern
kontrolliert werden könnten:

> This runs as root and auto-sudos itself to achieve that. As such, you
> shouldn't run this on paths you don't trust or paths that could be controlled
> by malicious users.

Es wird auch darauf hingewiesen, dass der Zweck von ctmg ausschließlich die
Geheimhaltung bestimmter Dateien zu ermöglichen. Eine Überprüfung der Echtheit
der Daten – wie bei PGP-Signaturen – ist nicht vorgesehen.

> If your laptop gets stolen, sleep safely knowing that your ctmg-secured data
> is safe, but if an attacker is actively modifying the .ct file while you're
> using it in one way or another, you've got trouble.

Der Entwickler hat ctmg übrigens erst vor wenigen Tagen [in einer Mailing-List
bekannt gegeben][announcement]. Es ist also relativ jung und es kann damit
gerechnet werden, dass es sich noch weiter entwickeln wird. Der Quelltext ist
aber gut aufgeräumt und auch eine Überprüfung mit [ShellCheck][] liefert keine
größeren Probleme.

[announcement]: https://lists.zx2c4.com/pipermail/password-store/2016-February/002125.html
[shellcheck]: http://www.shellcheck.net/

Welche Features fehlen ctmg?
-----

Bei einem jungen Script mit so spartanischer Aufgabe, ist es ein bisschen
idiotisch wegen fehlender Features zu meckern. Ich mach es dennoch. Hilfreich
wäre beispielsweise, wenn dieses Script aus den offiziellen Packet-Repositorys
verschiedener Linux-Distributionen (nicht nur [Gentoo][]) installiert werden
könnte. Der Aufwand ein Repository für dieses kleine Script zu erstellen, ist
in meinen Augen jedoch nicht angemessen. Andere Funktionen wären da eher
erdenklich.

[gentoo]: https://gentoo.org/

### Änderung einer Passphrase

Zum Ändern einer Passphrase, gibt es bei ctmg bisher kein Wrapper-Command.
Meine Idee um dieses Fehlen zu umgehen, war ein Workaround: einen neuen
Container anlegen, die Dateien aus dem alten Container verschieben und den
alten löschen.

    $ ctmg new neu 42MiB
    $ ctmg open neu
    $ ctmg open alt
    $ mv alt/* alt/.* neu
    $ ctmg close alt
    $ ctmg delete alt

Dieses ausführliche Verfahren ist jedoch nicht nötig, wenn man die
Fähigkeiten von cryptsetup kennt. Folgenden Befehl mit cryptsetup kann
verwendet werden, wenn der Container gerade geschlossen ist.

    $ cryptsetup luksChangeKey alt.ct

[In einer Mailing-List wird auf diesen Befehl hingewiesen.][mail] Ähnlich ist
es übrigens bei der Container-Größe, die mit [resize2fs][] angepasst werden kann.

[mail]: https://lists.zx2c4.com/pipermail/password-store/2016-March/002140.html
[resize2fs]: http://linux.die.net/man/8/resize2fs

### Vervollständigung der Befehle

Zeit ist Geld, wird immer wieder gesagt. Zeit im Commandline-Interface kann
gespart werden, wenn Programme ihre eigenen Befehle vervollständigen. Zudem
wird nicht nur Zeit gespart, sondern auch Tippfehler vermieden. Bei ctmg wäre
für die Tab-Vervollständigung auch denkbar, dass die Container im aktuellen
Ordner per Tab vervollständigt werden.

Habe ich bereits erwähnt, dass ctmg im Quelltext verfügbar ist und gute Patches
gemergt werden? Es könnte also jemand Feature-Wünsche abarbeiten…

Über den Maintainer
-----

[Jason Donenfeld][jad] veröffentlicht unter seinem kryptischen Nickname
[zx2c4][] ettliche Programme und Scripte. Unter anderem auch [Password
Store][pass], ein Passwort-Manager Bash-Script, das auf die freie
PGP-Implementation [GnuPG][] zurückgreift, um die Passwörter sicher zu
speichern.

[jad]: https://www.jasondonenfeld.com/
[zx2c4]: https://www.zx2c4.com/
[pass]: https://www.passwordstore.org/
[gnupg]: https://gnupg.org/
