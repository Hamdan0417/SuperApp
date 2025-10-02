# DriversHub Specification Summary

DriversHub is a unified platform for professional drivers that aggregates ride hailing, food delivery, and logistics providers. Key capabilities include:

- **Multi-tenant operations** for partners and DriversHub administrators.
- **Driver companion mobile app** with bilingual Arabic/English experience and RTL/LTR support.
- **Partner and admin portals** for fleet management, order oversight, and support operations.
- **Service mesh of backend microservices** communicating via gRPC with a GraphQL BFF for aggregated client reads.
- **Event-driven flows** powered by Kafka for real-time order lifecycle updates and payout events.
- **Secure identity layer** using OIDC, JWT with refresh tokens, and RBAC for driver, partner_admin, dh_admin, and support roles.
- **Financial tooling** with wallet and ledger management, supporting double-entry accounting.
- **Quality-first engineering** with automated tests, linting, SAST hooks, and comprehensive documentation.

## Phase Roadmap

1. **PR1 – Infra Bootstrap**: Docker/Helm/Terraform scaffolding, CI pipelines, repository conventions.
2. **PR2 – Proto Contracts**: Define gRPC contracts and generate TypeScript/Python client/server stubs.
3. **PR3 – Identity Service**: Implement OIDC provider, RBAC, PostgreSQL schema, and automated tests.
4. **PR4 – Orders Service**: REST admin interface, gRPC APIs, Kafka integration, and persistence.
5. **PR5 – GraphQL BFF**: Schema design, resolver mocks, and gateway integration.
6. **PR6 – Web Portals**: Next.js apps for admin/partner with i18n and RTL support.
7. **PR7 – Driver Mobile App**: Flutter scaffolding with localization assets.
8. **PR8 – Wallet Service**: Double-entry ledger implementation with PostgreSQL and test coverage.

## Development Principles

- Official integrations only; no scraping of partner systems.
- Favor typed interfaces, shared tooling, and consistent observability.
- Document operational playbooks alongside infrastructure definitions.
- Protect secrets by using environment variables and secret managers only.
