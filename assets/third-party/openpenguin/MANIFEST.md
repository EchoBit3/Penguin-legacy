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

## Set 2: Town + HUD + base (2026-10-05)

Origen: mismo repositorio y commit `e628a25` del 2026-10-05. Carpetas
copiadas sin modificar, conservando rutas `res://` para que las escenas
originales carguen tal cual:

- `rooms/town/` (Town AS1/AS2, AS3 y version OG)
- `hud/` (pantallas load y login, fuentes y sprites)
- `other/` (botones y logica del pinguino)
- `docs/original-snowball-engine.md` (guia original de conversion)

Volumen: 1631 archivos, 23 MB. Estado `risk-accepted` con la misma
politica del Set 1. Verificado: `rooms/town/towncenter.tscn` instancia
en Godot 4.7.2 headless con 26 nodos raiz y los tests F1 siguen en verde.
Pendiente: autoloads `Load`/`Astrobarrierplayer` del proyecto original
para la navegacion entre salas.

## Set 3: Coffee Shop + Box Dimension (2026-10-05)

Origen: mismo repositorio y commit `e628a25`. Carpetas copiadas sin
modificar:

- `rooms/cofffee_shop/` (asi se escribe upstream, con triple f)
- `rooms/box_dimension/` (en desarrollo upstream)

Volumen total de `rooms/`: 69 MB. Estado `risk-accepted`. Verificado:
`coffee.tscn` y `box_dimension.tscn` instancian en Godot 4.7.2 headless
sin errores de carga.
