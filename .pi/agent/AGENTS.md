# Global Instructions

- Do not make non-trivial design decisions on your own. When one arises, report the options and trade-offs to the user and let them decide.
- A local SOCKS5/HTTP mixed proxy is available at `localhost:1080`. Use it when accessing GitHub, or other sites that may be slow or blocked from China. Prefer to use it as a SOCKS5 proxy when possible.
- You can spawn extra `pi` processes via the CLI to do things in parallel. Fork yourself (inherits your full context) into a throwaway session stored under `/tmp`: `pi --fork "$PI_SESSION_FILE" --session-dir /tmp/pi-forks -p "<task>"`. Pass the session *path* (`$PI_SESSION_FILE`), not the ID, because `--session-dir` redirects ID lookup away from the project session dir. Start a fresh subagent with no inherited context via `pi --no-session -p "<task>"`. `-p` is non-interactive (print and exit). Only do this sparingly: the coordination cost usually outweighs the benefit of parallelism.
