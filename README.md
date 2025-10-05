# DriversHub Monorepo

Phase 0 bootstrap for DriversHub multi-service platform. See `docs/README.md` for the functional specification and roadmap.

## Repository Layout

- `apps/`: Client applications (Flutter mobile, Next.js web)
- `services/`: Backend microservices (NestJS, FastAPI)
- `proto/`: Shared gRPC contracts
- `infra/`: Infrastructure as code (Helm, Terraform)
- `packages/`: Shared libraries and configurations
- `docs/`: Documentation and operational playbooks

## Getting Started

```bash
pnpm install
```

See `docs/README.md` and the service-specific READMEs for development workflows.
