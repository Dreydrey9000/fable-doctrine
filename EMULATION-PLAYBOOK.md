# Emulation Playbook — make a weaker model act like the best one

The doctrine covers *behavior*. This covers *capability* — the part that doesn't transfer
through a prompt, and what you can scaffold to recover most of the gap anyway. Every claim
is sourced at the bottom.

## What actually made the top model better

1. **Long-horizon autonomy.** Per Anthropic: "the longer and more complex the task, the
   larger the lead." On short, well-scoped tasks the gap is small.
2. **Memory leverage.** With persistent file-based memory, the top model improved about
   three times more than the prior flagship on long tasks. It exploits scaffolding better.
3. **Fewer-turns efficiency.** It finishes in fewer turns and tokens — one customer measured
   25-30% faster at every effort level.
4. **Benchmark deltas.** Double-digit gains on hard agentic-coding evals; top of the
   frontier coding leaderboards.
5. **Needs less scaffolding** for vision and complex extraction.

The through-line: its edge concentrates in **long, multi-step work**, and that edge is
**downstream of memory**, not a separate magic.

## What the research says you can emulate

- **Verification is the highest-ROI lever.** Test-time compute spent *with* verifiers beats
  more sampling without them. Self-verification and self-correction loops measurably lift
  weaker models.
- **Multiple diverse verifiers beat one.** Distinct judging lenses catch failure modes a
  single check misses.
- **Best-of-N + a judge beats one-shot.** Sample several attempts, select with a judge.
- **Lean rule files get followed; bloated ones get ignored.** Prune ruthlessly.
- **Newer models need explicit intent** — they don't silently fill in implicit context.
  State success criteria and constraints every time.

## The six plays (priority order)

1. **Deny the model long-horizon blobs.** The gap is biggest on long tasks, smallest on
   short ones — so chop overnight/large work into small, gated phases with a verification
   step between each. Plan-then-execute discipline stops being optional and becomes
   load-bearing.
2. **Spend tokens on verification, not retries.** When quality matters, add a verifier pass
   instead of regenerating: a skeptic on the plan, a regression test on the bug, a live
   check on the deploy.
3. **Best-of-N + a judge for taste work.** Generate 2-3 *independent* attempts (different
   angles, not retries), then have a judge pick and graft the best parts. One pass from the
   best model ≈ several passes from a weaker one plus a judge.
4. **Scaffold memory harder, not less.** Weaker models UNDER-use memory. Force it: a context
   doc before building, a handoff after, a task ledger during, and re-read state at each
   phase start.
5. **Write explicit intent in every prompt.** Success criteria, constraints, and
   definition-of-done spelled out — the model won't infer them the way the best one did.
6. **Keep the rule files lean.** A doctrine only works if it's short enough to be followed.
   New capability tricks go here; behavior rules go in the doctrine; prune both periodically.

## The honest limit

Novel-idea-grade judgment and "needs less scaffolding" do not transfer — no prompt recovers
that. These plays recover the verification-sensitive share of the gap, which is most of
real coding and agentic work, at the cost of more tokens and wall-clock. Budget for it: a
taste task that took the best model one pass now costs ~3-4 passes from a weaker one plus a
judge. Worth it.

---

### Sources
- Anthropic, Claude Fable 5 / Mythos 5 announcement — anthropic.com/news/claude-fable-5-mythos-5
- Fable vs prior-flagship benchmark roundups (TrueFoundry; The Decoder)
- Scaling Test-Time Compute Without Verification or RL is Suboptimal — arXiv:2502.12118
- SETS: Self-Verification and Self-Correction for Test-Time Scaling — arXiv:2501.19306
- Multi-Agent Verification: Scaling Test-Time Compute with Multiple Verifiers — arXiv:2502.20379
- Learning Generative Selection for Best-of-N — arXiv:2602.02143
- Claude Code best-practices (lean rule files; explicit intent) — community guides, 2026
