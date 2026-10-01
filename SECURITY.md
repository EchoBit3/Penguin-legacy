# Politica de seguridad

## Alcance

Esta politica cubre el repositorio publico, las ramas, la documentacion, el
futuro cliente Godot, los guardados locales y cualquier subsistema de red.

## Reglas del repositorio

- Nunca subir contrasenas, tokens, llaves privadas, datos personales o assets privados.
- No publicar archivos de `assets-private/`, `research-private/` o `research-output/`.
- No ejecutar codigo desconocido recibido en issues, pull requests o assets externos.
- Tratar addons de Godot, extensiones nativas y paquetes importados como codigo ejecutable.
- Registrar dependencia, version, fuente y licencia antes de incorporarla.
- No cargar extensiones nativas desde rutas no verificadas.
- Revisar rutas antes de abrir, extraer o importar contenido.
- Mantener permisos de GitHub con minimo privilegio.
- Proteger `main` y exigir revision antes de fusionar.
- Dar a cada agente o subagente solo el acceso necesario para su tarea.
- Los agentes revisores trabajan en modo lectura y no hacen commit ni push.
- Ningun agente puede saltarse la proteccion de ramas ni exponer secretos.
- Los agentes son una frontera de confianza y no reciben credenciales por defecto.

## Reportar una vulnerabilidad

No publiques credenciales, datos personales ni instrucciones de explotacion en
un issue publico. Usa el reporte privado de vulnerabilidades de GitHub desde la
pestana Security cuando este habilitado. Si no esta habilitado, contacta al
owner por un canal privado de GitHub y espera confirmacion sin publicar detalles
tecnicos.

Incluye commit afectado, componente, pasos de reproduccion, impacto y
contencion sugerida. No pruebes sistemas ni cuentas fuera del alcance explicito.

## Severidad

- Critica: compromiso activo, exposicion de secretos o fuga material de datos personales.
- Alta: escalada de privilegios, ejecucion remota o bloqueo de release publica.
- Media: impacto limitado en confidencialidad, integridad o disponibilidad.
- Baja: defensa en profundidad o debilidad documental sin ruta directa de explotacion.

## Respuesta

El maintainer registra la recepcion, valida el reporte, asigna severidad,
contiene el componente y documenta la correccion o el riesgo aceptado. Una
release publica queda bloqueada mientras exista un problema critico sin
contener.

Si se sube un secreto, se considera comprometido: se revoca o rota primero y
despues se elimina la exposicion del arbol actual y del historial mediante un
procedimiento aprobado por el maintainer.

## Baseline soportada

La baseline soportada es el ultimo commit fusionado en `dev` y cualquier tag de
release marcado expresamente como soportado en el changelog. Los commits
anteriores no se consideran automaticamente soportados.

## Over to you

La seguridad es un gate de release, no un documento que se completa una sola vez.
