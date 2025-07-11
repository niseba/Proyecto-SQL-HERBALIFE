# SQL Data Analysis Portfolio Project: SUPLEMENTOS

Este proyecto representa un caso completo de análisis de datos utilizando SQL, simulando un escenario de ventas y distribución de productos de bienestar y nutrición similar al de empresas como **Herbalife, Omnilife o Nature's Sunshine**.  

El objetivo es demostrar **solvencia técnica en SQL aplicada al análisis de datos**, especialmente en el contexto de **comercio electrónico, ventas multinivel, control de inventarios y seguimiento de clientes y devoluciones**.  

---

## 🧱 Diseño de la base de datos

La base de datos fue diseñada con una estructura **altamente realista**, modelando un entorno empresarial completo. Incluye las siguientes tablas:

- `customers`: clientes y distribuidores, incluyendo país, email y si están o no en el modelo de distribución.
- `distributors`: jerarquía multinivel de distribuidores (con `upline_id`, `level` y relaciones en red).
- `products`: productos del portafolio con categorías como "Control de peso", "Cuidado de la piel", etc.
- `categories`: categorías asociadas a los productos.
- `orders`: órdenes realizadas (incluyendo errores realistas como órdenes sin cliente o sin monto).
- `order_items`: detalle por producto vendido en cada orden (cantidad, precio unitario, etc.).
- `returns`: productos devueltos con razón (daño, vencimiento, etc.).
- `discounts`: reglas de descuento por cantidad mínima.
  
Esta estructura **emula fielmente** escenarios reales que enfrentan analistas de datos en empresas de ventas por catálogo, redes multinivel, ecommerce y retail.

---

## 🎯 Objetivos prácticos

Con esta base, se resolvieron más de 15 ejercicios enfocados en análisis **realistas**:

- Exploración de datos incompletos o inconsistentes
- Análisis de ingresos, rotación, ventas cruzadas
- Control de stock vs ventas (ventas sin inventario)
- Análisis de devoluciones por producto y motivo
- Detección de clientes con alta actividad
- Consultas condicionales (`CASE`), subconsultas, agrupaciones

Cada consulta incluye lógica real de negocio y aplica filtros coherentes, como excluir órdenes con `NULL` en total, evitar duplicaciones, y más.

---

## 🗂 Estructura del repositorio

```bash
sql-data-analysis-project/
│
├── README.md                 # Este archivo
├── database.sql              # Script de creación y llenado de la base de datos completa
├── queries/                  # Carpeta con los ejercicios resueltos
│   ├── 01_ingresos_por_categoria.sql
│   ├── 02_rotacion_productos.sql
│   ├── 03_clientes_activos.sql
│   ├── …



