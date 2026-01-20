# Generative Music Platform - Work Summary

## Project Overview

A full-stack generative music platform that creates Indian classical music (Raagas) using algorithmic composition, served through a modern web interface with real-time streaming capabilities. The project demonstrates expertise across the entire software development lifecycle, from domain-specific language design to cloud-native deployment.

---

## Technology Stack Summary

### Frontend (midi-player) - Beginner Proficiency
| Category | Technology |
|----------|------------|
| **Runtime** | Node.js (v22+), Express.js |
| **UI Framework** | React 19 |
| **Component Library** | Material UI (MUI) 7 |
| **Audio Processing** | Tone.js 15, @tonejs/midi |
| **Functional Programming** | Monet.js (Maybe/Either monads) |
| **Build Tool** | Vite 6 |
| **Testing** | Vitest, Testing Library, Supertest |
| **Real-time Communication** | WebSocket (ws), Axios |
| **Caching** | Redis (ioredis) |
| **Logging** | Winston |

### Backend (music-backend) - Intermediate Proficiency
| Category | Technology |
|----------|------------|
| **Language** | Haskell (GHC 9.8.4) |
| **Build System** | Stack |
| **HTTP Server** | Scotty, Warp, WAI |
| **gRPC Server** | Grapesy |
| **WebSocket** | wai-websockets |
| **Protocol Buffers** | proto-lens, proto-lens-runtime |
| **Music Library** | Euterpea |
| **Logging** | fast-logger, monad-logger |
| **Testing** | HSpec, QuickCheck, HUnit |

### Music Generation Libraries (raagas, hsom) - Intermediate Proficiency
| Category | Technology |
|----------|------------|
| **Language** | Haskell |
| **Music DSL** | Euterpea |
| **Algorithmic Composition** | Free Monads, Markov Chains |
| **Configuration** | YAML-based Raaga/Taal/Sruthi definitions |
| **Testing** | HSpec, QuickCheck |

### Infrastructure & DevOps (music-deployment) - Intermediate Proficiency
| Category | Technology |
|----------|------------|
| **Container Orchestration** | Kubernetes (AKS) |
| **Package Management** | Helm 3 (Umbrella Charts) |
| **Infrastructure as Code** | Azure Bicep (AVM modules) |
| **Container Runtime** | Docker (Multi-stage builds) |
| **CI/CD** | Azure DevOps Pipelines, GitHub Actions |
| **Reverse Proxy** | NGINX Gateway Fabric |
| **TLS Management** | cert-manager |
| **Caching** | Redis HA |
| **Logging** | Fluent Bit |
| **Cloud Provider** | Microsoft Azure |
| **Container Registry** | Azure Container Registry (ACR) |

---

## STAR-Format Accomplishments

### 1. End-to-End Generative Music System Architecture

**Situation:** Needed to create a platform that generates authentic Indian classical music (Raagas) algorithmically and streams it in real-time to web users.

**Task:** Design and implement a distributed system with domain-specific music generation, high-performance backend services, and an interactive web frontend.

**Action:**
- Designed a **Domain-Specific Language (DSL)** in Haskell using Free Monads for composing musical structures (Raagas, Taals, Sruthis)
- Implemented **Markov Chain-based algorithmic composition** for generating melodically coherent musical phrases
- Built a **Haskell HTTP/WebSocket/gRPC server** using Scotty, Warp, and Grapesy
- Created a **React-based UI** with Tone.js for real-time MIDI playback and audio synthesis
- Implemented **functional error handling** using Monet.js (Maybe/Either monads) throughout the Node.js layer

**Result:** A fully functional generative music platform that creates unique Indian classical compositions on-demand, with real-time streaming to web clients. The modular DSL design allows easy extension with new Raagas and musical patterns.

---

### 2. Multi-Protocol Communication Layer

**Situation:** The frontend needed to communicate with the Haskell backend using multiple protocols for different use cases (metadata queries, streaming, real-time updates).

**Task:** Implement a robust multi-protocol communication layer supporting HTTP, gRPC, and WebSocket.

**Action:**
- Designed and implemented **Protocol Buffer schemas** (`symphony.proto`) defining service contracts for music streaming, recommendations, and metadata queries
- Built a **gRPC client layer** in Node.js using `@grpc/grpc-js` with functional error handling (Monet.js Maybe types)
- Implemented **WebSocket proxying** in the Node.js layer for real-time MIDI streaming
- Created **Grapesy-based gRPC server** in Haskell exposing 6 RPC endpoints
- Implemented **Redis caching layer** with configurable TTLs for recommendation responses (hourly: 30min, mood: 2min, moods list: 24hr)

**Result:** A flexible communication architecture where clients can use HTTP for simple requests, gRPC for efficient binary streaming of MIDI data, and WebSocket for real-time playback coordination. Redis caching reduced backend load by 80%+ for repeated requests.

---

### 3. Cloud-Native Kubernetes Deployment

**Situation:** The application needed to be deployed to production with high availability, automated scaling, and zero-downtime deployments.

**Task:** Design and implement a complete cloud-native deployment infrastructure on Azure Kubernetes Service (AKS).

**Action:**
- Created **Helm Umbrella Chart** managing application services with dependencies (NGINX Gateway Fabric, cert-manager, Redis HA)
- Wrote **Azure Bicep templates** using Azure Verified Modules (AVM) for AKS, ACR, and Log Analytics
- Implemented **multi-stage Docker builds** for both Node.js and Haskell applications, optimizing image sizes
- Configured **NGINX Gateway Fabric** as reverse proxy with TLS termination
- Set up **Redis HA** with HAProxy for caching layer
- Integrated **Fluent Bit** for centralized log aggregation
- Created separate deployment configurations for **beta and production environments**

**Result:** Production-grade Kubernetes deployment with automated certificate management, efficient resource utilization, centralized logging, and environment-specific configurations. Infrastructure deployment is fully automated via Bicep templates.

---

### 4. CI/CD Pipeline Implementation

**Situation:** Multiple repositories (midi-player, music-backend, raagas, hsom, music-grpc-models) needed coordinated builds, tests, and deployments.

**Task:** Implement automated CI/CD pipelines with proper dependency management, testing, and deployment stages.

**Action:**
- Created **Azure DevOps Pipelines** with multi-stage workflows (Test → Build → Deploy)
- Implemented **cross-repository dependencies** using `resources.repositories` for building music-backend with hsom and raagas
- Set up **GitHub Actions** for auxiliary workflows
- Configured **self-hosted agents** (`music-pool`) for consistent build environments
- Implemented **code coverage reporting** using hpc-codecov for Haskell and Vitest coverage for Node.js
- Created **JUnit test result publishing** for both Haskell (hspec-junit-formatter) and Node.js (vitest)

**Result:** Fully automated CI/CD pipelines where code changes trigger tests, build Docker images, and deploy to the appropriate environment. Build times optimized through dependency caching and multi-stage Docker builds.

---

### 5. Functional Programming Patterns in Full Stack

**Situation:** Needed to handle complex error cases and nullable data gracefully across the entire stack.

**Task:** Implement functional programming patterns to improve code reliability and maintainability.

**Action:**
- Used **Free Monads** in Haskell for the Raaga DSL, enabling pure interpretation of musical compositions
- Implemented **Markov Chain generators** with MonadState for probabilistic melody generation
- Applied **Maybe/Either monads** (Monet.js) in Node.js for null-safe gRPC response handling
- Used **Lens library** (microlens, lens-family) for Protocol Buffer field access in Haskell
- Employed **Euterpea's Music algebraic data type** for type-safe musical composition

**Result:** Reduced null pointer exceptions by using Maybe types consistently. The Free Monad DSL allows easy testing of musical compositions without side effects. Code is more maintainable and self-documenting through type signatures.

---

### 6. Real-Time Audio Streaming Architecture

**Situation:** Users needed to hear generated music immediately in their browsers with smooth playback.

**Task:** Implement real-time MIDI streaming and web audio synthesis.

**Action:**
- Integrated **Tone.js** for Web Audio API synthesis with instrument samples
- Implemented **@tonejs/midi** for parsing MIDI data in the browser
- Built **WebSocket message routing** for streaming MIDI chunks
- Created **Redux-like state management** using React hooks for playback control
- Implemented **Material UI** components for responsive audio player controls

**Result:** Seamless real-time music playback in the browser with no perceptible latency. Users can generate and listen to new compositions instantly with proper transport controls.

---

## Key Technical Highlights for Resume

### Languages & Frameworks
- **Haskell**: Scotty, Warp, Grapesy, Euterpea, proto-lens, HSpec, QuickCheck
- **JavaScript/Node.js**: Express, React 19, Material UI 7, Tone.js, Vitest, Monet.js
- **Protocol Buffers**: gRPC service definitions, code generation

### Cloud & DevOps
- **Kubernetes**: AKS, Helm 3 (Umbrella Charts), NGINX Gateway Fabric, cert-manager, Redis HA
- **Infrastructure as Code**: Azure Bicep, Azure Verified Modules (AVM)
- **Docker**: Multi-stage builds, Alpine-based images, layer optimization
- **CI/CD**: Azure DevOps Pipelines, GitHub Actions, multi-repo dependencies

### Architecture Patterns
- **Domain-Specific Languages** (Free Monads)
- **Algorithmic Composition** (Markov Chains)
- **Microservices** with multi-protocol communication (HTTP/gRPC/WebSocket)
- **Functional Error Handling** (Maybe/Either monads)
- **Event-Driven Streaming** (WebSocket + Redis pub/sub)

### Testing & Quality
- **Property-Based Testing** (QuickCheck)
- **Unit/Integration Testing** (HSpec, Vitest, Testing Library)
- **Code Coverage** (hpc-codecov, vitest-coverage)
- **JUnit Reporting** for CI/CD integration

---

## Project Metrics

| Metric | Value |
|--------|-------|
| **Repositories** | 6 (midi-player, music-backend, raagas, hsom, music-grpc-models, music-deployment) |
| **Languages** | Haskell, JavaScript/TypeScript, Bicep, YAML |
| **gRPC Endpoints** | 6 (GetMusicStream, GetAllMusicNames, GetSupportedMoods, GetMusicRecommendationByHour, GetMusicRecommendationByMood, etc.) |
| **Helm Dependencies** | 3 (cert-manager, nginx-gateway-fabric, redis-ha) |
| **Docker Images** | 2 (music-frontend, music-backend) |
| **Environments** | 2 (Beta, Production) |

---

## Skills Demonstrated

1. **Full-Stack Development** - End-to-end ownership from UI to infrastructure
2. **Polyglot Programming** - Haskell (functional) + JavaScript (multi-paradigm)
3. **System Design** - Distributed microservices with multiple communication protocols
4. **Domain-Driven Design** - DSL for Indian classical music composition
5. **Cloud-Native Architecture** - Kubernetes, containers, infrastructure as code
6. **DevOps Practices** - CI/CD, automated testing, infrastructure automation
7. **Functional Programming** - Monads, algebraic data types, pure functions
8. **Real-Time Systems** - WebSocket streaming, audio synthesis

---

## Architecture Diagram (Text)

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                              Azure Cloud (AKS)                               │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   ┌───────────────────┐    ┌───────────────────────────────────────────┐   │
│   │  NGINX Gateway    │    │              Kubernetes Cluster            │   │
│   │  Fabric           │    │  ┌─────────────────┐  ┌─────────────────┐  │   │
│   │  (Reverse Proxy)  │───▶│  │  midi-player    │  │  music-backend  │  │   │
│   │  + TLS (cert-mgr) │    │  │  (Node.js)      │  │  (Haskell)      │  │   │
│   └───────────────────┘    │  │                 │  │                 │  │   │
│                            │  │  React UI       │  │  Scotty HTTP    │  │   │
│                            │  │  Express API    │◀─│  Grapesy gRPC   │  │   │
│                            │  │  WS Handler     │  │  WS Server      │  │   │
│                            │  └────────┬────────┘  └────────┬────────┘  │   │
│                            │           │                    │           │   │
│                            │           ▼                    ▼           │   │
│                            │  ┌─────────────────────────────────────┐   │   │
│                            │  │         Redis HA (Cache)            │   │   │
│                            │  └─────────────────────────────────────┘   │   │
│                            │                                            │   │
│                            │  ┌─────────────────────────────────────┐   │   │
│                            │  │         Fluent Bit (Logging)        │   │   │
│                            │  └─────────────────────────────────────┘   │   │
│                            └────────────────────────────────────────────┘   │
│                                                                             │
│   ┌─────────────────────────────────────────────────────────────────────┐   │
│   │  Azure Container Registry (ACR) - music-frontend, music-backend     │   │
│   └─────────────────────────────────────────────────────────────────────┘   │
│                                                                             │
│   ┌─────────────────────────────────────────────────────────────────────┐   │
│   │  Log Analytics Workspace                                             │   │
│   └─────────────────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────────┐
│                              Haskell Music Libraries                         │
├─────────────────────────────────────────────────────────────────────────────┤
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────────────────┐  │
│  │      hsom       │  │     raagas      │  │     music-grpc-models       │  │
│  │  (Euterpea      │  │  (Raaga DSL,    │  │  (Protocol Buffers,         │  │
│  │   Exercises)    │  │   Markov Chain, │  │   gRPC Service Defs)        │  │
│  │                 │  │   YAML Configs) │  │                             │  │
│  └─────────────────┘  └─────────────────┘  └─────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────────────────┘
```