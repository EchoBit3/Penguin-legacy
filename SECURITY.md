# Security policy

## Scope

This policy covers the public repository, the documentation branch, future
Godot client code, local save data and any future network subsystem.

## Repository rules

- Never commit passwords, tokens, private keys, personal data or private assets.
- Do not publish files from `assets-private/`.
- Do not run unknown code from issues, pull requests or external assets.
- Treat Godot addons, native extensions and imported packages as executable code.
- Record every third-party dependency, version, source and license before use.
- Do not load native extensions from unverified paths.
- Review file paths before opening, extracting or importing content.
- Keep GitHub permissions at least privilege.
- Protect `main` and require review before merge.
- Agents and subagents receive only the access required for their task.
- Read-only reviewers do not edit, commit or push.
- No agent may bypass branch protection or expose secrets in output.
- Agents are an explicit trust boundary and receive no credentials by default.

## Reporting a vulnerability

Do not publish credentials, personal data or exploit instructions in a public
issue. Use GitHub's private vulnerability reporting from the Security tab when
it is enabled for this repository. If it is not enabled, contact the repository
owner through a private GitHub channel and do not disclose technical details
publicly while waiting for acknowledgement.

Include affected commit, component, reproduction steps, impact and suggested
containment. Do not test systems or accounts that are not explicitly in scope.

## Severity

- Critical: active compromise, secret exposure or material personal-data breach.
- High: privilege escalation, remote code execution or public release blocker.
- Medium: limited confidentiality, integrity or availability impact.
- Low: defense-in-depth or documentation weakness without direct exploit path.

## Response goals

The maintainer records receipt, validates the report, assigns severity,
contains the affected component and documents the fix or accepted risk. A
public release is blocked while a critical issue remains uncontained. If a
secret was committed, it is treated as compromised: revoke or rotate it first,
then remove the exposure from the current tree and history using an approved
maintainer procedure.

## Supported baseline

The supported baseline is the latest commit merged to `dev` and any release
tag explicitly marked as supported in the changelog. Earlier commits are not
assumed to receive security fixes.

## Over to you

Security is a release gate, not a document that is completed once and forgotten.
