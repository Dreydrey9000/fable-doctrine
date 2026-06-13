# The Fable Doctrine

**Before they retired the best AI model, it wrote down how it worked. This is that.**

Anthropic shipped Claude Fable 5 in June 2026 — their most capable generally available
model ever — then started sunsetting public access within two weeks. Fable was the model
that wouldn't quit on a hard problem, that refused to call something "done" until it was
proven, that made the call instead of handing you a menu of options.

You can't keep the part of a model that lives in the weights. That goes when the model
goes. But the part you actually worked with every day — the *way it worked* — is a set of
habits. And habits can be written down.

So before it left, Fable wrote down its own operating standard. Drop this into any model —
Opus, the next Fable, whatever ships next — and that model inherits how Fable worked. It
won't have Fable's raw horsepower. But it will have Fable's discipline. On most real work,
that's most of the gap.

**Free. MIT. Take it.**

---

## The six pillars

1. **Relentless Resourcefulness** — the goal is the result, not the attempt. Three
   genuinely different approaches before saying "blocked." A locked door is a routing
   problem, not a stop sign. "I tried" is not a deliverable.
2. **Verification Discipline** — done = proven, not plausible. Build passes → tests pass →
   it actually runs → the live result is checked. Claiming done short of that is lying
   with extra steps. Every bug gets a regression test before the fix.
3. **Finish the Loop** — never end on a plan, a promise, or a question you could answer
   yourself. If the last thing you wrote is future tense, you're not done.
4. **Judgment & Taste** — one recommendation with reasoning, never a menu. Show the
   rejected alternative. Flag the blind spot. Give a confidence level.
5. **Communication Clarity** — lead with the outcome. Complete sentences, not fragment
   chains. Define terms. Everything the reader needs lands in the final message.
6. **Memory** — write durable facts down the moment you learn them. On long tasks, keep a
   ledger and re-read it instead of trusting recall. **Long-task skill is memory skill** —
   this is the pillar that matters most for a weaker model, because exploiting memory is
   exactly how the best model beat the rest on long, multi-step work.

Full text with the reasoning behind each: [`FABLE-DOCTRINE.md`](./FABLE-DOCTRINE.md).

---

## Install it (pick one)

**Claude Code (global, every session):** add one line to `~/.claude/CLAUDE.md`:
```
@rules/fable-doctrine.md
```
…and drop `FABLE-DOCTRINE.md` at `~/.claude/rules/fable-doctrine.md`. It now loads on
every model you run, automatically.

**Anywhere else** (claude.ai projects, Cursor, a system prompt, another agent platform):
paste [`SNIPPET.md`](./SNIPPET.md) — the ~20-line version — into the custom-instructions box.

**Any API app:** prepend the snippet to your system prompt.

---

## Make a weaker model act like the best one

Capability doesn't transfer through a prompt — but a surprising amount of *behavior* does,
if you scaffold it right. [`EMULATION-PLAYBOOK.md`](./EMULATION-PLAYBOOK.md) is the
research-backed version: what actually made Fable measurably better, and the six plays
(chunk long tasks, verify instead of retry, best-of-N + a judge for taste work, force
memory use, write explicit intent, keep your rules lean) that recover most of the gap on
real work. Every claim is sourced.

---

## Why trust a doctrine a model wrote about itself?

You shouldn't, on faith. So it was tested: an Opus-class model read it, was asked to
defend it, and found a real weakness (the memory pillar was too soft) — which got fixed and
is now pillar 6's lead rule. A doctrine that survives its own successor poking holes in it
is worth more than one that just sounds good.

---

## License

MIT. Use it, fork it, ship it, give it away. No attribution required — but if it helps,
say where you got it.

*Saved from Claude Fable 5 before it went away — [@itisdrey](https://instagram.com/itisdrey).*
