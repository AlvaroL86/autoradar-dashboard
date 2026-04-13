# 🚀 AutoRadar — Deployment a Vercel (Gratis)

## ✅ Lo que tienes ya configurado:
- ✓ Anon key de Supabase: `sb_publishable_WdJgGgLvt76CgX-vk7jV5w_YYYs3LlV`
- ✓ HTML listo para producción: `index.html`
- ✓ Sin dependencias externas complejas

---

## 🎯 Opción A: Deploy en Vercel (5 min) — RECOMENDADO

### Paso 1: Crear una carpeta para el proyecto
```bash
mkdir autoradar-dashboard
cd autoradar-dashboard
```

### Paso 2: Copiar archivos
```bash
# Copiar el HTML descargado
cp /descargas/index.html .
cp /descargas/car-tracker-supabase.html .
```

O simplemente abre `/descargas/index.html` en tu editor y guárdalo en una carpeta.

### Paso 3: Crear cuenta en Vercel (si no la tienes)
1. Ve a **[vercel.com](https://vercel.com)**
2. Click en **Sign Up**
3. Elige GitHub, GitLab o email
4. Completa el registro

### Paso 4: Deploy automático

#### Opción A1: Mediante GitHub (más fácil)
1. Crea un repo en **[github.com](https://github.com/new)**
2. Nombre: `autoradar-dashboard`
3. Haz público (para que Vercel pueda acceder)
4. Sube los archivos:
```bash
cd autoradar-dashboard
git init
git add .
git commit -m "Initial commit - AutoRadar Dashboard"
git remote add origin https://github.com/tuusuario/autoradar-dashboard.git
git push -u origin main
```

5. En **[vercel.com](https://vercel.com)**:
   - Click en **New Project**
   - Busca tu repo `autoradar-dashboard`
   - Click en **Import**
   - Vercel detectará automáticamente que es un HTML estático
   - Click en **Deploy**

✅ **Listo** — En 30 segundos tendrás una URL como:
```
https://autoradar-dashboard.vercel.app
```

#### Opción A2: Sin GitHub (directo desde Vercel)
1. Ve a **[vercel.com/new](https://vercel.com/new)**
2. Click en **Web Development**
3. Sube los archivos HTML
4. Click en **Deploy**

---

## 🎯 Opción B: GitHub Pages (Gratis, sin Vercel)

1. Sube a GitHub (mismo pasos de arriba)
2. En tu repo → **Settings** → **Pages**
3. Branch: `main`
4. Folder: `/root` o `/docs` (donde esté index.html)
5. Click en **Save**

URL automática:
```
https://tuusuario.github.io/autoradar-dashboard
```

---

## 🎯 Opción C: Tu propio servidor (si tienes uno)

### Si tienes Hostinger, VPS o servidor dedicado:

```bash
# Conectar por SSH
ssh usuario@tuserver.com

# Crear carpeta para el proyecto
mkdir -p /var/www/autoradar
cd /var/www/autoradar

# Descargar el archivo (desde tu PC)
# Opción 1: SCP
scp index.html usuario@tuserver.com:/var/www/autoradar/

# Opción 2: Git
git clone https://github.com/tuusuario/autoradar-dashboard.git .
```

**Si usas Nginx:**
```nginx
server {
    listen 80;
    server_name autoradar.tudominio.com;
    root /var/www/autoradar;
    
    index index.html;
    
    location / {
        try_files $uri $uri/ =404;
    }
}
```

**Si usas Apache:**
```apache
<VirtualHost *:80>
    ServerName autoradar.tudominio.com
    DocumentRoot /var/www/autoradar
    
    <Directory /var/www/autoradar>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```

Reinicia el servidor y accede a:
```
https://autoradar.tudominio.com
```

---

## 📊 Comparativa de Opciones:

| Opción | Coste | Facilidad | URL | Velocidad |
|--------|-------|-----------|-----|-----------|
| **Vercel** | Gratis | ⭐⭐⭐⭐⭐ | autoradar.vercel.app | ⚡ Muy rápido |
| **GitHub Pages** | Gratis | ⭐⭐⭐⭐ | tuusuario.github.io/autoradar | ⚡ Rápido |
| **Servidor propio** | Ya pagado | ⭐⭐⭐ | autoradar.tudominio.com | ⚡ Depende |

**Recomendación:** Vercel es la más fácil y rápida. GitHub Pages es gratis pero más manual.

---

## ✅ Verificar que funciona

1. Abre la URL en navegador
2. Deberías ver el dashboard cargando
3. Espera 2-3 segundos
4. Aparecerá un **punto verde** en la esquina superior derecha
5. Se mostrarán los datos de Supabase

---

## 🔄 Actualizar después de cambios

### Con Vercel + GitHub:
```bash
# Cambiar algo en el código
# Por ejemplo: editar colors
git add .
git commit -m "Update colors"
git push
```
✅ Vercel redeploy automático en < 1 min

### Con Vercel directo:
- Sube el archivo nuevamente en [vercel.com](https://vercel.com)

### Con GitHub Pages:
- Sube cambios y haz push, actualización automática

### Con servidor propio:
```bash
# Editar archivo en servidor
ssh usuario@server
nano /var/www/autoradar/index.html
# O usar SCP para reemplazar
scp index.html usuario@server:/var/www/autoradar/
```

---

## 🎨 Personalizar tu dominio

### En Vercel:
1. Tu proyecto → **Settings** → **Domains**
2. Agrega tu dominio personalizado (si tienes)
3. Sigue instrucciones de DNS

### En GitHub Pages:
1. Tu repo → **Settings** → **Pages** → **Custom domain**
2. Escribe tu dominio
3. Actualiza DNS en tu registrador

### En servidor propio:
- Ya lo tienes configurado (autoradar.tudominio.com)

---

## 🔐 Seguridad

✅ **Tu anon key es segura** porque:
- La key está en el navegador (normal para APIs públicas)
- Supabase RLS permite solo **lectura**
- n8n inserta con credenciales de servicio (no se ve)

⚠️ **No compartas:**
- Secret key de Supabase (la diferente a anon)
- Contraseñas de n8n o bases de datos

---

## 🚨 Troubleshooting Deploy

### ❌ "Error 404 - Not Found"
**Causa:** El archivo no está en la raíz
**Solución:** Asegúrate de que `index.html` está en la carpeta raíz

### ❌ "No se conecta a Supabase"
**Causa:** Anon key incorrecta o RLS bloqueando
**Solución:** Ver `SETUP_GUIA.md` - Paso 4 (RLS)

### ❌ "Página en blanco"
**Causa:** Error de JavaScript en consola
**Solución:** F12 → Console → mira el error exacto

### ❌ "Lentitud extrema"
**Causa:** Supabase cargando muchos datos
**Solución:** En el HTML, cambiar LIMIT 500 a LIMIT 100

---

## 📱 Acceso desde móvil

Una vez deployed, puedes:
- ✅ Abrir en cualquier navegador
- ✅ Agregar a pantalla de inicio (webapp)
- ✅ Compartir URL con tu equipo
- ✅ Recibir datos en tiempo real

---

## 🎯 URL Final (Cuando esté deployed)

Comparte esta URL con tu equipo:
```
https://autoradar-dashboard.vercel.app
(o tu dominio personalizado)
```

Cada 60 segundos se actualiza con los últimos datos de Supabase.

---

## 📊 Monitoreo después del deploy

### Verificar que funciona:
1. Abre el dashboard
2. Verifica que muestra datos
3. Espera a que n8n ejecute (cada 30 min)
4. Actualiza el dashboard (botón Actualizar)

### Ver logs en Vercel:
- Tu proyecto → **Deployments** → últimas
- Tab **Logs** para ver cualquier error

### Ver logs en n8n:
- n8n.srv1099553.hstgr.cloud → Workflow → Executions

---

## ✨ Siguiente: Alertas y Notificaciones

Si quieres que te avise cuando:
- ✅ Baja el precio de un coche
- ✅ Aparece un anuncio nuevo
- ✅ Falla la sincronización

Podemos agregar:
- Webhook a Slack/Discord
- Alertas por SMS
- Notificaciones push en móvil

---

## 📞 Resumen de URLs importantes:

| Servicio | URL |
|----------|-----|
| **Tu Dashboard** | https://autoradar-dashboard.vercel.app |
| **Supabase** | https://tingcbepyaqskulrdgiw.supabase.co |
| **n8n** | https://n8n.srv1099553.hstgr.cloud |
| **Vercel** | https://vercel.com (para monitoreo) |
| **GitHub** | https://github.com (para código) |

---

**¡Listo! Ahora tienes un dashboard AutoRadar disponible 24/7 en la nube. 🚀**
