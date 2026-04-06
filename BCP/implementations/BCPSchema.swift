// Being Context Protocol (BCP) v1.0
// Swift / Apple Platform Reference Implementation
//
// For Apple Watch, iPhone, Mac, Vision Pro
// Companion to the Which Watch cognitive governance app
//
// https://beingcontextprotocol.org
// MIT License

import Foundation

// MARK: - BCP Payload

public struct BCPPayload: Codable {
    public let version: String  // "BCP/1.0"
    public let identity: BCPIdentity
    public var currentState: BCPCurrentState
    public var intention: BCPIntention
    public var enlistment: BCPEnlistment
    public var historySignal: BCPHistorySignal?

    public init(identity: BCPIdentity, currentState: BCPCurrentState,
                intention: BCPIntention, enlistment: BCPEnlistment) {
        self.version = "BCP/1.0"
        self.identity = identity
        self.currentState = currentState
        self.intention = intention
        self.enlistment = enlistment
    }

    public var json: Data? { try? JSONEncoder().encode(self) }
    public var isExpired: Bool { currentState.isExpired }
}

// MARK: - Identity

public struct BCPIdentity: Codable {
    public let ownerHash: String
    public var cognitiveArchetype: CognitiveArchetype?
    public var beingDescriptor: BeingDescriptor?
    public var activityCalibrations: [String: ActivityCalibration]
    public var ulyssesConstraints: [BCPUlyssesConstraint]
    public var cognitiveMap: CognitiveMap
    public var creativityProductivityDefault: Double  // -1.0 to +1.0; sweet spot = 0

    public init(ownerHash: String) {
        self.ownerHash = ownerHash
        self.activityCalibrations = [:]
        self.ulyssesConstraints = []
        self.cognitiveMap = .empty
        self.creativityProductivityDefault = 0
    }

    public enum CognitiveArchetype: String, Codable, CaseIterable {
        case deepDiver    = "Deep Diver"
        case connector    = "Connector"
        case explorer     = "Explorer"
        case executor     = "Executor"
        case reflector    = "Reflector"
        case collaborator = "Collaborator"
    }

    /// Levin/Bongard morphological coordinates.
    /// Makes BCP being-agnostic: humans, animals, robots, swarms.
    public struct BeingDescriptor: Codable {
        public var organicFraction:    Double  // 0–1
        public var cyberneticFraction: Double
        public var inorganicFraction:  Double
        public var evolvedFraction:    Double
        public var designedFraction:   Double
        public var autonomyLevel:      Double  // 0=clockwork, 1=high cognition
        public var organizationLevel:  OrganizationLevel
        public var levinCategory:      Int?

        public enum OrganizationLevel: String, Codable {
            case cellular, individual, swarm, hive, emergent
        }

        public static var human: BeingDescriptor {
            BeingDescriptor(organicFraction: 1, cyberneticFraction: 0, inorganicFraction: 0,
                            evolvedFraction: 1, designedFraction: 0, autonomyLevel: 0.9,
                            organizationLevel: .individual, levinCategory: 7)
        }
    }

    public struct ActivityCalibration: Codable {
        public var activityType: String
        /// Negative = regenerative for this specific being. Not a population average.
        public var personalLoadImpact: Double   // -100 to +100
        public var sampleCount: Int
        public var optimalTimeOfDay: [String]?

        public var confidence: Double { min(1.0, Double(sampleCount) / 10.0) }
        public var isRegenerative: Bool { personalLoadImpact < 0 }
    }

    public struct CognitiveMap: Codable {
        public var regenerativeNodes: [String]
        public var depletiveNodes: [String]
        public var flowTriggers: [String]
        public var depletionTriggers: [String]
        public var avoidanceNodes: [String]  // Ulysses nodes

        public static var empty: CognitiveMap {
            CognitiveMap(regenerativeNodes: [], depletiveNodes: [],
                         flowTriggers: [], depletionTriggers: [], avoidanceNodes: [])
        }
    }
}

// MARK: - Current State

public struct BCPCurrentState: Codable {
    public let timestamp: Date
    public let ttlSeconds: Int
    public var reserves: CognitionReserves
    public var physiological: PhysiologicalSignals?
    public var dailyArc: DailyArc?

    public var isExpired: Bool {
        Date().timeIntervalSince(timestamp) > Double(ttlSeconds)
    }

    /// Cognition Reserves — Tamir/McManus Cognition Facts taxonomy (2019)
    public struct CognitionReserves: Codable {
        public var operationalCapacity: Double  // 0–100; universal

        // Human standard vocabulary (Cognition Facts Label)
        public var totalAttention: Double?   // 60% of daily reserves
        public var comprehension:  Double?   // 5%  — reading, parsing
        public var rationality:    Double?   // 15% — logical reasoning
        public var analytics:      Double?   // 5%  — data processing
        public var decisionMaking: Double?   // 35% — THE critical reserve; depletes fastest
        public var ethics:         Double?   // 20% of daily reserves
        public var belief:         Double?   // 5%  — values alignment
        public var reflection:     Double?   // 15% — metacognition
        public var intuition:      Double?   // 10%
        public var memory:         Double?   // 5%

        // Open vocabulary for non-human beings
        public var extended: [String: Double]

        public init(operationalCapacity: Double, extended: [String: Double] = [:]) {
            self.operationalCapacity = operationalCapacity
            self.extended = extended
        }

        public var overallJuice: Double {
            let attn = totalAttention ?? operationalCapacity
            let eth  = ethics ?? operationalCapacity
            let intu = intuition ?? operationalCapacity
            let mem  = memory ?? operationalCapacity
            let refl = reflection ?? operationalCapacity
            return (attn * 0.60) + (eth * 0.20) + (intu * 0.10) + (mem * 0.05) + (refl * 0.05)
        }

        public var slipperySlopeAlert: Bool {
            (decisionMaking ?? 100) < 20 || (ethics ?? 100) < 25
        }

        public static var full: CognitionReserves {
            var r = CognitionReserves(operationalCapacity: 100)
            r.totalAttention = 100; r.comprehension = 100; r.rationality = 100
            r.analytics = 100; r.decisionMaking = 100; r.ethics = 100
            r.belief = 100; r.reflection = 100; r.intuition = 100; r.memory = 100
            return r
        }
    }

    /// Physiological signals — on-device computation, derived metrics only.
    /// No raw video, no facial geometry. Privacy-preserving by design.
    public struct PhysiologicalSignals: Codable {
        // Apple Watch
        public var hrvCurrent: Double?
        public var hrvBaseline: Double?
        public var heartRate: Double?
        public var movementStillness: Double?  // 0–1

        // AirPods Pro
        public var headMotionComplexity: Double?  // 0–1; attentional wandering
        public var skinTemperatureElevation: Double?
        public var inEarPresence: Bool?

        // Mac Vision framework (on-device, no video stored)
        public var pupilDiameterRatio: Double?   // normalized; working memory proxy
        public var blinkRate: Double?             // fatigue / focus signal
        public var fixationDuration: Double?      // ms; comprehension depth
        public var saccadeVelocity: Double?       // deg/sec; decision speed

        public var cognitiveLoad: Double? {
            guard let hrv = hrvCurrent, let baseline = hrvBaseline else { return nil }
            let suppression = max(0, min(1, (baseline - hrv) / max(baseline, 1)))
            let still = movementStillness ?? 0.5
            let head  = headMotionComplexity ?? 0.3
            return min(100, max(0, suppression * 45 + still * 30 + head * 25))
        }
    }

    public struct DailyArc: Codable {
        public var reserveAtDayStart: Double
        public var reserveConsumedSoFar: Double
        public var estimatedReserveAtDayEnd: Double
        public var hoursUntilCritical: Double
        public var currentDayPhase: DayPhase

        public enum DayPhase: String, Codable {
            case morningRamp  = "Morning Ramp"
            case peakWindow   = "Peak Window"
            case preBreakDip  = "Pre-Break Dip"
            case midday       = "Midday"
            case preLunchDip  = "Pre-Lunch Dip"
            case afternoonWork = "Afternoon"
            case lateAfternoon = "Late Afternoon"  // Danziger danger zone
            case eveningRegen  = "Evening Regen"
            case sleep         = "Sleep"
        }
    }
}

// MARK: - Intention

public struct BCPIntention: Codable {
    public var mode: BCPIntentionMode
    public var subMode: String?
    /// Procrastinator/pre-crastinator position. -1 = execute immediately. 0 = sweet spot.
    public var creativityProductivityBalance: Double  // -1.0 to +1.0
    public var durationMinutes: Int
    public var startedAt: Date
    public var expiresAt: Date
    public var mindsetTarget: BCPMindsetTarget?
    public var protectedReserves: [String]
    public var buildingReserves: [String]

    public var isExpired: Bool { Date() > expiresAt }
}

public enum BCPIntentionMode: String, Codable, CaseIterable {
    // Level 1: Yin/Yang
    case explore      = "Explore"
    case ship         = "Ship"
    // Level 2: Full wheel
    case curiosity    = "Curiosity"
    case creativity   = "Creativity"
    case growth       = "Growth"
    case flow         = "Flow"
    case reflection   = "Reflection"
    case collaboration = "Collaboration"
    case inspiration  = "Inspiration"
    case productivity = "Productivity"
    // Level 3: Sub-modes
    case exploration        = "Exploration"
    case incubation         = "Incubation"
    case interdisciplinary  = "Interdisciplinary"
    case deconstruct        = "Deconstruct"
    case skillHone          = "Skill Hone"
    case selfImprovement    = "Self Improvement"
    case resilience         = "Resilience"
    case diverge            = "Diverge"
    case converge           = "Converge"
    case reconnect          = "Reconnect"
    // Recovery axis
    case activeRecovery     = "Active Recovery"
    case deepRecovery       = "Deep Recovery"
    case biophilicRecovery  = "Biophilic Recovery"
}

public enum BCPMindsetTarget: String, Codable, CaseIterable {
    case buildingCuriosity         = "Building Curiosity"
    case buildingFlow              = "Building Flow"
    case buildingResilience        = "Building Resilience"
    case buildingExploration       = "Building Exploration"
    case reducingProcrastination   = "Reducing Procrastination"
    case reducingPreCrastination   = "Reducing Pre-Crastination"
    case buildingCollaboration     = "Building Collaboration"
    case buildingReflection        = "Building Reflection"
    case buildingInterdisciplinary = "Building Interdisciplinary Thinking"
}

// MARK: - Enlistment

public struct BCPEnlistment: Codable {
    public var circle: CircleEnlistment?
    public var places: PlacesEnlistment?
    public var things: ThingsEnlistment?

    public static var selfOnly: BCPEnlistment { BCPEnlistment() }

    public struct CircleEnlistment: Codable {
        public var active: Bool
        public var memberIDs: [String]
        public var statusMessage: String
        public var visibilityLevel: VisibilityLevel

        public enum VisibilityLevel: String, Codable {
            case statusOnly, withDuration, full
        }
    }

    public struct PlacesEnlistment: Codable {
        public var active: Bool
        public var placeIDs: [String]
        public var capabilities: PlaceCapabilityRequest?
    }

    public struct ThingsEnlistment: Codable {
        public var active: Bool
        public var notificationPolicy: NotificationPolicy
        public var calendarPolicy: CalendarPolicy
        public var aiAssistantMode: AIAssistantMode
        public var ulyssesApps: [String]

        public enum NotificationPolicy: String, Codable { case blockAll, circleOnly, urgentOnly, open }
        public enum CalendarPolicy: String, Codable { case hardBlock, softBlock, open }
        public enum AIAssistantMode: String, Codable { case silent, minimal, ideation, collaborative, normal }
    }
}

// MARK: - Place Capability Request

public struct PlaceCapabilityRequest: Codable {
    public var sensory: SensoryRequest?
    public var spatial: SpatialRequest?
    public var agentic: AgenticRequest?
    public var routing: RoutingRequest?

    public struct SensoryRequest: Codable {
        public var lightTemperature: Int?  // Kelvin
        public var lightBrightness: Int?
        public var soundEnvironment: String?
        public var temperature: Double?    // Celsius
        public var doNotDisturb: Bool?
    }

    public struct SpatialRequest: Codable {
        public var ceilingHeight: CeilingHeight?  // Cathedral effect
        public var openness: Double?
        public var naturalLightExposure: Double?
        public var viewOrientation: String?

        public enum CeilingHeight: String, Codable {
            case high, standard, low
        }
    }

    public struct AgenticRequest: Codable {
        public var cognitiveProtocol: String
        public var avoidanceNodes: [String]
        public var prioritySignal: String
    }

    public struct RoutingRequest: Codable {
        public var routingIntent: RoutingIntent
        public var avoidanceNodes: [String]
        public var preferredEnvironments: [String]
        public var juiceTrigger: Double?

        public enum RoutingIntent: String, Codable {
            case efficient, scenic, ulysses
        }
    }
}

// MARK: - Ulysses Constraint

public struct BCPUlyssesConstraint: Codable, Identifiable {
    public let id: UUID
    public var name: String
    public var description: String
    public var trigger: Trigger
    public var action: Action

    public struct Trigger: Codable {
        public var overallJuiceBelow: Double?
        public var decisionMakingBelow: Double?
        public var ethicsBelow: Double?
        public var loadAbove: Double?
        public var timeOfDay: [String]?
        public var locationGeofence: String?
        public var sustainedMinutes: Int?
    }

    public struct Action: Codable {
        public var type: ActionType
        public var requireConfirmation: Bool
        public var confirmationPrompt: String?
        public var agentInstruction: String

        public enum ActionType: String, Codable {
            case routeAvoidance, appBlock, enforceIntention,
                 notifyCircle, requireConfirm, startRecovery, endDecisions
        }
    }

    public static var defaults: [BCPUlyssesConstraint] {[
        BCPUlyssesConstraint(
            id: UUID(), name: "Overload Guard",
            description: "Switch to recovery when sustained overload detected",
            trigger: .init(loadAbove: 80, sustainedMinutes: 20),
            action: .init(type: .enforceIntention, requireConfirmation: false, confirmationPrompt: nil,
                         agentInstruction: "Owner in recovery mode — defer all non-urgent requests")),
        BCPUlyssesConstraint(
            id: UUID(), name: "Decision Fatigue Stop",
            description: "Block major decisions when decision-making reserve depleted. Danziger et al. 2011.",
            trigger: .init(decisionMakingBelow: 20),
            action: .init(type: .requireConfirm, requireConfirmation: true,
                         confirmationPrompt: "Decision-making reserve critically low. Right time for this?",
                         agentInstruction: "Owner decision-depleted — postpone non-urgent decisions")),
        BCPUlyssesConstraint(
            id: UUID(), name: "Ethics Firewall",
            description: "Alert before ethical decisions when ethics reserve low",
            trigger: .init(ethicsBelow: 25),
            action: .init(type: .requireConfirm, requireConfirmation: true,
                         confirmationPrompt: "Ethics reserve low. High-stakes decisions may be compromised.",
                         agentInstruction: "Owner's ethical reasoning may be impaired — flag consequential decisions")),
        BCPUlyssesConstraint(
            id: UUID(), name: "Nap Trigger",
            description: "20-min nap = 2–3 math tutors (Tamir & McManus 2019). Non-negotiable.",
            trigger: .init(overallJuiceBelow: 20),
            action: .init(type: .startRecovery, requireConfirmation: false, confirmationPrompt: nil,
                         agentInstruction: "Owner in deep recovery — 20 min, do not disturb")),
    ]}
}

// MARK: - History Signal

public struct BCPHistorySignal: Codable {
    public var weeklyCapacityTrend: Trend
    public var topDepletiveActivities: [String]
    public var topRegenerativeActivities: [String]
    public var learningVelocity: Double
    public var flowStateFrequency: Double
    public var averageJuiceAtDayEnd: Double

    public var chronicDepletionAlert: Bool { averageJuiceAtDayEnd < 30 }

    public enum Trend: String, Codable {
        case building = "Building"
        case stable   = "Stable"
        case eroding  = "Eroding"
    }
}
