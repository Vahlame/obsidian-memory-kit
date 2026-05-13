# ADR-0015: Document a generic privacy posture for PII-adjacent deployments

- **Status:** Accepted
- **Date:** 2026-05-13
- **Deciders:** maintainer

## Context

Some adopters wire this pattern into environments that process **personal data** (end users, customers, or employees). Laws and regulator expectations vary by jurisdiction and sector. The repo should give **engineering-oriented documentation** (data minimization, retention, access control, observability redaction) without anchoring to a specific country, agency, or private project.

## Decision

Maintain **jurisdiction-neutral** privacy guidance: checklists that teams map to their own DPIA or legal review with counsel. Telemetry docs stress **no raw PII** in trace attributes and **opt-in** exporters. Do not ship legal claims or named statutes in this public repository.

## Consequences

- **Positive:** Reduces accidental coupling between this OSS guide and any single customer or geography.
- **Negative:** Readers must still engage counsel for binding compliance work.
- **Neutral:** Optional `age` encryption and OTel/Langfuse docs remain generic.

## Alternatives considered

- **Named statutes / sector case studies in-repo:** Rejected for this public repo — too easy to correlate with unrelated private workstreams.

## References

- `docs/observability.md`
- `SECURITY.md`
