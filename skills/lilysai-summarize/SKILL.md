---
name: lilysai-summarize
description: Turns a YouTube video, web article, research paper, or local file (pdf,
  docx, pptx, ppt, hwp, hwpx, jpg, png, mp4, mov, webm, mp3, m4a, wav) into a LilysAI
  note. Triggers on
  "summarize this video", "read these three papers and write it up", "make a note from
  this PDF", "save this to my Lilys library", whether or not LilysAI is named.
license: MIT
---

# Summarize with LilysAI

## 1. Register the source

`create_project` starts the analysis that a note is later written from. It does not
produce a note.

One project holds one source. Three papers on one topic mean three calls and three
notes, so say that up front rather than promising a single write-up of all of them.

Give it a `name` the user would recognise a month from now. Left out, LilysAI names the
project after its source.

## 2. Ask for the note

`create_note` returns a note id right away; the body is not written yet. It takes the
project and nothing else. If the project came from the web and holds more than one
source, it will ask you to name the one you want in `sources`; `get_project` lists them.

## 3. Wait

Poll `get_note` until the body arrives. A long video takes several minutes, so say the job
is running rather than going quiet, and do not start it over.

## 4. Answer

Lead with what the note says: its argument, its numbers, the thing the user would have
highlighted themselves. Keep the mechanics out of it unless something went wrong.

Give them the note's `url`. If the body is long, give the substance and offer the rest.
