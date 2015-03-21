---
kind: article
category: plasisent
title: "Introducing: “Plasisent Preview”"
created_at: 2015-03-21 21:51:30 +0200
tags:
  - Server
  - Plasisent
  - Blog
  - Github
  - Beta
  - Preview
  - Vorschau
  - Von WordPress zu Nanoc
  - Kommentare
  - Pandoc
  - WordPress
  - Nanoc
  - E-Mail
  - PGP
  - Web-Feed
  - RSS
  - Atom
---

Die [Entwicklung der neuen Version dieses Blogs][commits] schreitet voran.
Heute war ich wieder fleißig und habe eine Vorschau auf den neuen Blog
vorbereitet. Du bist herzlich dazu eingeladen dir diese
[Beta-Version][vorschau] des Blogs anzusehen und mir deine Meinung und Wünsche
mitzuteilen.

## Was steht noch an?

Es gibt für mich immer noch ein paar Punkte die ich klären und erledigen muss,
bevor ich auch die Domain umziehe.

1. Das Thema mit den Kommentaren ist für mich immer noch nicht vollständig
   geklärt.

   Einerseits gefällt es mir, wenn Blogs eine Möglichkeit für anonyme
   Kommentare anbieten. Durch Kommentare wird einem Artikel oft noch ein
   Mehrwert geboten. Zum Beispiel wurden mir vor ein paar Monaten [in
   Kommentaren gravierende Fehler aufgezeigt][hk-kommentiert].

   Andererseits merke ich, dass mein Blog fast nie kommentiert wird. Oh Pardon,
   das ist falsch. Es gibt haufenweise Kommentare, mehrere Hundert pro Woche.
   Leider – trotz Captcha – nur Spam. Auf meine 206 Beiträge kommen 63
   sinnvolle Kommentare und Pingbacks. Das meiste kann auch gut in eine E-Mail
   geschrieben werden. Bei E-Mail gäbe auch den Vorteil, dass man einfach
   [Signaturen von PGP][sign] nutzen kann.

2. Die meisten bisherigen Artikel muss ich noch aus der WordPress-Datenbank
   befreien und in das Format für Nanoc konvertieren. Mir schwebt da eine
   Lösung mit einem Script, SQL und [Pandoc] vor. Aber noch ist nichts
   genaueres geplant.

3. Bisher habe ich noch keinen einzigen [Web-Feed] für die neue Plasisent
   Version entwickelt. Eigentlich eine Schande, wenn man mal betrachtet, wie
   sehr ich Feeds liebe.

   Auf jeden Fall muss ein Feed für die normalen Artikel her. Punkt. Später
   will ich aber auch Feeds für Kategorien (in der neuen Version nenne ich sie
   „Regale“) und für Tags (oder „Themen“). Die letzteren sind mir aber erstmal
   nicht ganz so wichtig.

   Nutzt du so etwas? Verwendest du Feeds?  Verwendest du Feeds für spezielle
   Themen und Kategorien eines Blogs?

So viel zu einem kurzen Überblick meiner Gedanken zu diesem Blog. Wie bereits
erwähnt, es würde mich sehr freuen, wenn du mir deine Meinung mitteilst.


[commits]: https://github.com/rosetree/plasisent.org/commits/master

[vorschau]: http://plasisent.rosetree.de/

[hk-kommentiert]: http://plasisent.org/2014/dateien-verschluesseln-pgp/#comment-71

[sign]: https://de.wikipedia.org/wiki/Digitale_Signatur#PGP-Systeme

[pandoc]: http://johnmacfarlane.net/pandoc/

[web-feed]: https://de.wikipedia.org/wiki/Web-Feed
  "Der Wikipedia Artikel über Web-Feeds."
