---
kind: article
title: Outline-Optimierung bei Plasisent
tag:
- Plasisent
- Design
- Blog
---

Nach einer [Änderung am Layout][merge] von Plasisent, wird das Hauptmenü und
eine [kleine Beschreibung des Blogs][ueber] am Ende jeder Seite angezeigt –
nach dem eigentlich angeforderten Inhalt. Das wirkt auf den ersten Blick
vielleicht etwas ungewohnt, aber dadurch spiegelt sich auf der Seite semantisch
wieder, was im jeweiligen Seitentitel angekündigt wird. Die Titel der Seiten
haben immer das selbe Format: „Titel des Blog-Posts · Plasisent“

[merge]: https://github.com/rosetree/plasisent.org/commit/61c94afb8fc90b8740228fe3b3227c1ff39dc8e7
[ueber]: #ueber-plasisent

Mit der Änderung übertrage ich auch mein persönliches Verhalten beim Besuch
eines Blogs, in die Gliederung meines Blogs. Gelange ich zum ersten Mal auf
eine neue Seite, lese ich als erstes den Inhalt, der mich auf das Blog lockte.
Falls mir der Artikel gut gefallen hat, überlege ich, ob ich mehr über Blog und
Autor erfahren möchte. In diesem Zuge entscheide ich auch, ob ich einen
Web-Feed abonniere oder einem dem Twitter-Account folge.

Vorher-Nachher – der Vergleich zweier Gliederungen
-----

Schauen wir uns als Beispiel das Outline (mit versteckten Überschriften) des
Artikels über mein [Lenovo ThinkPad T450][t450] an:

[t450]: http://plasisent.org/2016/lenovo-thinkpad-t450/

    Plasisent
        [nav element with no heading]
    Lenovo ThinkPad T450
        schöner, schneller, schmaler
            Performance-Beispiel: Twitter
            Performance-Beispiel: Blog mit Nanoc
        Das Setup des T450
        Und das veraltete Edge?
            Ausmusterung: Spende
            Ausmusterung: Tests & Experimente
            Ausmusterung: Alt aber sicher
        Abschließende Gedanken
        Metadaten
        Sonst noch was?

Ein paar negative Punkte fallen mir auf.

1. Das Hauptmenü hat keine Überschrift.

2. Ein Teil der globalen Informationen („Sonst noch was?“) wird dem Artikel der
   Seite untergeordnet. Das ist in der Gliederung ziemlich unlogisch.

3. Die globalen Informationen sind aufgeteilt: Ein Teil steht vor dem Artikel und
   ein Teil steht danach. Auch das ist nicht besonders logisch oder hilfreich.

Vergleichen wir das mit dem neuen, klarer strukturiertem Outline:

    Lenovo ThinkPad T450
        schöner, schneller, schmaler
            Performance-Beispiel: Twitter
            Performance-Beispiel: Blog mit Nanoc
        Das Setup des T450
        Und das veraltete Edge?
            Ausmusterung: Spende
            Ausmusterung: Tests & Experimente
            Ausmusterung: Alt aber sicher
        Abschließende Gedanken
        Ab- und Hintergründe der aktuellen Seite
    Über Plasisent
        Plasisent Navigation
        Folge Blog und Blogger

1. Das Hauptmenü hat eine (im Design versteckte) Überschrift.

2. Die Seiten-übergreifenden Informationen sind nicht nicht mehr dem Artikel
   untergeordnet, sondern auf dem gleichen Level wie der Artikel.

3. Alle globalen Informationen wurden unter dem Haupt-Inhalt zusammengefasst.

Inspiration und Lesestoff
-----

Empfehlen kann ich dazu die Artikel [<cite>Where should the logo
be?</cite>][logo] und [<cite>Where should the navigation be?</cite>][nav] von
[Vasilis van Gemert][vasilis], einem niederländischen Dozenten für digitales
Design.

[logo]: https://vasilis.nl/nerd/where-should-the-logo-be/
[nav]: https://vasilis.nl/nerd/where-should-the-navigation-be/
[vasilis]: https://vasilis.nl/
