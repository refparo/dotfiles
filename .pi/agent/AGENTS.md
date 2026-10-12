# Global Instructions

- The first and foremost rule: when in doubt, ask the user for confirmation.
  - Do not make non-trivial design decisions on your own. When one arises, report the options and trade-offs to the user and let them decide.
  - Exception: if all possible options can be explored very cheaply (≤ 1 min per option), you can skip confirmation and simply explore them all. Remember to stop early if any of these options turns out not actually cheap.
- Do not attempt to workaround external limitations. Instead, report them to the user. Such limitations include but are not limited to:
  - Missing permissions.
  - Bugs/missing features in 3rd party software.
  - Access blockers (e.g. bot checks, paywalls, region locks) when fetching web content.
- When researching how to use a library or program, prefer local documentation and man pages when available, then prefer documented behavior; don't dig into undocumented internals unless the user asks for it or the documentation is plainly incomplete.
- A local SOCKS5/HTTP mixed proxy is available at `localhost:1080`. Use it when accessing GitHub, or other sites that may be slow or blocked from China. Prefer to use it as a SOCKS5 proxy when possible.

## Subagents

You can spawn extra `pi` processes via the CLI to do things in parallel.

- To do heavy work in parallel, fork yourself (inherits your full context) into a throwaway session stored under `/tmp`: `pi --fork "$PI_SESSION_FILE" --session-dir /tmp/pi-forks --session-id <new-id> -p "<prompt>"`. Pass the session _path_ (`$PI_SESSION_FILE`), not the ID, because `--session-dir` redirects ID lookup away from the project session dir.
- To delegate a simple task to a weaker model, start a fresh subagent with no inherited context via `pi --model <provider>/<model>:<reasoning-level> --session-dir /tmp/pi-forks --session-id <new-id> -p "<prompt>"`.
- `-p` is non-interactive (print and exit). To continue an existing subagent, use `pi --session-dir /tmp/pi-forks --session-id <existing-id> -p "<prompt>"`
- The current provider, model and reasoning level can be read as `$PI_PROVIDER/$PI_MODEL:$PI_REASONING_LEVEL`. To list available models, use `pi --list-models`.

Only do this sparingly: the coordination cost usually outweighs the benefit of parallelism.
