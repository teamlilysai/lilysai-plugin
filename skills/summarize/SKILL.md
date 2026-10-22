---
name: summarize
description: Turns a YouTube video, web article, research paper, or local file (pdf,
  docx, pptx, ppt, hwp, hwpx, jpg, png, mp4, mov, webm, mp3, m4a, wav) into a Readray
  report. Triggers on
  "summarize this video", "read these three papers and write it up", "make a note from
  this PDF", "save this to my Readray library", "save this to my Lilys library", whether or not Readray (formerly LilysAI) is named.
license: MIT
---

# Summarize with Readray

In Readray a **source** (`project` in the tools) holds up to 10 originals, each a link or a
file, and the **reports** (`note`) written from them.

## 1. Start the report

One `create_note` call saves the originals and starts the report. Pass
`project: { sources: [...] }`: YouTube or web URLs as they are, local files as the ticket
from `prepare_upload`. A URL that points straight at a file (`.pdf`, `.docx`, …) is
rejected, so upload it instead.

- Several links the user wants read together go in **one** call, as one source.
- `note.report` picks the kind: `deep` (default) reads one original closely, `key` combines
  every original into one report. Three papers to compare → `key`.
- Give `project.name` something the user would recognise a month from now. Left out,
  Readray names it after the first original. For an upload, pass the real filename.
- Leave `model` out unless the user asked for a particular model.

To write another report over a source that already exists, pass its number as `project`
instead; nothing is registered or charged again.

## 2. Wait

`create_note` answers at once with the project and note numbers; the body is not written
yet. Poll `get_note` until it arrives. A long video takes several minutes, so say the job
is running rather than going quiet.

Never call `create_note` again with the same links to check on it. That registers them, and
charges, a second time. If a call timed out, look for the source with `list_projects`
first.

## 3. Answer

Lead with what the report says: its argument, its numbers, the thing the user would have
highlighted themselves. Keep the mechanics out of it unless something went wrong.

Give them the report's `url`. If the body is long, give the substance and offer the rest.

## When it is refused

- `insufficient_credit`: not enough credits. Tell the user; they can top up, or retry with
  `model: "free"`.
- `upgrade_required`: their plan can't do this (a paid model, or a video over 3 hours on the
  free plan). Tell the user rather than retrying.
