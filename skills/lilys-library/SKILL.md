---
name: lilys-library
description: Use when the user asks about material they already saved in Lilys, rather than something new — "what did I save about X", "find that video I summarized last month", "what are my notes on Y", "pull up my highlights from that paper", or asks to rename, move, or tidy their Lilys projects and folders. Covers searching the library, reading notes and transcripts back, and reorganising projects into collections.
license: MIT
---

# Work with the user's Lilys library

Everything the user has ever summarised lives here: **projects** (each a bundle of
sources), the **notes** written from them, the **transcripts** extracted from the
sources, and the **highlights** and **memos** they saved while reading.

## Finding something

Start with `list_projects` and narrow from there.

- `list_projects` — newest first. `query` matches project names, note titles and tags.
  `since` returns only what was added after a timestamp.
- `list_collections` — the folder tree, flat, each entry carrying its full path
  (`Research/AI/Agents`). Pass a collection id to `list_projects` to look inside one folder.
- `get_project` — one project's sources and its note ids.

## Reading it back

- `get_note` — a note body, as Markdown. This is usually what the user means.
- `get_transcript` — the raw extracted text of one source: video transcript, PDF text,
  web page text. Reach for it when the note leaves out a detail the user is asking about.
- `list_highlights` and `list_memos` — the passages the user marked and the notes they
  wrote themselves. These are the user's own words, so quote them rather than paraphrase.

Long bodies come back truncated with a link to the full text. Follow the link when the
answer might be in the part that was cut.

## Tidying up

- `save_project` — `rename`, `trash`, `restore`, or `add_sources` to fold new material
  into an existing project.
- `save_collection` — `create` a folder, `rename` it, `move_projects` into or out of it,
  or `trash` it.

Trashing a collection takes everything inside it along, and there is no `restore` command
for collections — the user has to undo that from the web trash. Ask before you call it.
