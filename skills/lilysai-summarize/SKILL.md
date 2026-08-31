---
name: lilysai-summarize
description: Use when the user wants a LilysAI note made from something — a YouTube video, a web article or podcast page, or a local file (pdf, docx, pptx, xlsx, mp4, mov, webm, mp3, m4a, wav). Triggers on "summarize this with Lilys", "save this video to LilysAI", "make a note from this PDF", "put this in my Lilys library". Covers registering sources, uploading files, generating the note, and waiting for it to finish.
license: MIT
---

# Summarize a source with LilysAI

LilysAI stores work in three layers: a **project** bundles the **sources** you register,
and **notes** are the report bodies generated from that project. Making a note is
therefore three calls, in order, not one.

## 1. Turn what the user gave you into sources

| The user gives you | Source to use |
|---|---|
| A YouTube url | `{"type": "url", "url": "…"}` |
| A web page url — article, blog post, podcast episode page | `{"type": "url", "url": "…"}` |
| A local file | Upload it first, then `{"type": "upload", "upload_id": "…"}` |
| A url that points straight at a file (`.pdf`, `.docx`, …) | Download it, then upload it as a local file |

To upload a local file:

1. `prepare_upload` with the filename — returns a `url` and an `upload_id`.
2. HTTP `PUT` the raw bytes to that `url` exactly as given. No auth header, no extra query params.
3. Use the `upload_id` verbatim as the source. Not the url, not an S3 key.

One project can hold several sources. When the user hands you a batch that belongs
together — three papers on one topic, a talk plus its slides — register them into a
single project so one note can draw on all of them.

## 2. Register the sources

`create_project(sources, name?)` returns the new project id and one source id per source.
Give the project a `name` the user would recognise; skip it and LilysAI names it after the
first source.

This does not produce a note. It starts the analysis that a note is later written from.

## 3. Ask for the note

`create_note(project, mode?)` returns a note id immediately — the body is not written yet.

- `mode: "deep"` is the default: the full report.
- `mode: "fast"` when the user asks for something quick or short.
- Pass `sources` only to write a note from part of the project. Omit it to use all of them.

## 4. Wait for it

Call `get_note(note)`. While the body is still being written it comes back with
`status="generating"` and a `poll_interval_seconds`. Wait that long, then call again.
Keep going until the status changes — this is the normal path, not an error, and a long
video can take a few minutes.

If the sources themselves are still being processed, `get_project` shows each source's
`status`, and `get_transcript` on one source is the finer-grained poll.

## 5. Answer

Lead with what the note actually says — the user asked to understand the source, not to
watch a pipeline run. Give them the note's title and the substance of it, then offer the
full body if it is long.
