/**
 * Being Context Protocol (BCP) v1.0
 * TypeScript type definitions
 *
 * The human-side complement to Anthropic's Model Context Protocol.
 * MCP gives AI models context about tools.
 * BCP gives agentic environments context about the being they serve.
 *
 * https://beingcontextprotocol.org
 */

// ── Core Payload ──────────────────────────────────────────────────────────

export interface BCPPayload {
  version: "BCP/1.0";
  identity: BCPIdentity;
  currentState: BCPCurrentState;
  intention: BCPIntention;
  enlistment: BCPEnlistment;
  historySignal?: BCPHistorySignal;
}

// ── Identity ──────────────────────────────────────────────────────────────
// Stable characteristics. Updated infrequently. The "who you are" layer.

export interface BCPIdentity {
  ownerHash: string;                          // anonymized stable ID, no PII
  cognitiveArchetype?: CognitiveArchetype;
  beingDescriptor?: BeingDescriptor;          // for non-human beings
  activityCalibrations?: Record<string, ActivityCalibration>;
  ulyssesConstraints?: UlyssesConstraint[];
  cognitiveMap?: CognitiveMap;
  creativityProductivityDefault?: number;     // -1.0 to +1.0; sweet spot is 0
}

export type CognitiveArchetype =
  | "Deep Diver"    // sustained focus, linear
  | "Connector"     // associative, interdisciplinary
  | "Explorer"      // broad, random walk
  | "Executor"      // fast ship, pre-crastinator
  | "Reflector"     // slow synthesis, retrospective
  | "Collaborator"; // regenerates via social

/**
 * Levin/Bongard morphological coordinates.
 * Allows BCP to describe any cognizing being — human, animal,
 * robot, cyborg, or swarm — with appropriate reserve vocabularies.
 */
export interface BeingDescriptor {
  substrate: {
    organicFraction: number;    // 0–1
    cyberneticFraction: number; // 0–1
    inorganicFraction: number;  // 0–1; sums to 1.0
  };
  designOrigin: {
    evolvedFraction: number;    // 0–1
    designedFraction: number;   // 0–1; sums to 1.0
  };
  autonomyLevel: number;        // 0=clockwork, 1=high-level cognition
  organizationLevel: "cellular" | "individual" | "swarm" | "hive" | "emergent";
  levinCategory?: number;       // 1–23; optional position in Levin's taxonomy
}

export interface ActivityCalibration {
  activityType: string;
  personalLoadImpact: number;   // -100 to +100; negative = regenerative for THIS being
  sampleCount: number;
  confidence: number;           // 0–1
  optimalTimeOfDay?: string[];
  optimalJuiceMin?: number;
  optimalJuiceMax?: number;
}

export interface CognitiveMap {
  regenerativeNodes: string[];  // "forest walk", "sketching", "cooking"
  depletiveNodes: string[];     // "Twitter", "news apps", "open-plan office"
  flowTriggers: string[];
  depletionTriggers: string[];
  avoidanceNodes: string[];     // Ulysses nodes: "McDonald's drive-thru"
}

// ── Current State ─────────────────────────────────────────────────────────
// Live snapshot. TTL-limited. The "where you are right now" layer.

export interface BCPCurrentState {
  timestamp: string;            // ISO 8601 UTC
  ttlSeconds: number;           // payload expires; agents must re-subscribe
  reserves: CognitionReserves;
  physiological?: PhysiologicalSignals;
  dailyArc?: DailyArc;
}

/**
 * Cognition Reserves — Tamir/McManus Cognition Facts Label taxonomy (2019).
 *
 * Human reserve vocabulary uses the Cognition Facts label:
 *   Total Attention (60%), Ethics (20%), Intuition (10%), Memory (5%)
 *
 * Non-human beings use the `extended` open map with domain-specific keys.
 * Community vocabularies are registered at beingcontextprotocol.org/vocabularies
 */
export interface CognitionReserves {
  operationalCapacity: number;  // 0–100; universal across being types

  // Human-standard extended fields (Cognition Facts taxonomy)
  extended?: {
    // Total Attention: 60% of daily reserves
    totalAttention?: number;      // 0–100
    comprehension?: number;       // 5% — reading, parsing, understanding
    rationality?: number;         // 15% — logical reasoning
    analytics?: number;           // 5% — data processing
    decisionMaking?: number;      // 35% — THE critical reserve; depletes fastest

    // Ethics: 20% of daily reserves
    // "You can burn out ethics with a deck of cards in 10 minutes" — McManus
    ethics?: number;              // 0–100 aggregate
    belief?: number;              // 5% — values alignment
    reflection?: number;          // 15% — metacognition

    // Other reserves
    intuition?: number;           // 10%
    memory?: number;              // 5%

    // Autonomous vehicle vocabulary
    batteryCharge?: number;
    sensorConfidence?: number;
    routePlanningLoad?: number;

    // Swarm/hive vocabulary
    swarmCoherence?: number;
    collectiveAlignment?: number;

    // Open — any domain-specific reserve
    [key: string]: number | undefined;
  };
}

/**
 * Physiological signals. On-device computation only.
 * These are derived metrics — never raw biometric data.
 * No video, no facial geometry, no raw audio.
 */
export interface PhysiologicalSignals {
  // Apple Watch
  hrvCurrent?: number;          // RMSSD in ms
  hrvBaseline?: number;         // personal 7-day baseline
  heartRate?: number;           // BPM
  movementStillness?: number;   // 0–1

  // AirPods Pro
  headMotionComplexity?: number; // 0–1; entropy of head movement
  skinTemperatureElevation?: number; // °C above baseline
  inEarPresence?: boolean;

  // Mac / Vision framework (on-device, privacy-preserving)
  pupilDiameterRatio?: number;   // normalized to personal baseline; working memory proxy
  blinkRate?: number;            // blinks/min; decreases with focus, increases with fatigue
  fixationDuration?: number;     // ms; longer = deeper comprehension
  saccadeVelocity?: number;      // deg/sec; decision speed proxy
  gazeDispersion?: number;       // 0–1; focused vs. scattered attention

  // Derived composite
  cognitiveLoad?: number;        // 0–100; computed from available signals
}

export type DayPhase =
  | "Morning Ramp"    // 6am–9am
  | "Peak Window"     // 9am–11am; highest capacity
  | "Pre-Break Dip"   // ~10am; first decision danger zone
  | "Midday"
  | "Pre-Lunch Dip"   // ~noon; second danger zone
  | "Afternoon"       // 1pm–4pm
  | "Late Afternoon"  // 4pm–6pm; Danziger danger zone
  | "Evening Regen"   // 6pm+; regeneration arc begins
  | "Sleep";          // the big restorer

export interface DailyArc {
  reserveAtDayStart: number;
  reserveConsumedSoFar: number;
  estimatedReserveAtDayEnd: number;
  hoursUntilCritical: number;
  currentDayPhase: DayPhase;
}

// ── Intention ─────────────────────────────────────────────────────────────
// What this being is navigating TOWARD. Compass, not thermometer.

export type IntentionMode =
  // Level 1: The Yin/Yang (first-time or depleted)
  | "Explore" | "Ship"
  // Level 2: The Full Wheel (8 modes)
  | "Curiosity" | "Creativity" | "Growth" | "Flow"
  | "Reflection" | "Collaboration" | "Inspiration" | "Productivity"
  // Level 3: Sub-modes (drilled into from Level 2)
  | "Exploration" | "Incubation" | "Interdisciplinary" | "Deconstruct"  // Creativity
  | "Skill Hone" | "Self Improvement" | "Resilience"                    // Growth
  | "Diverge" | "Converge" | "Reconnect"                                // Collaboration
  // Recovery axis
  | "Active Recovery" | "Deep Recovery" | "Biophilic Recovery";

export type MindsetTarget =
  | "Building Curiosity"
  | "Building Flow"
  | "Building Resilience"
  | "Building Exploration"
  | "Reducing Procrastination"
  | "Reducing Pre-Crastination"
  | "Building Collaboration"
  | "Building Reflection"
  | "Building Interdisciplinary Thinking";

export interface BCPIntention {
  mode: IntentionMode;
  subMode?: string;

  /**
   * Position on the procrastinator/pre-crastinator spectrum.
   * -1.0 = executes immediately (no incubation)
   *  0.0 = sweet spot (incubate briefly, execute with urgency)
   * +1.0 = richly incubates (may not execute)
   * The Which Watch crown dial navigates this spectrum.
   */
  creativityProductivityBalance?: number;

  durationMinutes: number;
  startedAt?: string;           // ISO 8601
  expiresAt: string;            // ISO 8601

  mindsetTarget?: MindsetTarget;
  protectedReserves?: string[];  // don't spend these during this window
  buildingReserves?: string[];   // try to grow these
}

// ── Enlistment ────────────────────────────────────────────────────────────
// Who and what has been recruited to serve this intention.

export interface BCPEnlistment {
  circle?: CircleEnlistment;
  places?: PlacesEnlistment;
  things?: ThingsEnlistment;
}

export type VisibilityLevel = "statusOnly" | "withDuration" | "full";

export interface CircleEnlistment {
  active: boolean;
  memberIDs?: string[];
  statusMessage?: string;
  visibilityLevel?: VisibilityLevel;
}

export interface PlacesEnlistment {
  active: boolean;
  placeIDs?: string[];
  capabilities?: PlaceCapabilityRequest;
}

export interface ThingsEnlistment {
  active: boolean;
  notificationPolicy?: "blockAll" | "circleOnly" | "urgentOnly" | "open";
  calendarPolicy?: "hardBlock" | "softBlock" | "open";
  aiAssistantMode?: "silent" | "minimal" | "ideation" | "collaborative" | "normal";
  ulyssesApps?: string[];
}

// ── Place Capability Request ──────────────────────────────────────────────
// What you're requesting from enrolled places.
// Places respond only to capabilities they actually have.

export interface PlaceCapabilityRequest {
  // Tier 1: Basic smart (Hue, Nest, smart speaker)
  sensory?: {
    lightTemperature?: number;    // Kelvin: 2700 warm → 6500 cool
    lightBrightness?: number;     // 0–100%
    soundEnvironment?: "silence" | "brown-noise" | "nature" | "ambient" | "open";
    temperature?: number;         // Celsius
    doNotDisturb?: boolean;
  };

  // Tier 2: Advanced smart (motorized, smart glass, HVAC)
  spatial?: {
    /**
     * Cathedral effect (Meyers-Levy & Zhu, 2007):
     * High ceiling → abstract/creative thinking
     * Low ceiling  → detail/analytical work
     */
    ceilingHeight?: "high" | "standard" | "low";
    openness?: number;            // 0–1
    naturalLightExposure?: number;// 0–1
    viewOrientation?: "nature" | "street" | "private";
    seatingConfiguration?: "mobile" | "anchored" | "standing";
  };

  // Tier 3: Robotic/agentic (robotic house, etc.)
  agentic?: {
    cognitiveProtocol: "deep-work" | "recovery" | "creative" | "social" | string;
    avoidanceNodes?: string[];
    prioritySignal?: string;
  };

  // Vehicle routing (Ulysses routing)
  routing?: {
    /**
     * "ulysses" mode: when triggered, actively routes around
     * pre-registered temptation nodes. Enforces pre-committed
     * constraints without requiring willpower in the moment.
     */
    routingIntent: "efficient" | "scenic" | "ulysses";
    avoidanceNodes?: string[];     // "McDonald's", "casino", etc.
    preferredEnvironments?: string[];
    juiceTrigger?: number;         // only apply when juice drops below this
  };
}

// ── Ulysses Constraint ────────────────────────────────────────────────────
// Pre-committed rules. Written when rational. Enforced when depleted.

export type UlyssesActionType =
  | "routeAvoidance"
  | "appBlock"
  | "enforceIntention"
  | "notifyCircle"
  | "requireConfirm"
  | "startRecovery"
  | "endDecisions";

export interface UlyssesConstraint {
  id: string;
  name: string;
  description?: string;
  trigger: {
    overallJuiceBelow?: number;
    decisionMakingBelow?: number;
    ethicsBelow?: number;
    loadAbove?: number;
    timeOfDay?: string[];          // ["14:00", "17:00"] — afternoon danger zone
    locationGeofence?: string;
    activityTypes?: string[];
    sustainedMinutes?: number;
  };
  action: {
    type: UlyssesActionType;
    parameters?: Record<string, unknown>;
    requireConfirmation?: boolean;
    confirmationPrompt?: string;
    agentInstruction: string;      // plain-language instruction for enrolled agents
  };
}

// ── History Signal ────────────────────────────────────────────────────────
// Opt-in. Anonymized aggregate. Powers cognitive epidemiology research.

export interface BCPHistorySignal {
  weeklyCapacityTrend: "building" | "stable" | "eroding";
  topDepletiveActivities: string[];
  topRegenerativeActivities: string[];
  learningVelocity?: number;
  flowStateFrequency?: number;
  averageJuiceAtDayEnd?: number;
}

// ── Utility: Default Ulysses Constraints ─────────────────────────────────

export const defaultUlyssesConstraints: UlyssesConstraint[] = [
  {
    id: "overload-guard",
    name: "Overload Guard",
    description: "Switch to recovery when sustained overload detected",
    trigger: { loadAbove: 80, sustainedMinutes: 20 },
    action: {
      type: "enforceIntention",
      requireConfirmation: false,
      agentInstruction: "Owner in recovery mode — defer all non-urgent requests"
    }
  },
  {
    id: "decision-fatigue-stop",
    name: "Decision Fatigue Stop",
    description: "Block major decisions when decision-making reserve depleted. See Danziger et al. 2011.",
    trigger: { decisionMakingBelow: 20 },
    action: {
      type: "requireConfirm",
      requireConfirmation: true,
      confirmationPrompt: "Your decision-making reserve is critically low. This may not be the right time for this decision.",
      agentInstruction: "Owner's decision capacity depleted — postpone non-urgent decisions"
    }
  },
  {
    id: "ethics-firewall",
    name: "Ethics Firewall",
    description: "Alert before ethical decisions when ethics reserve low",
    trigger: { ethicsBelow: 25 },
    action: {
      type: "requireConfirm",
      requireConfirmation: true,
      confirmationPrompt: "Ethics reserve is low. High-stakes decisions may be compromised.",
      agentInstruction: "Owner's ethical reasoning may be impaired — flag consequential decisions"
    }
  },
  {
    id: "nap-trigger",
    name: "Nap Trigger",
    description: "Prompt 20-min nap when overall juice critically low. 20 min nap = 2–3 math tutors (Tamir & McManus 2019).",
    trigger: { overallJuiceBelow: 20 },
    action: {
      type: "startRecovery",
      requireConfirmation: false,
      agentInstruction: "Owner in deep recovery — 20 min, do not disturb"
    }
  }
];

// ── Utility: Validate Payload ─────────────────────────────────────────────

export function validateBCPPayload(payload: unknown): payload is BCPPayload {
  if (typeof payload !== "object" || payload === null) return false;
  const p = payload as Record<string, unknown>;
  return (
    p.version === "BCP/1.0" &&
    typeof p.identity === "object" &&
    typeof p.currentState === "object" &&
    typeof p.intention === "object" &&
    typeof p.enlistment === "object"
  );
}

export function isExpired(state: BCPCurrentState): boolean {
  const age = (Date.now() - new Date(state.timestamp).getTime()) / 1000;
  return age > state.ttlSeconds;
}
