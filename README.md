# LilysAI plugin

[LilysAI](https://lilys.ai) turns YouTube videos, web articles, documents and audio into
organised notes. This repository packages the LilysAI MCP server together with the skill
that teaches an agent how to use it.

The MCP server on its own gives an agent thirteen tools. The skill tells it which
sequence of those tools answers a real request — that summarising a source is
`create_project` → `create_note` → poll `get_note`, three calls in that order, and that a
slow note is waited on rather than asked for again.

One skill ships here:

| Skill | Fires when |
|---|---|
| `lilysai-summarize` | The user wants a note made from a video, an article, or a file |

Reading the library back — finding a project, pulling up a note or a transcript,
reorganising folders — takes no skill: the tool descriptions carry it.

## Install

### Claude Code

```
/plugin marketplace add teamlilysai/lilysai-plugin
/plugin install lilysai@lilysai
```

Then `/mcp` to sign in to LilysAI.

### Codex

```
codex plugin marketplace add teamlilysai/lilysai-plugin
codex plugin add lilysai@lilysai
codex mcp add lilysai --url https://mcp.lilys.ai/mcp
codex mcp login lilysai
```

Codex installs the skill from the plugin but does not read `.mcp.json`, so the server is
added separately with the third command.

### Claude.ai, Claude Desktop, or any other MCP client

Add the server as a custom connector:

```
https://mcp.lilys.ai/mcp
```

Sign in with your LilysAI account when prompted. The skill is separate — on plans that
support uploading them, zip `skills/lilysai-summarize` and add it as a skill.

### Read-only

`https://mcp.lilys.ai/mcp/readonly` serves the same server with the five writing tools
removed, so it can search and read your library but cannot create, modify or trash
anything. Point a client at it instead when that is what you want.

## Tools

Reading: `list_projects`, `list_collections`, `list_highlights`, `list_memos`,
`get_project`, `get_note`, `get_transcript`, `get_account`.

Writing: `prepare_upload`, `create_project`, `create_note`, `save_project`,
`save_collection`.

Every tool is scoped to the account you signed in with.

## License

MIT — see [LICENSE](LICENSE).
