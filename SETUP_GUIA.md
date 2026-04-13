# 🚗 AutoRadar — Guía de Instalación Dashboard Supabase

## 🎯 Objetivo
Conectar el dashboard `car-tracker-supabase.html` con tu base de datos Supabase en **tiempo real**.

---

## 📋 Paso 1: Obtener la Anon Key de Supabase

### Localización:
1. Ve a **Supabase Dashboard** → Tu proyecto `autoradar`
2. Click izquierdo en **Settings** (engranaje en la barra izquierda)
3. Selecciona **API** en el menú
4. Busca la sección **"Publishable Keys"** o **"Project URL"**
5. Verás:
   - **Project URL**: `https://tingcbepyaqskulrdgiw.supabase.co`
   - **Anon/Public Key**: `sb_publishable_xxxxxxxxxxxx...`

### Copia exactamente:
- **URL del proyecto** (ej: `https://tingcbepyaqskulrdgiw.supabase.co`)
- **Anon Key** (la que empieza por `sb_publishable_`)

---

## 📝 Paso 2: Actualizar el HTML

Abre el archivo `car-tracker-supabase.html` y busca alrededor de la **línea 350** (en la sección `<script>`):

```javascript
// ─────────────────────────────────────────────
// CONFIG - REEMPLAZA CON TUS VALORES
// ─────────────────────────────────────────────
const SUPABASE_URL = 'https://tingcbepyaqskulrdgiw.supabase.co';
const SUPABASE_ANON_KEY = 'AQUI_VA_TU_ANON_KEY'; // ← REEMPLAZA ESTO
```

### Reemplaza:
1. `SUPABASE_URL` → Tu URL de Supabase (copiar tal cual)
2. `SUPABASE_ANON_KEY` → Tu anon key completa (copiar tal cual)

**Ejemplo:**
```javascript
const SUPABASE_URL = 'https://tingcbepyaqskulrdgiw.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...';
```

**⚠️ IMPORTANTE:** La anon key es PÚBLICA y está segura en el cliente (solo lectura en tabla coches_anuncios).

---

## 🔧 Paso 3: Preparar la Tabla en Supabase

### Verificar que tienes la tabla correcta:

En Supabase → **SQL Editor**, ejecuta:

```sql
-- Ver estructura de la tabla
DESCRIBE coches_anuncios;
```

Deberías ver estas columnas:
- `id` (PRIMARY KEY)
- `id_unico` (UNIQUE)
- `portal_id` (VARCHAR)
- `portal` (VARCHAR)
- `titulo` (VARCHAR)
- `precio` (DECIMAL/NUMERIC)
- `km` (INTEGER)
- `year` (VARCHAR)
- `lugar` (VARCHAR)
- `link` (TEXT)
- `fecha_sync` (TIMESTAMP)
- `es_nuevo` (BOOLEAN)
- `created_at` (TIMESTAMP)

Si la tabla NO existe, ejecuta en **SQL Editor** de Supabase:

```sql
CREATE TABLE IF NOT EXISTS coches_anuncios (
  id SERIAL PRIMARY KEY,
  id_unico VARCHAR(255) UNIQUE NOT NULL,
  portal_id VARCHAR(50) NOT NULL,
  portal VARCHAR(100) NOT NULL,
  titulo VARCHAR(500),
  precio DECIMAL(10,2) DEFAULT 0,
  km INTEGER DEFAULT 0,
  year VARCHAR(10),
  lugar VARCHAR(200),
  link TEXT,
  fecha_sync TIMESTAMP NOT NULL,
  es_nuevo BOOLEAN DEFAULT true,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Índices para velocidad
CREATE INDEX idx_portal ON coches_anuncios(portal_id);
CREATE INDEX idx_fecha ON coches_anuncios(fecha_sync DESC);
CREATE INDEX idx_precio ON coches_anuncios(precio);
CREATE INDEX idx_nuevo ON coches_anuncios(es_nuevo);
```

---

## 🛡️ Paso 4: Configurar Row Level Security (RLS)

Para que el dashboard pueda leer, pero no modificar datos:

### En Supabase:

1. Ve a **Authentication** → **Policies**
2. Selecciona tabla `coches_anuncios`
3. Haz click en **New Policy** (botón azul)
4. Selecciona **"For SELECT"** (solo lectura)
5. En el editor de SQL que aparece, pega:

```sql
CREATE POLICY "Allow public read" ON coches_anuncios
FOR SELECT
USING (true);
```

6. Click en **Review** y luego **Save policy**

✅ Ahora el dashboard puede leer todos los anuncios sin autenticación.

---

## 🚀 Paso 5: Desplegar el Dashboard

### Opción A: En tu mismo servidor (Recomendado)
```bash
# Copiar el HTML a tu servidor (ej: Hostinger, VPS, etc)
scp car-tracker-supabase.html usuario@tuserver.com:/var/www/autoradar/

# O simplemente: Abre en navegador con doble click
open car-tracker-supabase.html
```

### Opción B: Vercel (Gratis, con dominio)
1. Ve a [vercel.com](https://vercel.com)
2. Click en **New Project**
3. Sube el archivo `car-tracker-supabase.html`
4. Deploy automático
5. Recibirás un URL como `https://autoradar-xyz.vercel.app`

### Opción C: GitHub Pages (Gratis)
1. Sube el archivo a un repo GitHub
2. En **Settings** → **Pages** → Source: `main branch`
3. URL automática: `https://tuusuario.github.io/repo-name/car-tracker-supabase.html`

---

## ✅ Paso 6: Verificar que Funciona

1. Abre el dashboard en navegador
2. Verás en la esquina superior derecha:
   - 🟢 Punto verde = Conectado a Supabase
   - 🟡 Punto amarillo = Sincronizando
   - 🔴 Punto rojo = Error

3. Verifica en la consola del navegador:
   - Click derecho → **Inspect** → Tab **Console**
   - Deberías ver `"success": Cargados X anuncios desde Supabase`

---

## 🔄 Integración con n8n

El workflow n8n sigue insertando datos en Supabase cada 30 minutos. El dashboard se actualiza automáticamente cada 60 segundos.

### Para forzar una actualización manual:
Click en el botón **"Actualizar"** (arriba a la derecha)

---

## 🐛 Troubleshooting

### ❌ "Failed to fetch" o error de conexión

**Causa:** Anon key incorrecta o URL mal copiada

**Solución:**
1. Verifica que no hay espacios extras
2. Copia de nuevo desde Supabase Settings
3. Abre **Console** (F12) y revisa el error exacto

### ❌ Tabla vacía (0 anuncios)

**Causa:** La tabla existe pero no tiene datos

**Solución:**
1. En Supabase → **SQL Editor**, ejecuta:
   ```sql
   SELECT COUNT(*) FROM coches_anuncios;
   ```
2. Si muestra `0`, los datos no se han sincronizado aún
3. Espera a que n8n ejecute el workflow (cada 30 min) o fuerza manualmente

### ❌ RLS bloqueando lectura

**Síntoma:** Console muestra "row level security" error

**Solución:**
- Ve a **Authentication → Policies**
- Asegúrate de que existe la política `"Allow public read"` en la tabla

### ❌ CORS error

**Causa:** Navegador bloqueando solicitud a Supabase desde otro dominio

**Solución:**
- Supabase permite CORS por defecto
- Si persiste, contacta con soporte de Supabase

---

## 📊 Datos que el Dashboard Muestra

| Campo | Origen | Actualización |
|-------|--------|---------------|
| Total anuncios | COUNT(*) desde Supabase | Cada 60s |
| Portales activos | Agregación por `portal_id` | Cada 60s |
| Precio medio | AVG(precio) | Cada 60s |
| Más barato | MIN(precio) | Cada 60s |
| Última sync | MAX(fecha_sync) | Cada 60s |
| Tabla principal | SELECT * con paginación | Cada 60s |

---

## 🎨 Personalización

### Cambiar intervalo de actualización automática

Busca en el HTML (línea ~450):
```javascript
autoRefreshInterval = setInterval(() => {
  if (!isLoading) loadData();
}, 60000);  // ← 60000 ms = 60 segundos
```

Cambia `60000` a:
- `30000` = 30 segundos
- `120000` = 2 minutos
- `300000` = 5 minutos

### Cambiar tamaño de página

Busca:
```javascript
const PAGE_SIZE = 20;
```

Cambia a `10`, `15`, `30`, etc.

### Agregar más portales

En la sección `PORTALES`, agrega:
```javascript
{ id: 'nuevaportal', name: 'Nuevo Portal', emoji: '🆕' },
```

---

## 📞 Soporte

Si algo no funciona:

1. **Verifica la consola** (F12 → Console)
2. **Copia el error exacto**
3. **Revisa que la anon key está bien copiada**
4. **Comprueba que tienes datos en Supabase** (SQL Editor)
5. **Contacta con soporte de Supabase** si es error de API

---

## 🎉 ¡Listo!

Tu dashboard AutoRadar está conectado y actualizándose en tiempo real desde Supabase.

**Próximos pasos:**
- Configurar auto-actualización en n8n (si no está ya)
- Personalizar colores y diseño según tu marca
- Compartir el URL del dashboard con tu equipo
- Configurar alertas si es necesario
