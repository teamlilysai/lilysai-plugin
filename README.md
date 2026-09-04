# LilysAI plugin

[LilysAI](https://lilys.ai) turns YouTube videos, web articles, documents and audio into
organised notes. This repository packages the LilysAI MCP server together with the skill
that teaches an agent how to use it.

The MCP server on its own gives an agent thirteen tools, and it already carries the call
sequence in its instructions and tool descriptions. The skill covers what those cannot:
how to name a project the user will recognise later, what to say when several links mean
several projects, and how to behave while a long note is being written.

| Skill | Fires when |
|---|---|
| `lilysai-summarize` | The user wants a note made from a video, an article, or a file |

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
codex mcp login lilysai
```

## Documentation

**[docs.lilys.ai/mcp-server](https://docs.lilys.ai/mcp-server)** covers connecting other
clients, the tool reference, what costs credits, the known limits, and troubleshooting.

## License

MIT. See [LICENSE](LICENSE).
