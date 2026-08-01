# Global learnings

## Git: inspect reflog before destructive ref operations

Before any `git update-ref`, `git reset --hard`, `git branch -f`, or `git filter-branch` on `master`/`main` or any long-lived ref, run `git reflog show <ref>` first and verify what content the move would orphan. Reconcile every commit on the ref against the destination — by SHA AND by message — not just by SHA.

When auditing whether a ref contains certain content (e.g. "does master have Claude trailers?"), check both `master` and `origin/master`. They can diverge significantly when local work hasn't been pushed. Querying only one gives false confidence.

**Concrete rules:**
- Before any destructive ref op on a shared/long-lived ref: `git reflog show <ref>` and scan the last ~10 entries.
- When the move would lose commits, list each with `git log <lost-sha>..<keep-sha>` and confirm with the user before executing.
- For audits ("is X in this branch's history?"): grep both the local ref and the remote-tracking ref, label outputs clearly.
- Prefer `--force-with-lease` over `--force` for any push to a shared ref.
- Reflog entries persist ~90 days by default — recovery is usually possible, but don't rely on that as license to move fast.

@~/.claude/CLAUDE.local.md
