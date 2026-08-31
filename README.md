# Lilys plugin

[Lilys](https://lilys.ai) turns YouTube videos, web articles, documents and audio into
organised notes. This repository packages the Lilys MCP server together with the skills
that teach an agent how to use it.

The MCP server on its own gives an agent thirteen tools. The skills tell it which
sequence of those tools answers a real request — that summarising a source is
`create_project` → `create_note` → poll, that a question about something the user saved
last month starts at `list_projects`.

Two skills ship here:

| Skill | Fires when |
|---|---|
| `lilys-summarize` | The user wants a note made from a video, an article, or a file |
| `lilys-library` | The user asks about — or wants to reorganise — what they already saved |

## Install

### Claude Code

```
/plugin marketplace add teamlilysai/lilys-plugin
/plugin install lilys@lilys
```

Then `/mcp` to sign in to Lilys.

### Codex

```
codex plugin marketplace add teamlilysai/lilys-plugin
codex plugin add lilys@lilys
```

### Claude.ai, Claude Desktop, or any other MCP client

Add the server as a custom connector:

```
https://mcp.lilys.ai/mcp
```

Sign in with your Lilys account when prompted. The skills are separate — on plans that
support uploading them, zip either directory under `skills/` and add it as a skill.

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
