---
title: Suche
---

# Suche bei Plasisent

Eine Suche gibt es in diesem Blog erstmal nicht; ich versuche aber alle Artikel
möglichst gut mit Themen auszustatten, sodass du von einem Artikel schnell zu
ähnlichen Artikeln gelangst.

Hier könntest du aber auf ein kleines Problemchen stoßen. Ich habe meine
früheren Artikel nicht so gut verschlagwortet wie ich es mit meinen neueren zu
tun pflege. Deswegen könnte es sein, dass du bei den Themen-Verknüpfungen nicht
fündig wirst. In diesem Fall, kannst du aber mein Git-Repository bei [GitHub]
verwenden um dieses Blog zu durchsuchen. Und sieh mal, ein kleines Eingabe-Feld
kann ich dir auch anbieten:

<form action="https://github.com/rosetree/plasisent.org/search?l=markdown&utf8=%E2%9C%93" method="get">
  <input type="hidden" name="l" value="markdown" />
  <input type="hidden" name="utf8" value="✓" />
  <input type="text" name="q" placeholder="z.B. „VDS“, „PGP“ oder „Tante Jay“" />
  <input type="submit" value="Suchen" />
</form>

## Speziell für Nerds

Auch – oder gerade – als Nerd solltest du das [GitHub Repository von
Plasisent][git plasisent] zur Suche nutzen. Allerdings entfaltet sich hier die
wahre Freude am Suchen nicht mit der Online-Eingabe, sondern mit [Grep] und
einer geklonten Version des Quelltextes.

    $ git clone https://github.com/rosetree/plasisent.org.git
    $ cd plasisent.org
    $ grep -ir "Verschlüsselung" .

Wunderschön.

## Nichts gefunden?

Ich hoffe zwar, dass du bei deiner Suche fündig wirst, aber versprechen kann
ich dir das leider nicht. Es ist beispielsweise möglich, dass ich zu einem
Thema bisher nichts geschrieben habe. Wenn du mit dem Ergebnis nicht zufrieden
bist, schreibe mir doch bitte eine E-Mail, vielleicht kann ich dir helfen.


[github]: https://github.com/

[git plasisent]: https://github.com/rosetree/plasisent.org

[grep]: http://www.gnu.org/software/grep/
