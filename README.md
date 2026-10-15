# Marketplace de Alojamientos - Inversiones LR

Marketplace web de alojamientos temporales que conecta anfitriones con huéspedes: publicación, búsqueda, disponibilidad, cotización, reservas con pago simulado, cancelaciones, reseñas, auditoría y reportes. Proyecto del curso Ingeniería de Software 1, Universidad El Bosque.

## Equipo

| Integrante | Bloque |
|---|---|
| Jenny Alejandra Gómez López | Gestión del proyecto, Jira e historias de usuario |
| Brian Steban Rodríguez Ortiz | Negocio y requerimientos |
| Nicole Diane Cruz García | Procesos, casos de uso y dominio |
| Tomás Álzate Yepes | Arquitectura y diseño técnico |

## Arquitectura

Arquitectura orientada a servicios: 11 servicios independientes (Spring Boot 3, Java 21), cada uno con su API REST y su base de datos PostgreSQL, un API Gateway como única entrada del front y un frontend en Angular. Pagos simulados con Stripe en modo prueba.

| Componente | Carpeta | Puerto |
|---|---|---|
| Frontend (Angular) | `frontend/` | 4200 |
| API Gateway | `api-gateway/` | 8080 |
| Identidad y Usuarios | `services/identidad` | 8081 |
| Alojamientos | `services/alojamientos` | 8082 |
| Disponibilidad | `services/disponibilidad` | 8083 |
| Búsqueda | `services/busqueda` | 8084 |
| Cotización | `services/cotizacion` | 8085 |
| Reservas y Cancelaciones | `services/reservas` | 8086 |
| Pagos | `services/pagos` | 8087 |
| Notificaciones | `services/notificaciones` | 8088 |
| Reseñas | `services/resenas` | 8089 |
| Auditoría y Trazabilidad | `services/auditoria` | 8090 |
| Reportes y Dashboard | `services/reportes` | 8091 |

## Estructura del repositorio

```
.
├── api-gateway/          API Gateway (Spring Cloud Gateway)
├── services/             Los 11 servicios (un módulo Maven cada uno)
├── frontend/             Aplicación Angular
├── openapi.yaml          Contrato consolidado (API pública)
├── openapi_por_servicio/ Un contrato OpenAPI por servicio
├── docker/               Scripts de apoyo (bases de datos)
├── docker-compose.yml    Entorno local
├── docs/                 Plan del pipeline de CI
└── .github/              Plantilla de Pull Request
```

## Cómo ejecutar

El entorno completo se levanta con Docker Compose (se completa en la Entrega 2).

1. Copiar `.env.example` como `.env` y completar los valores (solo claves de prueba de Stripe).
2. Ejecutar `docker compose up --build -d`.
3. Abrir `http://localhost:4200`.

## Flujo de trabajo Git

Historia Jira, branch, commits, Pull Request, GitHub Actions, pruebas, SonarCloud Quality Gate, revisión y merge.

- La rama `main` está protegida: solo se integra mediante Pull Request con al menos una revisión de otro integrante.
- Ramas: `feature/MKT-XX-descripcion`, `fix/MKT-XX-descripcion`, `chore/MKT-XX-descripcion`.
- Commits: `MKT-XX: descripción del cambio`.
- Merge: Squash and merge.

## Documentación

- Confluence: https://alejagomez026.atlassian.net/wiki/spaces/PMA
- Jira: proyecto MKT (Proyecto marketplace de alojamientos)
