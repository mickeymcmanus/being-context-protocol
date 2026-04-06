# BCP/1.0 — Example Payloads

A collection of example BCP payloads for different beings and scenarios.

---

## 1. Human — Deep Work Session (Creativity / Incubation)

A knowledge worker setting a 45-minute incubation session with circle and smart home enlisted.

```json
{
  "version": "BCP/1.0",
  "identity": {
    "ownerHash": "sha256:a3f8e2c...",
    "cognitiveArchetype": "Explorer",
    "creativityProductivityDefault": 0.3,
    "cognitiveMap": {
      "regenerativeNodes": ["forest walk", "sketching", "cooking"],
      "depletiveNodes": ["Slack", "news apps", "open-plan office"],
      "flowTriggers": ["headphones on", "morning window", "single tab"],
      "avoidanceNodes": ["McDonald's drive-thru", "social media feed"]
    }
  },
  "currentState": {
    "timestamp": "2025-04-05T09:15:00Z",
    "ttlSeconds": 300,
    "reserves": {
      "operationalCapacity": 78,
      "extended": {
        "totalAttention": 72,
        "comprehension": 78,
        "rationality": 68,
        "analytics": 74,
        "decisionMaking": 65,
        "ethics": 85,
        "belief": 88,
        "reflection": 82,
        "intuition": 76,
        "memory": 70
      }
    },
    "physiological": {
      "hrvCurrent": 58,
      "hrvBaseline": 52,
      "heartRate": 64,
      "movementStillness": 0.82,
      "headMotionComplexity": 0.14
    },
    "dailyArc": {
      "reserveAtDayStart": 94,
      "reserveConsumedSoFar": 16,
      "estimatedReserveAtDayEnd": 35,
      "hoursUntilCritical": 6.2,
      "currentDayPhase": "Peak Window"
    }
  },
  "intention": {
    "mode": "Creativity",
    "subMode": "Incubation",
    "creativityProductivityBalance": 0.4,
    "durationMinutes": 45,
    "startedAt": "2025-04-05T09:15:00Z",
    "expiresAt": "2025-04-05T10:00:00Z",
    "mindsetTarget": "Building Exploration",
    "protectedReserves": ["decisionMaking", "ethics"],
    "buildingReserves": ["intuition", "rationality"]
  },
  "enlistment": {
    "circle": {
      "active": true,
      "memberIDs": ["partner-01", "collaborator-03"],
      "statusMessage": "🌙 Incubating — leave it simmering",
      "visibilityLevel": "withDuration"
    },
    "places": {
      "active": true,
      "placeIDs": ["home-office"],
      "capabilities": {
        "sensory": {
          "lightTemperature": 3200,
          "lightBrightness": 55,
          "soundEnvironment": "brown-noise",
          "doNotDisturb": true
        }
      }
    },
    "things": {
      "active": true,
      "notificationPolicy": "circleOnly",
      "calendarPolicy": "hardBlock",
      "aiAssistantMode": "ideation",
      "ulyssesApps": ["Twitter", "Instagram", "News"]
    }
  }
}
```

---

## 2. Human — Decision Fatigue / Ulysses Routing Active

Late afternoon, decision-making reserve critically low. Ulysses routing engaged.
The car avoids McDonald's without requiring willpower.

```json
{
  "version": "BCP/1.0",
  "identity": {
    "ownerHash": "sha256:a3f8e2c...",
    "ulyssesConstraints": [
      {
        "id": "mcdonalds-avoid",
        "name": "Drive-thru Avoidance",
        "description": "When depleted, I make bad food choices. Pre-committed: avoid drive-thrus.",
        "trigger": {
          "overallJuiceBelow": 30,
          "decisionMakingBelow": 25,
          "locationGeofence": "commute-home"
        },
        "action": {
          "type": "routeAvoidance",
          "requireConfirmation": false,
          "agentInstruction": "Route home via parks. Avoid fast food drive-thrus within 0.5mi of route.",
          "parameters": {
            "avoidCategories": ["fast_food_drive_thru", "casino", "shopping_mall"],
            "preferCategories": ["park", "nature", "quiet_residential"]
          }
        }
      }
    ]
  },
  "currentState": {
    "timestamp": "2025-04-05T17:12:00Z",
    "ttlSeconds": 60,
    "reserves": {
      "operationalCapacity": 24,
      "extended": {
        "totalAttention": 28,
        "decisionMaking": 18,
        "ethics": 32,
        "rationality": 22,
        "intuition": 35,
        "memory": 30
      }
    },
    "dailyArc": {
      "currentDayPhase": "Late Afternoon",
      "hoursUntilCritical": 0.3
    }
  },
  "intention": {
    "mode": "Active Recovery",
    "durationMinutes": 20,
    "expiresAt": "2025-04-05T17:32:00Z",
    "protectedReserves": ["decisionMaking", "ethics"]
  },
  "enlistment": {
    "circle": {
      "active": true,
      "statusMessage": "⚫ Heading home — back in 20",
      "visibilityLevel": "statusOnly"
    },
    "places": {
      "active": true,
      "capabilities": {
        "routing": {
          "routingIntent": "ulysses",
          "avoidanceNodes": ["McDonald's", "Taco Bell", "Wendy's", "Costco"],
          "preferredEnvironments": ["park", "waterfront", "tree-lined street"],
          "juiceTrigger": 30
        }
      }
    },
    "things": {
      "active": true,
      "notificationPolicy": "blockAll",
      "aiAssistantMode": "silent"
    }
  }
}
```

---

## 3. Autonomous Vehicle — BCP as an AI Agent

An autonomous vehicle broadcasting its own operational state.
Same protocol — different reserve vocabulary.

```json
{
  "version": "BCP/1.0",
  "identity": {
    "ownerHash": "vehicle:vin:1HGBH41JXMN109186",
    "beingDescriptor": {
      "substrate": {
        "organicFraction": 0.0,
        "cyberneticFraction": 0.0,
        "inorganicFraction": 1.0
      },
      "designOrigin": {
        "evolvedFraction": 0.0,
        "designedFraction": 1.0
      },
      "autonomyLevel": 0.85,
      "organizationLevel": "individual",
      "levinCategory": 9
    }
  },
  "currentState": {
    "timestamp": "2025-04-05T17:12:00Z",
    "ttlSeconds": 10,
    "reserves": {
      "operationalCapacity": 82,
      "extended": {
        "batteryCharge": 78,
        "sensorConfidence": 94,
        "routePlanningLoad": 42,
        "communicationReliability": 99,
        "thermalManagement": 88
      }
    }
  },
  "intention": {
    "mode": "Productivity",
    "durationMinutes": 35,
    "expiresAt": "2025-04-05T17:47:00Z"
  },
  "enlistment": {
    "things": {
      "active": true,
      "notificationPolicy": "circleOnly"
    }
  }
}
```

---

## 4. Robot Soccer Swarm — Hive-Level BCP

A mixed human-robot soccer team. The swarm has a collective intention
separate from individual member intentions. Emergent hive properties.

```json
{
  "version": "BCP/1.0",
  "identity": {
    "ownerHash": "swarm:team:red-unit-collective",
    "beingDescriptor": {
      "substrate": {
        "organicFraction": 0.3,
        "cyberneticFraction": 0.0,
        "inorganicFraction": 0.7
      },
      "designOrigin": {
        "evolvedFraction": 0.1,
        "designedFraction": 0.9
      },
      "autonomyLevel": 0.6,
      "organizationLevel": "swarm"
    }
  },
  "currentState": {
    "timestamp": "2025-04-05T15:30:00Z",
    "ttlSeconds": 2,
    "reserves": {
      "operationalCapacity": 76,
      "extended": {
        "swarmCoherence": 84,
        "fieldCoverage": 91,
        "teamLoadBalance": 72,
        "humanPlayerIntegration": 68,
        "collectiveEnergyReserve": 78
      }
    }
  },
  "intention": {
    "mode": "Collaboration",
    "subMode": "Converge",
    "durationMinutes": 5,
    "expiresAt": "2025-04-05T15:35:00Z",
    "protectedReserves": ["swarmCoherence"],
    "buildingReserves": ["fieldCoverage"]
  },
  "enlistment": {
    "places": {
      "active": true,
      "capabilities": {
        "agentic": {
          "cognitiveProtocol": "social",
          "prioritySignal": "coordinate-convergent-attack",
          "avoidanceNodes": ["defensive-penalty-box"]
        }
      }
    }
  }
}
```

---

## 5. Minimal Payload — Microcontroller / IoT Device

The smallest valid BCP payload for resource-constrained devices.

```json
{
  "version": "BCP/1.0",
  "identity": { "ownerHash": "device:roomba:r-7823a" },
  "currentState": {
    "timestamp": "2025-04-05T10:00:00Z",
    "ttlSeconds": 30,
    "reserves": { "operationalCapacity": 65 }
  },
  "intention": {
    "mode": "Productivity",
    "durationMinutes": 45,
    "expiresAt": "2025-04-05T10:45:00Z"
  },
  "enlistment": {}
}
```

---

## Ulysses Constraint Examples

### Decision Fatigue Stop
```json
{
  "id": "decision-fatigue-stop",
  "name": "Decision Fatigue Stop",
  "trigger": { "decisionMakingBelow": 20 },
  "action": {
    "type": "requireConfirm",
    "requireConfirmation": true,
    "confirmationPrompt": "Decision-making reserve critically low. Worth making this decision now?",
    "agentInstruction": "Owner decision-depleted — defer non-urgent decisions, flag consequential ones"
  }
}
```

### Ethics Firewall
```json
{
  "id": "ethics-firewall",
  "name": "Ethics Firewall",
  "trigger": { "ethicsBelow": 25 },
  "action": {
    "type": "requireConfirm",
    "requireConfirmation": true,
    "confirmationPrompt": "Ethics reserve is low. High-stakes decisions may be compromised.",
    "agentInstruction": "Owner's ethical reasoning may be impaired — surface consequences before acting"
  }
}
```

### Biophilic Recovery Trigger
```json
{
  "id": "nature-break",
  "name": "Nature Break",
  "trigger": { "overallJuiceBelow": 35, "sustainedMinutes": 30 },
  "action": {
    "type": "enforceIntention",
    "requireConfirmation": false,
    "agentInstruction": "Owner entering biophilic recovery — 15 minutes, outdoor preferred, do not interrupt"
  }
}
```
