# Interview Monologue - Arjun Shekar Bharadwaj

> **Total Duration:** ~3 minutes

---

## Opening Hook *(30 seconds)*

> "Hi, I'm Arjun, a Senior Software Engineer at Microsoft with over 12 years of experience designing large-scale distributed systems at Microsoft and Amazon. I specialize in building AI-powered platforms and cloud-native architectures that serve millions of users daily.
>
> At Amazon, I architected the AI agent system that powers Alexa's multi-device targeting for every voice request globally. At Microsoft Azure, I'm building compute platforms that orchestrate streaming and batch workloads at scale using Kubernetes and open-source technologies."

---

## Amazon Deep Dive - Top 3 Achievements *(90 seconds)*

### 1. AI Agent Platform for Alexa+ *(The Crown Jewel)*

> "My most impactful project was architecting the Action API - essentially an MCP server before MCP existed - that provided multi-device targeting recommendations to the LLMs handling millions of requests daily. Later, when more powerful models like Claude Sonnet were integrated, I updated it to use LLM-based reasoning with prompt engineering to do the determination of the optimal device without additional API calls. With this prompt engineered rule, I integrated with a test harness that achieved **90%+ success rates**. I also implemented RAG-like context injection and token optimization strategies that reduced latency through pre-computation and caching."

### 2. Cross-Team Technical Leadership - Vega OS Launch

> "I led a working group of **20+ stakeholders** including Principal Engineers across device, video, and middleware teams to launch Vega OS support. We faced a fundamental architecture incompatibility where the new devices reported state completely differently. I drove consensus through design reviews, proposed three solutions, and successfully delivered without blocking the beta launch."

### 3. Cost Optimization Through Design Patterns

> "I reduced downstream service calls by **50%** through architectural redesign. Instead of adding patches, I refactored the query system using the Strategy pattern, cutting CHRS dependency calls from **4 to 2** per request. This significantly reduced scaling costs for our global deployment."

---

## Microsoft Azure - Current Impact *(30 seconds)*

> "At Microsoft, I'm leading the Azure Resource Builder compute platform that processes billions of Azure resource events securely for monitoring, compliance, and automation. I separated the control plane from the data plane to fully automate provisioning, integrated Apache Airflow for workflow-driven processing, and introduced containerized runtimes so partners can bring engines like Flink, Spark, and RisingWave.
>
> I built the proof of concept, secured funding, and led a team of four to deliver the platform, cutting partner onboarding from weeks to a mostly self-service flow. I also champion AI adoption across engineering teams, evangelizing MCP servers, SWE agents, and custom prompts to accelerate development workflows."

---

## Passion Project - Technical Depth *(20 seconds)*

> "In my free time, I built a full-stack generative music platform that creates Indian classical music algorithmically. The backend uses Haskell with Markov chains for composition, gRPC and WebSocket for streaming, and it's deployed on Azure Kubernetes with Helm charts. It demonstrates my love for functional programming and end-to-end system design."

---

## Closing Statement *(10 seconds)*

> "I'm looking for opportunities where I can continue building AI-powered platforms at scale, lead cross-functional technical initiatives, and mentor engineers. I bring both deep technical expertise and the ability to drive consensus across large organizations."

---

## Common Follow-up Questions

### Why are you looking for new job opportunities?

> "I enjoyed my work at Microsoft and learned a great deal about building platforms on Kubernetes, Kafka, Airflow and Flink. However, my long-term passion is owning and building core distributed services end-to-end, from architecture through production, rather than primarily enabling platforms for downstream teams."

### What are the most important things that you are looking for in your next job?

> "I am looking at opportunities where I can drive the design, architecture and take ownership and build core services with distributed service architecture."

---

## Key Metrics to Remember

| Metric | Context |
|:-------|:--------|
| **12+ years** | Total experience |
| **Millions daily** | Requests handled by Action API |
| **90%+** | Test harness success rate |
| **20+** | Stakeholders led for Vega OS |
| **50%** | Reduction in downstream calls |
| **4 → 2** | CHRS calls per request |

---

*Good luck with your interview!*
