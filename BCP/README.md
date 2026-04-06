# Being Context Protocol (BCP)

**Version 1.0 — Open Standard**

> *"Half of our cognition is outside us — out in the world. 70% of our decisions each day are made by System 1. We are shaped by our environment. So designing your environment IS designing your cognition."*
> — McManus & Tamir, Autodesk University 2019

---

## What is BCP?

The **Being Context Protocol** is an open standard for broadcasting a being's cognitive state to the agentic environments, devices, and services that surround them.

It is the human-side complement to Anthropic's [Model Context Protocol (MCP)](https://modelcontextprotocol.io). MCP gives AI models context about the tools and data they can use. BCP gives agentic environments context about **the being they are serving**.

Without BCP, every device, AI agent, smart environment, and service makes assumptions about you with zero real information about your current cognitive state. Your calendar books a meeting during your decision-making dead zone. Your smart speaker interrupts flow state. Your car routes you past a drive-thru when your willpower reserves are depleted. Your AI assistant launches into ideation mode when you're burned out and need silence.

BCP inverts this. **Your cognitive state becomes the authoritative context that all agents read before acting.** You own it. You broadcast it. Agents subscribe and respond. They cannot modify it.

---

## The Core Insight

The attention economy treats humans as raw material — as resources to be mined for engagement. BCP treats cognitive capacity as a **protected resource** to be governed, grown, and defended.

This is grounded in two decades of cognitive science:

- **Cognitive capacity hasn't changed in 50,000 years**, but the demands on it have grown exponentially (Tamir & McManus, 2019)
- **Decision fatigue is real and measurable** — judges making parole decisions are significantly harsher right before breaks (Danziger, Levav & Avnaim-Pesso, 2011)
- **Ethics can be depleted** — moral reasoning degrades under sustained cognitive load (Kahneman & Tversky)
- **The environment shapes 70% of decisions** — Herbert Simon's scissors: cognition is co-determined by the mind and its environment
- **Capacity can be built**, not just spent — neuroplasticity means the "tank" can grow (Tamir & McManus, "The Miyagi Movement")

BCP makes these dynamics visible, governable, and enrollable.

---

## How It Works

### The Payload

A BCP payload is a JSON document with four layers:

```
BCPPayload {
  identity      // who this being is — stable profile, calibrations, constraints
  currentState  // live snapshot — reserves, physiological signals, daily arc
  intention     // what this being is navigating toward — the compass direction
  enlistment    // who and what has been recruited to serve this intention
}
```

Each layer has a different update frequency and a different audience:

| Layer | Updates | Audience |
|-------|---------|----------|
| `identity` | Weekly / on calibration | Persistent agents, close circle |
| `currentState` | Every 30–60 seconds (TTL-limited) | All enlisted receivers |
| `intention` | When set by the being | All enlisted receivers |
| `enlistment` | When enlisted | Each enrolled receiver |

### The Flow

```
Being sets intention via Which Watch
    ↓
BCP payload generated (identity + currentState + intention + enlistment)
    ↓
Payload broadcast to enlisted receivers:
    Circle  → people see your status, calibrate their requests
    Places  → smart environments reconfigure (light, sound, DND)
    Things  → devices, AI agents, calendars, apps adjust behavior
    ↓
Agents read payload TTL — re-subscribe when expired
    ↓
Being's capacity protected, not competed against
```

### Agents Subscribe, They Cannot Modify

This is the critical privacy and sovereignty principle. A BCP client can **read** a being's payload and **respond** to it. It cannot alter the payload, cannot claim to represent the being, and cannot persist the data beyond the TTL without explicit consent.

---

## The Cognition Facts Taxonomy

The `currentState.reserves` object uses a scientifically grounded reserve taxonomy developed by Neta Tamir (Cornell University) and Mickey McManus (Autodesk Research / T-1 Ventures), first presented at Autodesk University 2019:

```
Total Attention    60% of daily cognitive reserves
  ├── Comprehension      5%   reading, parsing, understanding
  ├── Rationality       15%   logical reasoning, analysis  
  ├── Analytics          5%   data processing, pattern recognition
  └── Decision-Making   35%   ← THE critical reserve; depletes fastest

Ethics             20% of daily cognitive reserves  
  ├── Belief             5%   values alignment, integrity
  └── Reflection        15%   metacognition, self-awareness

Intuition          10%   pattern recognition, gut feel
Memory              5%   working memory, recall

⚠ SLIPPERY SLOPE ALERT: Prolonged depletion reduces capacity for future recovery
```

This maps directly to the FDA Nutrition Facts label model — the **Cognition Facts Label** — providing a standardized way to see what any activity or environment costs across different cognitive dimensions.

---

## Being-Agnostic Design

BCP is designed to describe **any cognizing being** — not just humans.

Inspired by Michael Levin and Josh Bongard's research on morphological intelligence, the BCP `identity` includes a `BeingDescriptor` with three Levin/Bongard axes:

- **Substrate**: `organicFraction` / `cyberneticFraction` / `inorganicFraction` (0–1)
- **Origin**: `evolvedFraction` / `designedFraction` (0–1)  
- **Organization**: `cellular` / `individual` / `swarm` / `hive` / `emergent`

This allows BCP payloads from:
- A human (organic: 1.0, evolved: 1.0, individual)
- A dolphin or raven (organic: 1.0, evolved: 1.0, individual — different reserve vocabulary)
- An autonomous vehicle (inorganic: 1.0, designed: 1.0, individual — battery/sensor reserves)
- A robot soccer team (mixed, designed, swarm — emergent collective intention)
- A cyborg (organic: 0.7, cybernetic: 0.3 — hybrid reserve model)

The `reserves` schema uses an **open key-value map** at its core. Human BCP payloads populate `decisionMaking`, `ethics`, `attention`. Robot payloads populate `batteryCharge`, `sensorConfidence`. Domain-specific vocabularies are registered by the community — exactly as MCP tool schemas are registered.

---

## The Ulysses Protocol

One of BCP's most powerful features is pre-committed constraints — **Ulysses Rules**.

Named after Odysseus binding himself to the mast before hearing the Sirens: constraints written when you are rational, enforced automatically when you are depleted.

```json
{
  "name": "Decision Fatigue Stop",
  "trigger": { "decisionMakingBelow": 20 },
  "action": {
    "type": "requireConfirm",
    "confirmationPrompt": "Your decision-making reserve is critically low. This may not be the right time.",
    "agentInstruction": "Owner's decision capacity depleted — postpone non-urgent decisions"
  }
}
```

When a Ulysses Rule fires, enrolled agents receive the `agentInstruction` string and respond accordingly — the calendar blocks new meetings, the AI assistant defers, the autonomous vehicle avoids registered temptation nodes. No willpower required.

---

## Enlistment: Circle, Places, Things

When you set an intention, you enlist receivers across three domains:

**Circle** — people in your life (family, friends, collaborators, caregivers, mentors). They see your status at the visibility level you choose: `statusOnly`, `withDuration`, or `full`. Not "team" — anyone who cares about your cognitive state.

**Places** — smart environments that reconfigure for your intention. Four capability tiers:
1. **Basic smart** (Hue, Nest, smart speaker) — light temperature, sound, DND
2. **Advanced smart** (motorized blinds, smart glass) — spatial configuration, natural light exposure
3. **Robotic/agentic** (full environment agent) — high-level intent; the place decides how
4. **Vehicle routing** (autonomous car) — Ulysses routing, avoidance nodes, scenic/restorative paths

**Things** — devices, AI agents, calendars, apps, services. Notification policy, Focus mode, calendar blocking, AI assistant mode, social media policy.

---

## The Intention Taxonomy

BCP intentions are organized in three levels — designed for progressive disclosure:

**Level 1 — The Yin/Yang** (first-time or depleted):
- `Explore` — wide aperture, curiosity-led, incubation
- `Ship` — execution-focused, closing loops, delivering

**Level 2 — The Full Wheel** (8 modes):
`Curiosity` · `Creativity` · `Growth` · `Flow` · `Reflection` · `Collaboration` · `Inspiration` · `Productivity`

**Level 3 — Sub-modes** (drilled into from Level 2):
- Creativity → `Exploration` · `Incubation` · `Interdisciplinary` · `Deconstruct`
- Growth → `Skill Hone` · `Self Improvement` · `Resilience`
- Collaboration → `Diverge` · `Converge` · `Reconnect`

**Recovery axis** (accessible via Ulysses rules or manual selection):
`Active Recovery` · `Deep Recovery` · `Biophilic Recovery`

Each intention mode specifies which reserves it **protects** (don't spend these) and which it **builds** (try to grow these) — connecting intention-setting to the longer arc of cognitive capacity development.

---

## Sensing Architecture

BCP is sensor-agnostic. The `physiological` signals block accepts whatever sensors are available. Reference implementations include:

| Sensor | Signals | Reserves Informed |
|--------|---------|-------------------|
| Apple Watch (HRV) | HRV RMSSD vs. personal baseline | All reserves (composite) |
| Apple Watch (motion) | Wrist stillness | Attention, Focus |
| AirPods Pro (IMU) | Head motion complexity/entropy | Attention wandering |
| AirPods Pro 2 (temp) | Skin temperature elevation | Stress / load |
| Mac camera (Vision) | Pupil dilation, blink rate, saccade velocity, fixation duration | Decision-making, Comprehension, Analytics |
| Vision Pro (eye tracking) | Gaze dwell, vergence, attention anchoring | Spatial BCP integration |

**Privacy principle**: Compute on-device, transmit only derivatives. No raw frames, no biometric data. The `physiological` block carries numbers (pupilDiameterRatio: 0.73), never pixels or facial geometry.

---

## Implementation

### Minimal Viable Payload

```json
{
  "version": "BCP/1.0",
  "identity": {
    "ownerHash": "sha256:a3f...",
    "cognitiveArchetype": "Explorer"
  },
  "currentState": {
    "timestamp": "2025-04-05T09:15:00Z",
    "ttlSeconds": 300,
    "reserves": {
      "operationalCapacity": 78,
      "extended": {
        "decisionMaking": 72,
        "ethics": 85,
        "totalAttention": 68,
        "intuition": 80,
        "memory": 74
      }
    }
  },
  "intention": {
    "mode": "Creativity",
    "subMode": "Incubation",
    "durationMinutes": 45,
    "expiresAt": "2025-04-05T10:00:00Z",
    "protectedReserves": ["decisionMaking", "ethics"],
    "buildingReserves": ["intuition", "rationality"]
  },
  "enlistment": {
    "circle": { "active": true, "visibilityLevel": "statusOnly" },
    "places": { "active": true },
    "things": { "active": true, "notificationPolicy": "blockUrgentOnly" }
  }
}
```

### Reference Implementations

- **Swift / watchOS**: `BCPSchema.swift` — full type-safe implementation for Apple Watch
- **TypeScript**: `bcp-schema.ts` — browser and Node.js compatible
- **JSON Schema**: `bcp-schema.json` — for validation and code generation

See the `/implementations` directory.

---

## Design Principles

1. **You own your payload.** BCP data lives on your device. Agents receive a read-only TTL-limited broadcast. Nothing is stored on external servers without explicit consent.

2. **Agents subscribe; they cannot modify.** A BCP client responds to your state — it cannot alter it, impersonate you, or persist beyond TTL.

3. **Personal calibration over population averages.** Reading depletes Neta, regenerates Mickey. The same activity has opposite effects on different people. BCP's `activityCalibrations` stores *your* personal response profile, not a generic one.

4. **Compass not thermometer.** BCP doesn't just measure where you are — it navigates toward where you're going. The `intention` layer is as important as the `currentState` layer.

5. **Being-agnostic by design.** The reserve schema is an open key-value map. Human, robot, dolphin, swarm — any cognizing being can implement BCP with a domain-appropriate vocabulary.

6. **Build capacity, don't just monitor depletion.** The `mindsetTarget` and `buildingReserves` fields orient BCP toward the Miyagi Movement principle: use cognitive governance to grow the tank, not just manage what's left in it.

---

## The Civic Dimension

Setting and broadcasting your intention is not just a personal productivity act — it is a **civic act**.

When your cognitive state becomes readable, every agent that interacts with you can make better decisions about how to approach you. Your collaborator's AI knows to send async rather than schedule a meeting. Your smart home knows to dim the lights without being asked. Your car knows to take the scenic route through the park.

Aggregated and anonymized, BCP history signals power cognitive epidemiology research — understanding how activities, environments, and products affect population-scale cognitive health. This is the **Cognition FDA** that Tamir and McManus described in 2019: a system that rewards products and environments that protect rather than strip-mine human cognition.

---

## Authors

**Mickey McManus** — Partner, T-1 Ventures; former Principal Researcher, Autodesk Research; co-author, Cognitive Governance framework (2019)

**Neta Tamir** — Cornell University; co-author, Cognitive Governance framework; researcher, cognitive capacity and learning

**Conceptual origin**: Autodesk University 2019, "Cognitive Governance: Could we build a parametric model of cognitive capacity/load, and use regenerative design to build more?"

**Being-agnostic extension**: Informed by Michael Levin (Tufts) and Josh Bongard (UVM) research on morphological intelligence across the spectrum of cognizing beings.

---

## License

MIT License. Open standard. Extensible by design.

Pull requests, new reserve vocabularies, and domain-specific profiles welcome.

---

## Related

- [Model Context Protocol (MCP)](https://modelcontextprotocol.io) — Anthropic's tool-side complement
- [Which Watch](https://github.com/whichwatch/whichwatch) — the Apple Watch reference implementation
- Tamir & McManus (2019) — "Cognitive Governance" — Autodesk University talk and Forbes/Aspenia essays
