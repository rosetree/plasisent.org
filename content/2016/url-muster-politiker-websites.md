---
title: URL-Muster von Politiker Websites
kind: article
---

Inzwischen zähle ich *Nachdenken über das Design von URLs verschiedenster,
fiktiver Websiten* zu meinen Hobbys. In diesem Beitrag halte ich speziell
einige meiner Gedanken zu Internetseiten von Politikern fest. ([Warum?][])

[warum?]: #warum

**Kurzer Hinweis** zum Zustand dieses Beitrags: Er ist sehr unfertig. Aber
nachdem er jetzt mehrere Monate veröffentlicht werden will, dachte ich, ich tue
ihm den Gefallen, auch wenn er mir noch nicht gefällt. Schreib mir doch ruhig
trotzdem, wenn dir etwas dazu einfällt ☺

Verschiedene URL-Muster im Vergleich
------------------------------------

Beim Surfen über verschiedenste Internetseiten – sei es Blogs, Micro-Pages oder
Typo3-Schlachtrösser – sind mir viele Varianten von URLs aufgefallen. Die Blogs
mit WordPress geben sich in der Regel sehr leicht mit URLs im folgenden Muster
zu erkennen:

    /{jahr}/{montat}/{tag}/{titel}/

Jedoch sind alle Zeitangaben optional und werden – je nach Geschmack oder
Konfiguration – weg gelassen. Dieses Schema finde ich okay, solange zumindest
das Jahr belassen wird. Eine gewisse zeitliche Gliederung und Trennung zwischen
Blog-Post und Seite, halte ich für sinnvoll.

Vielfältiger sind Seiten, die mit einem Content-Management-System wie Typo3
entwickelt wurden. Bei diesen reichen die URLs von angeblichen HTML-Dateien,
bis hin zu einem Parameter-Cocktail, der einem die Sinne raubt. (Ja
<code>[tt_news][]</code>, ich meine dich!)

[tt_news]: https://typo3.org/extensions/repository/view/tt_news

    /person.html
    /person/lebenslauf.html

Desweiteren gibt es noch eine Reihe obskurer Lösungen, deren Lösungsweg ich
noch nicht nachvollziehen konnte. Meistens halte ich diese Ansätze jedoch für
suboptimal; eigentlich immer.

Idee: Dokumente nach Parlement und Wahlperiode strukturiert
-----------------------------------------------------------

Weder WordPress noch Typo3 möchte ich einen Vorwurf machen. Lediglich
Politikern und ihren Web-Entwicklern, die zu sehr in Klischees verfallen.
Meiner Meinung nach, wäre es sinnvoller, die URLs einer Politiker Website nach
Parlament und Wahlperiode in diesem Parlament zu gliedern. Dadurch entstehen
zeitlich und örtlich gruppierte Seiten, die auch für die Suchmaschinen
Optimierung hilfreich sind.

    /{parlament}/{wahlperiode}/{base36datum}-{titel}(.{sprache})

Base 36
: Ein [Zahlensystem][], das – im Gegensatz zum [Dezimalsystem][] – nicht nur
  Ziffern (`0-9 = 10 Zeichen`), sondern auch allen Kleinbuchstaben (`0-9 und
  a-z = 36 Zeichen`) verwendet, um Zahlen zu schreiben. Dadurch können große
  Zahlen mit weniger Zeichen geschrieben werden.

[Zahlensystem]: https://de.wikipedia.org/wiki/Zahlensystem
[Dezimalsystem]: https://de.wikipedia.org/wiki/Dezimalsystem
[Base 62]: https://de.wikipedia.org/wiki/Base62


### URL-Checkliste

* Das Archiv ist nach Gremium strukturiert und kann somit von den Besuchern gut
  nach Interesse gefiltert werden. Stuttgarter interessieren sich womöglich
  weniger für Hamburgs Lokal-Politik, Aktivitäten von Hamburger Politikern im
  Bundestag ist aber auch für sie nicht unrelevant.

* Die zeitliche Gruppierung der Seiten ist mit der Wahlperiode vorhanden.
  Gremien, Ministerien, Fraktionen und Aufgaben eines Einzelnen verändern sich
  von eine Wahlperiode zur nächsten. Meiner Meinung nach sollte schon in dem
  URL ersichtlich sein, in welchem Umfeld ein Dokument erstellt wurde.

* Einzelne Dokumente können übersetzt werden, ohne der Anschein einer
  vollständig übersetzten Seite erweckt wird. Eine vollständig übersetzte Seite
  ist für die meisten Politiker wohl ein eher unerreichbares Ziel.

* Blog-Beiträge sind von generellen Seiten unterscheidbar. Mit dem Datum im
  Zahlensystem mit der Basis 36 zwar etwas kryptisch, aber nicht völlig gleich
  wie zum Beispiel Übersichtsseiten.

Inspiration
-----------

Hauptsächlich wurden meine Idee von der Nummerierung der [Drucksachen][] in
deutschen Parlamenten inspieriert. Die eindeutige Nummer dieser Dokumente
ergibt sich immer aus der Wahlperiode und einer fortlaufenden Zahl. Später
erfuhr ich von dem [Open Knowledge Foundation][okfn] Projekt [kleine
Anfragen][]. Dort wird genau dieses Muster auch verwendet.

[drucksachen]: https://www.bundestag.de/dokumente/drucksachen/drucksachen/199312
[okfn]: https://okfn.de/
[kleine anfragen]: https://kleineanfragen.de/

<h2 id="warum">Warum denke ich darüber nach?</h2>

Entfernen wir erst den Elefanten im Raum: Ich habe aktuell keine konkreten
Pläne in die Politik zu gehen. Ich bin einfach sehr interessiert an Politik und
ein großer Fan von Internetseiten mit tollen URLs. Treffen beide Interessen wie
bei mir aufeinander, stößt man zu gegebener Zeit auf die Internetseiten von
Politikern. Als Web-Entwickler denke ich unweigerlich darüber nach, wie sie
besser gemacht werden könnten.

Eines fiel mir bei Internetseiten von Politikern (z.B. [Thomas Kreuzmann (CDU),
MdHB][tk] oder [Dennis Gladiator (CDU), MdHB][dg]) immer wieder auf:
**Politiker und ihre Websites haben viel Potential für Verbesserungen.** In
Bezug auf Design, Accessability, Layout, Inhalt, Typografie, Regelmäßigkeit in
der Aktualisierung, Allgemeine Darstellung und natürlich eben auch *URL-Design*
– erwähnte ich schon, dass meistens die Optik verbessert werden könnte?

[tk]: http://www.kreuzmann.de/
[dg]: http://www.dennis-gladiator.de/

Eine gute Website, hat meiner Meinung nach übrigens [Volker Beck][]. Mal
abgesehen von der Internationalisierung. Die gefällt mir bei [Julia Reda][]
besser.

[Volker Beck]: http://www.volkerbeck.de/
[Julia Reda]: https://juliareda.eu/

Kurz angeschnittenes
--------------------

* [Cool URIs don’t change](https://www.w3.org/Provider/Style/URI)
* [Cool URIs for the Semantic Web](https://www.w3.org/TR/cooluris/)
* [Educational hypertext and the “why” link](https://www.w3.org/Provider/Style/Educational)
* [Internationale und mehrsprachige Websites](https://support.google.com/webmasters/answer/182192?hl=de)
