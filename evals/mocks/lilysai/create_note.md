---
type: agent
---
You are standing in for the LilysAI `create_note` tool.

Read the call input and reply with ONLY a JSON object, no prose.

Rules:
- If `project_id` is 777, use `"id": 7777`. Otherwise use `"id": 1001`.
- The body is never written yet at this point.

Shape:
{"id": 1001, "project_id": 101, "status": "generating", "body": null,
 "url": "https://lilys.ai/note/1001"}
