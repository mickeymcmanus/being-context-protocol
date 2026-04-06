# Being Context Protocol — Overview

**A new open standard for the age of ambient intelligence**

---

## The Problem We're Solving

Every AI model, smart device, and agentic service that surrounds you makes decisions about how to interact with you. They decide when to interrupt you, what to show you, how urgent to make things feel, and how to compete for your attention.

They all make these decisions **with zero real information about your cognitive state.**

Your calendar doesn't know your decision-making reserves are depleted from a morning of back-to-back meetings. Your notification system doesn't know you've just entered flow. Your AI assistant doesn't know you're burned out and need silence, not suggestions. Your smart home doesn't know you're trying to incubate a half-formed idea that needs low-demand distraction, not high-demand task completion.

So they default to their own optimization metric — engagement, responsiveness, completion rates — which is often the opposite of what your cognitive health requires.

**This is the attention economy's deepest structural problem.** Not that devices are loud. But that they are *contextless.* They are optimizing for their own objectives in the absence of information about the being they claim to serve.

The Being Context Protocol is the fix.

---

## What BCP Is

BCP is an open standard for **broadcasting a being's cognitive state to the agentic environments, devices, and services that surround them.**

A BCP payload is a structured JSON document with four layers:

**Identity** — who this being is. Their cognitive archetype (Explorer, Deep Diver, Collaborator). Their personal calibrations — which activities are depleting for *them specifically*, not the population average. Their Ulysses constraints: pre-committed rules written when rational, enforced when depleted. Their cognitive map: known regenerative and depletive nodes.

**Current State** — where this being is right now. Their cognitive reserves across the Cognition Facts taxonomy (decision-making, ethics, attention, intuition, memory). Their physiological signals from whatever sensors are available. Their position in the daily arc. All TTL-limited — this expires; agents must re-subscribe.

**Intention** — what this being is navigating toward. Not just current state but the direction of travel. The compass, not the thermometer. Which reserves to protect during this window. Which capacities to build over the longer arc.

**Enlistment** — who and what has been recruited to serve this intention. Circle (the people who care about you). Places (the smart environments that can reconfigure). Things (the devices, AI agents, calendars, and services that adjust their behavior).

---

## The Relationship to MCP

Anthropic's [Model Context Protocol](https://modelcontextprotocol.io) is the standard for giving AI models context about the tools and data they can use. MCP solved a real problem: AI models were isolated from external systems, making them less useful.

BCP is the complement on the human side. If MCP is *what AI models can access*, BCP is *who AI models are serving*.

| Protocol | Question it answers |
|----------|-------------------|
| MCP | What tools and data does this AI model have access to? |
| BCP | What cognitive state is this human (or being) currently in? |

Together they close the loop. An AI with MCP knows what it can do. An AI with BCP knows *when to do it, whether to do it at all, and how to do it in a way that serves rather than depletes the person it's working with.*

A meeting-scheduling AI with access to a BCP payload doesn't just find an open slot — it finds a slot when your decision-making reserves are likely to be adequate for that type of meeting. A writing assistant with BCP doesn't interrupt incubation mode to suggest edits. A smart home with BCP dims the lights before you ask.

---

## The Scientific Foundation

BCP is grounded in two decades of cognitive science, not product design intuition.

**Cognitive capacity is finite and domain-specific.** The Tamir/McManus Cognition Facts framework (2019) maps daily cognitive reserves across dimensions: decision-making (35% of daily capacity), ethics (20%), attention (60% of the total), intuition, and memory. Each is depleted differently by different activities. Each recovers at different rates. A simple "stress score" misses all of this nuance.

**Decision fatigue is real and has measurable consequences.** Danziger, Levav and Avnaim-Pesso (2011) showed that judges granting parole made favorable decisions 65% of the time at the start of the day, declining to near 0% by late morning — then recovering sharply after breaks. The cause isn't cruelty. It's depletion of the exact cognitive reserve that BCP tracks.

**Ethics can be depleted.** This is the most unsettling finding in the cognitive governance literature. Sustained cognitive load degrades moral reasoning. "You can burn out someone's ethics with a deck of cards in about 10 minutes" (McManus, 2019). When ethics reserves fall below 25%, BCP fires the Ethics Firewall Ulysses constraint.

**Half of cognition is outside the skin.** Herbert Simon's scissors: cognition is co-determined by the mind and its environment. This is the core insight behind the entire protocol. If you can reshape your environment to match your cognitive state — and pre-commit to that reshaping in advance — you are doing cognitive governance. You are not just managing your energy; you are designing the system.

**The environment shapes 70% of decisions.** System 1 thinking is context-driven. BCP-enabled environments mean the context defaults to your interests rather than competing interests.

---

## The Ulysses Protocol

One of BCP's most distinctive features is pre-committed constraints.

Odysseus knew that when he heard the Sirens, he would want to jump overboard. He couldn't trust his future depleted self to make good decisions. So he bound himself to the mast *before* he was in range of the Sirens, when he was still rational.

Ulysses Rules in BCP work the same way. You write them when you're at full capacity. They enforce automatically when you're not.

The canonical example: many people, when cognitively depleted on the commute home, make food choices they later regret. Not because they're bad people — because their decision-making reserves are at 15% after a full day. A Ulysses Rule can instruct an autonomous vehicle to route home via the park, avoiding registered fast food locations, whenever juice drops below 30%. No willpower required. The rational version of you already handled it.

Other Ulysses Rules: block social media during deep work (screen time), require confirmation before major decisions when decision-making is depleted, notify your partner when you're in critical depletion so they know not to start big conversations, auto-schedule a 20-minute nap when overall juice hits 20%.

These aren't just notification-blocking. They are a person's **cognitive sovereignty** embedded in code — the rational self governing the depleted self, using the same tools the attention economy uses, pointed in the opposite direction.

---

## The Cognition Facts Label

BCP's reserve taxonomy is modelled directly on the FDA Nutrition Facts label.

The FDA label gave people the ability to see what food actually costs their body, in standardized terms, enabling better decisions. The Cognition Facts label does the same for cognitive activities.

A meeting costs:
- 1.0× attention
- 0.6× decision-making
- 0.4× ethics
- 0.5× rationality

A 20-minute nap *restores*:
- 0.8× attention
- 1.2× decision-making
- 0.6× ethics

A product that generates revenue by maximizing engagement is doing so by spending its users' cognitive reserves. With enough BCP data, it becomes possible to build the equivalent of caloric science for cognition — a **Cognition FDA** that measures the true cognitive cost of products and environments, and creates incentives (and eventually regulations) to protect rather than strip-mine human cognitive capacity.

This is the long-horizon mission behind BCP. It starts as a personal productivity protocol. It ends as infrastructure for cognitive public health.

---

## Being-Agnostic Design

BCP was designed from the start to describe *any cognizing being* — not just humans.

This follows directly from Michael Levin and Josh Bongard's research on morphological intelligence. The space of cognizing entities is much larger than humans: it includes animals with distributed nervous systems, autonomous robots, cyborgs, and emergent swarm intelligences. The question of "who has cognitive state that matters to the agents serving them?" is far from settled.

BCP's `reserves` schema is an open key-value map. Human payloads populate `decisionMaking`, `ethics`, `totalAttention`. An autonomous vehicle populates `batteryCharge`, `sensorConfidence`, `routePlanningLoad`. A dolphin research platform might populate `podCoherence`, `huntingReadiness`, `sonarCapacity`. A robot soccer swarm might track `swarmCoherence`, `fieldCoverage`, `collectiveEnergyReserve`.

The `beingDescriptor` block provides morphological coordinates along three axes — substrate (organic/cybernetic/inorganic), design origin (evolved/designed), and organization level (individual/swarm/hive/emergent) — making it possible to interpret reserve vocabularies correctly across radically different being types.

This is not a cosmetic generalization. It means BCP can serve as infrastructure for multi-species and human-robot hybrid environments — the kind of environments that are already emerging in manufacturing, healthcare, and research settings. It means BCP payloads can flow across the entire spectrum of agents in a space, not just the human ones.

---

## The Civic Dimension

When you broadcast your cognitive state, you are doing something more than optimizing your own performance.

You are making yourself **legible** to every agent in your environment. Your collaborator's AI knows not to send you an urgent request when your decision-making reserve is at 18%. Your smart building knows to adjust not just for your preference but for your capacity. Your autonomous vehicle knows to take the restorative route.

Multiply this across a city. Across an organization. Across a population.

Organizations that can see the cognitive load their meeting culture imposes could redesign it. Cities that could measure the depletion their transit systems cause could redesign them. Employers that could see the chronic erosion in their workforce's ethics reserves might treat the cause rather than just the symptoms.

The `historySignal` block in a BCP payload — opt-in, anonymized, aggregate — is the sensor layer for this. It tracks weekly capacity trends, flow state frequency, and average end-of-day reserve levels. The chronic depletion pattern that precedes burnout shows up months before the individual can see it. Population-level patterns in ethics erosion would be visible at organizational scale.

BCP is designed to make all of this legible without making any individual legible against their will. Agents subscribe. You control the payload. TTL limits persistence. The protocol is built around sovereignty, not surveillance.

---

## Implementation Path

**For individuals:** Which Watch, the Apple Watch reference implementation, makes BCP personal and immediate. Set an intention on your watch. Your smart home responds. Your circle sees your status. Your AI assistant adjusts its mode.

**For developers:** The TypeScript types (`bcp-types.ts`) and JSON Schema (`bcp-schema.json`) provide everything needed to build a BCP client in any language. A BCP client reads a payload, respects the TTL, and responds to the intention and reserve levels. It does not modify the payload.

**For AI systems:** An AI assistant with BCP integration checks the payload before acting. If `decisionMaking < 20`, it defers non-urgent suggestions. If intention mode is `Incubation`, it silences itself. If a Ulysses constraint matches, it follows the `agentInstruction` string. No special framework needed — just reading and respecting a JSON object.

**For smart environments:** Home automation, building management, and vehicle systems read the `enlistment.places.capabilities` block and execute the highest tier they support. A basic Hue system acts on light temperature. A full robotic environment acts on the `cognitiveProtocol` string.

**For researchers:** The `historySignal` block, with explicit user consent, feeds anonymized cognitive epidemiology data. The aggregate patterns — which activities deplete which reserves, which environments accelerate or slow recovery, how flow state frequency correlates with reserve levels — form the evidentiary basis for the Cognition FDA.

---

## Relationship to the Attention Economy

The attention economy is not evil. It is a structural incentive problem. Products are rewarded for engagement, not cognitive health. The result is an environment that systematically depletes the people inside it, in proportion to how successfully it optimizes for its own metrics.

BCP doesn't require the attention economy to become ethical. It gives every agent in a person's environment the information needed to serve that person rather than extract from them — and it makes the extraction legible for the first time.

When a product can be measured on what it costs its users cognitively, and when users can see those costs as clearly as they see nutritional information on food packaging, the incentive structure changes.

BCP is infrastructure for that measurement. It is the counter-protocol to the attention economy — built on the same technical substrate (JSON, HTTP, event subscriptions), pointing in the opposite direction.

---

## Quick Reference

```
BCP/1.0 Payload Structure

identity          → who this being is (stable, updated rarely)
  ownerHash       → anonymized ID
  cognitiveArchetype → learned cognitive style
  beingDescriptor → Levin/Bongard morphological coordinates
  activityCalibrations → personal (not average) activity cost profiles
  ulyssesConstraints → pre-committed rules for depleted states
  cognitiveMap    → known regenerative / depletive / avoidance nodes

currentState      → where this being is right now (TTL-limited)
  reserves        → Cognition Facts reserve levels (0–100 each)
  physiological   → sensor-derived signals (HRV, motion, eye tracking)
  dailyArc        → position in the cognitive day; hours until critical

intention         → what this being is navigating toward
  mode            → Level 1 (Explore/Ship), Level 2 (8 modes), Level 3 (sub-modes)
  protectedReserves → don't spend these in this window
  buildingReserves → try to grow these over the longer arc
  mindsetTarget   → the cognitive capacity being trained

enlistment        → who is recruited to serve this intention
  circle          → people (family, friends, collaborators, caregivers)
  places          → smart environments (4 tiers: basic → robotic → vehicle)
  things          → devices, AI agents, calendars, apps
```

---

## Project Information

**Authors:** Mickey McManus (T-1 Ventures / Autodesk Research) and Neta Tamir (Cornell University)

**Origin:** Autodesk University 2019, "Cognitive Governance: Could we build a parametric model of cognitive capacity/load, and use regenerative design to build more?" Extended through the Which Watch project, 2024–2025.

**License:** MIT. Open standard.

**Repository:** https://github.com/whichwatch/bcp *(conceptual — fork and build)*

**Related work:**
- Anthropic Model Context Protocol: https://modelcontextprotocol.io
- Tamir & McManus, "Cognitive Governance" (Forbes / Aspenia / AU2019)
- Danziger, Levav & Avnaim-Pesso (2011), "Extraneous factors in judicial decisions"
- Kahneman (2011), *Thinking, Fast and Slow*
- Newport (2016), *Deep Work*
- Levin & Bongard, morphological intelligence research
- Kellert & Wilson, biophilic design science
- Kaplan, Attention Restoration Theory
