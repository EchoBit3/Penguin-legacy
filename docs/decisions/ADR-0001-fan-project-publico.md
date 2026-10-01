# ADR-0001: Como publicamos un fan project sin ocultar sus riesgos?

Estado: aceptada con riesgo documentado
Fecha: 2026-09-30

## Contexto

El proyecto busca recuperar una experiencia nostalgica asociada a un juego conocido. El repositorio sera publico y se trabajara con recursos cuyo titular puede ser un tercero.

## Decision

Penguin Legacy sera un fan project gratuito, no afiliado, con creditos y contacto para solicitudes de retirada. El repositorio publico no incorporara material de terceros sin licencia o permiso verificable. Los recursos de referencia local, si se usan, quedan fuera del repositorio y no forman parte de una release.

## Motivo

Publicar codigo, documentacion y placeholders permite avanzar sin afirmar derechos que no tenemos. Mantener un registro de riesgo permite continuar el prototipo sin confundir ausencia de lucro con autorizacion.

## Consecuencias

Positivas:

- Se puede validar arquitectura y loop.
- Se conserva una ruta publica de colaboracion.
- Se reducen secretos, binarios y material no trazable.
- La retirada de contenido es operable.

Negativas:

- El primer build no tendra fidelidad visual completa.
- La nostalgia debe validarse por experiencia, no por copia.
- Una release publica con assets no autorizados queda bloqueada.

## Reversion

Si se obtiene permiso escrito compatible, se crea una nueva ADR y se actualiza el manifest. Si un titular objeta, se retira el material y se vuelve a placeholder.

## Evidencia

- Ley 17.336: https://www.bcn.cl/leychile/navegar?idNorma=28933, consultada 2026-09-30.
- OpenPenguin LICENSE: https://raw.githubusercontent.com/GuiMar10/OpenPenguin/main/LICENSE, consultada 2026-09-30.
- OpenPenguin README: https://raw.githubusercontent.com/GuiMar10/OpenPenguin/main/README.md, consultada 2026-09-30.

## Over to you

Esta decision debe revisarse antes de monetizar, abrir cuentas, habilitar chat o distribuir un paquete final.
