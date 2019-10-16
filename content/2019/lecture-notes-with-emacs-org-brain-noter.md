---
lang: en
title: "Taking lecture notes with Emacs, Org mode, org-brain and org-noter"
kind: article
description: "Two great Org mode plugins allow me, to write my notes in Emacs, structure them in an concept map and show them side-by-side to the lecture slides: org-noter and org-brain."
---

I use [Emacs][], [Org mode][] and the Org mode plugins [org-noter][]
and [org-brain][] to take notes during lectures. On this page you will
find information about my setup and workflow. I’m going to asume, that
you know Emacs, how to configure this text editor, how to install
packages from MELPA and know about Org mode.

[emacs]: https://gnu.org/s/emacs
    "GNU Emacs"

[org mode]: https://orgmode.org/
    "Org: an Emacs Mode for Notes, Planning, and Authoring"

[org-brain]: https://github.com/Kungsgeten/org-brain
    "org-brain: Org mode wiki + concept-mapping"

[org-noter]: https://github.com/weirdNox/org-noter
    "org-noter: Emacs document annotator, using Org mode"

## The Setup

First of all, install org-noter and org-brain from MELPA. Please
verify, that you can use org-noter to annotate pdf documents and
create a first brain on your system.

If you compare the headlines that are created with org-noter with
those created by org-brain, you might see a difference in the
`:PROPERTIES:` drawer. Org-noter adds some metadata to the headlines.
This is used to sync notes, with the document locations.

All org-brain headlines were created with an `:ID:`. This is
neccessary for org-brain, to show the headlines with
`org-brain-visualize`. The org-noter headlines don’t have an id
associated with them. I want the org-noter entries, to be shown in the
brain. To achieve that, org-noter must be configured to always create
an `:ID:` to new note headlines. This is done with adding the
`org-id-get-create` function to the `org-noter-insert-heading-hook`:

    (add-hook 'org-noter-insert-heading-hook #'org-id-get-create)

Now all new notes will receive an id. If you create a note with
org-noter in a org-brain buffer, that will show up in the brain. This
is useful.

But it’s not yet convenient to open a Noter session. With the current
configuration, you cannot open a Noter session from within the
visualized brain. Instead you would have to open the current entry in
an Org mode buffer, call `org-noter` there and visualize the brain
again. We have to define a new function for this feature:
`org-brain-open-org-noter`. This function can be called from a
visualized org-brain and opens the Noter session for the current
entry.

    (defun org-brain-open-org-noter (entry)
        "Open `org-noter' on the ENTRY.
    If run interactively, get ENTRY from context."
        (interactive (list (org-brain-entry-at-pt)))
        (org-with-point-at (org-brain-entry-marker entry)
          (org-noter)))

If you annotate a lot of documents, this is a bit long to type. It
might be a good idea, to add a keyboard shortcut for the visualised
brain. In the following example `org-brain-open-org-noter` is mapped
to `C-c n`:

    (define-key org-brain-visualize-mode-map
      (kbd "\C-c n") #'org-brain-open-org-noter)

## The Workflow

I made a short video showing the structure of my studies brain and
talking a bit about my workflow and how I use it during class. I hope
this helps someone, even though this is my first screen recording
experiment.

<video controls width="50%">
<source type="video/mp4" src="../lecture-notes-with-brain-and-noter.mp4">
<source type="video/mkv" src="../lecture-notes-with-brain-and-noter.mkv">
<p>Sorry, your browser doesn’t support embedded videos. You can download
this video as <a href="../lecture-notes-with-brain-and-noter.mp4">MP4 file</a>
or <a href="../lecture-notes-with-brain-and-noter.mkv">MKV file</a>.</p>
</video>

In my studies brain, I create children entries for every semester.
These semester entries are parents to the entries for every lecture
I’m attending. This is the pretty easy overall structure in my studies
brain. The next hierarchy varies a bit depending on the lecture.

Basically I like two approaches of structuring my notes: by date of
the class and by topic. Org-brains linking capacities enable the
hybrid approach of structuring the notes.

At the beginning of the semester, I create an “dates” entry. This will
be filled with children for all days I went to class. I don’t write a
lot of notes in these entries. But at the end of the day, I’m adding
the day as parent to the topics of the day. That allows me to easily
see all topics, discussed on a specific date. As an example: Before
the next class, I only need a glimpse on the last class entry, to see
what was covered the last time.

For my notes on the topic, I try to mimic the professors lecture
structure in my brain. That means I create a child headline for every
presentation we receive. I attach the slides to the child headline and
start org-noter to annotate the attached file. It depends on the
topic, if we go through the whole topic in one class or if we need
multiple days. So it happens often, that the time and topic structure
drift apart.

I write most of my notes in the form of questions. Like I would
prepare flash cards. During class I ask my self: “The answers to which
important questions are available in the current slide?” Of course I
should be able to answer these questions later. If the professors add
information that is not available on the slide, I will of course write
that down with or without a good question.

After class I sometimes take the time to link the notes to similar
entries, like brain “friends” or “parents.” But even if I don’t do
this, I have notes that are nice to navigate in.

## Conclusion & Thanks

Org-brain helps me structure my notes during class in different ways
and link them together. Org-noter allows me to keep my notes in sync
with the slides. Everything works wonderful in Emacs and is kept in
plain-text. I’m not sure how long I will stick to this method (I
changed my note taking system nearly every semester), but for now I am
happy.

A big **thank you** to the maintainers of org-noter and org-brain!
They are very responsive and do a great job. Both helped to improve
the combination of org-brain and org-noter for example in the
following issues:

- [org-brain issue about org-noter integration][brain#154]
- [org-noter issue about `:ID:` property on new note entries][noter#62]
- [org-noter issue about annotating on attached files][noter#66]

[brain#154]: https://github.com/Kungsgeten/org-brain/issues/154
    "org-brain issue #154"

[noter#62]: https://github.com/weirdNox/org-noter/issues/62
    "org-noter issue #62"

[noter#66]: https://github.com/weirdNox/org-noter/issues/66
    "org-noter issue #66"

## Future Work

I can easily think on even more possible helpful tool combinations.

- [git-annex][] seems to be a great way to sync the notes, without
  having to transfer the attached presentations to a smartphone. On
  the smartphone, the notes could be browsed with Emacs in [Termux][].

- [org-drill][] might be a good combination to learn the questions
  asked in the notes. However, as I couldn’t get it to work yet, I
  will probably stick with [Anki][].

[git-annex]: https://git-annex.branchable.com/
    "git-annex is a distributed file synchronization system"

[termux]: https://termux.com/
    "Termux is an Android terminal emulator and Linux environment app"

[org-drill]: https://gitlab.com/phillord/org-drill/
    "org-drill: Org mode plugin, for 'flashcard' self-testing"

[anki]: https://apps.ankiweb.net/
    "Anki – powerful, intelligent flash cards"

