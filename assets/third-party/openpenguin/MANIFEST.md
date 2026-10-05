# Manifest: penguin skin fan-made

Origen: https://github.com/GuiMar10/OpenPenguin, carpeta
`other/penguinlogic` (escena `penguin.tscn`, sprites `DefineSprite_40`,
`DefineSprite_49`, `DefineSprite_58` y formas `6.svg`, `8.svg`, `10.svg`).
Fecha de consulta: 2026-10-05.

## Estado legal

`risk-accepted`: el repositorio OpenPenguin distribuye su codigo bajo MIT,
pero estos sprites derivan de material de Club Penguin y no tienen licencia
verificada para redistribucion. Se usan bajo la politica de fan project
gratuito con creditos y retirada inmediata ante reclamo del titular. Ver
`CREDITS.md`, `docs/08-legal-privacidad-y-derechos.md` y
`docs/decisions/ADR-0001-fan-project-publico.md`.

## Contenido

27 archivos SVG copiados sin modificar, salvo reubicacion de rutas:

- `penguinlogic/sprites/DefineSprite_40/1.svg` a `8.svg`
- `penguinlogic/sprites/DefineSprite_49/1.svg` a `8.svg`
- `penguinlogic/sprites/DefineSprite_58/1.svg` a `8.svg`
- `penguinlogic/shapes/6.svg`, `8.svg`, `10.svg`

## Integridad

Verificar con `sha256sum -c` desde `assets/third-party/openpenguin`
usando el archivo `SHA256SUMS`. Cualquier archivo modificado o agregado
requiere una nueva entrada en este manifiesto antes de su PR.
