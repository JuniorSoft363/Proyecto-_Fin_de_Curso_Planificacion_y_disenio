# ADR-001: Selección del lenguaje de programación del servidor
## Estado
Aceptado

## Contexto

El equipo de desarrollo necesita seleccionar el lenguaje y framework del lado del servidor para implementar el sistema SIGCB-QR en un entorno web. Existen restricciones relacionadas con el tiempo disponible para el desarrollo académico, el nivel de conocimiento previo del equipo y la necesidad de implementar módulos de autenticación, préstamos, reservas, notificaciones y generación de reportes dentro del período establecido para el proyecto.

## Opciones consideradas

### Opción A: PHP 8.2 con Laravel 11

- Framework MVC maduro y ampliamente utilizado.
- Herramientas integradas para autenticación, correo electrónico y acceso a datos.
- Amplia documentación y comunidad.

### Opción B: Python con FastAPI

- Alto rendimiento.
- Excelente soporte para APIs REST.
- Curva de aprendizaje moderada para el equipo.

### Opción C: Node.js con Express

- Amplio ecosistema JavaScript.
- Buen soporte para aplicaciones web modernas.
- Requiere mayor experiencia en el manejo de dependencias y arquitectura.

## Decisión

Se selecciona **PHP 8.2 con Laravel 11** como tecnología para el desarrollo del backend del sistema SIGCB-QR.

La decisión se fundamenta en que esta alternativa ofrece una arquitectura MVC consolidada, facilita el desarrollo de aplicaciones web y reduce la curva de aprendizaje del equipo. Laravel proporciona mecanismos integrados para autenticación de usuarios, acceso a bases de datos mediante ORM, envío de correos electrónicos y organización estructurada del código. Estas características permiten implementar de forma eficiente las funcionalidades prioritarias del proyecto, incluyendo gestión de préstamos, reservas, multas, notificaciones y control de usuarios.

## Consecuencias positivas
- Reducción del tiempo de desarrollo gracias al conocimiento previo del equipo sobre PHP.
- Disponibilidad de herramientas integradas para autenticación y autorización.
- Facilidad para el acceso y gestión de bases de datos.
- Soporte nativo para envío de correos electrónicos institucionales.
- Amplia documentación y comunidad de soporte.
- Facilidad de despliegue en servidores web convencionales.
- Mejor mantenibilidad mediante el patrón MVC.

## Consecuencias negativas

- Menor flexibilidad frente a tecnologías especializadas en aplicaciones de tiempo real.
- Dependencia de las convenciones y estructura establecidas por Laravel.
- Posible sobrecarga de funcionalidades para proyectos pequeños.
- Requiere capacitación básica en las prácticas recomendadas del framework.

## Referencias

- PHP 8.2 Documentation
- Laravel 11 Documentation
- Requisitos funcionales y no funcionales del proyecto SIGCB-QR
- Documento de arquitectura del sistema