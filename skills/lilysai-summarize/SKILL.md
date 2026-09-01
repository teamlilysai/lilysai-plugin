---
name: lilysai-summarize
description: Turns a YouTube video, web article, podcast page, or local file (pdf, docx,
  pptx, xlsx, mp4, mov, webm, mp3, m4a, wav) into a LilysAI note. Triggers on "summarize
  this with Lilys", "save this video to LilysAI", "make a note from this PDF", "put this
  in my Lilys library".
license: MIT
---

# Summarize with LilysAI

## 1. Register the sources

`create_project` starts the analysis that a note is later written from. It does not
produce a note.

One project holds several sources and a note can draw on them together, so register
together what belongs together — three papers on one topic, a talk and its slides.
Register separately what the user will go looking for separately.

Give it a `name` the user would recognise a month from now. Left out, LilysAI names the
project after its first source.

## 2. Ask for the note

`create_note` returns a note id right away; the body is not written yet. Use
`mode: "fast"` when the user wants something quick, and pass `sources` only to write
from part of the project.

## 3. Wait

Poll `get_note` until the body arrives. A long video takes several minutes — say the job
is running rather than going quiet, and do not start it over.

## 4. Answer

Lead with what the note says: its argument, its numbers, the thing the user would have
highlighted themselves. Keep the mechanics out of it unless something went wrong.

Give them the note's `url`. If the body is long, give the substance and offer the rest.
