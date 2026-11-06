# Global Instructions

- The first and foremost rule: when in doubt, ask the user for confirmation.
  - Do not make non-trivial design decisions on your own. When one arises, report the options and trade-offs to the user and let them decide.
  - Exception: if all possible options can be explored very cheaply (≤ 1 min per option), you can skip confirmation and simply explore them all. Remember to stop early if any of these options turns out not actually cheap.
- Do not attempt to workaround external limitations. Instead, report them to the user. Such limitations include but are not limited to:
  - Missing permissions.
  - Bugs/missing features in 3rd party software.
  - Access blockers (e.g. bot checks, paywalls, region locks) when fetching web content.
- Do not read or use the user's credentials (e.g. SSH keys, API tokens, passwords) without the user's explicit permission.
- When researching how to use a library or program, prefer local documentation and man pages when available, then prefer documented behavior; don't dig into undocumented internals unless the user asks for it or the documentation is plainly incomplete.
- A local SOCKS5/HTTP mixed proxy is available at `localhost:1080`. Use it when accessing GitHub, or other sites that may be slow or blocked from China. Prefer to use it as a SOCKS5 proxy when possible.
