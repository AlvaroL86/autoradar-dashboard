# 📤 AutoRadar — Cómo Subir a GitHub y Vercel

## 🎯 Resumen (3 pasos)
1. Crear repo en GitHub
2. Subir los archivos
3. Conectar con Vercel

**Tiempo total: 5 minutos** ⏱️

---

## PASO 1: Crear Repositorio en GitHub

### 1.1 Si NO tienes cuenta GitHub:
- Ve a **[github.com](https://github.com)**
- Click en **Sign Up** (arriba a la derecha)
- Email, contraseña, verificación
- Listo

### 1.2 Crear nuevo repositorio
1. En GitHub, arriba a la derecha: **+** → **New repository**
2. Completa:
   - **Repository name**: `autoradar-dashboard`
   - **Description**: "AutoRadar — Dashboard de rastreo de precios"
   - **Public** ✓ (importante para Vercel)
   - **Initialize with README**: NO (crearemos el nuestro)
3. Click en **Create repository**

✅ Tendrás una URL como:
```
https://github.com/tuusuario/autoradar-dashboard
```

---

## PASO 2: Subir los Archivos a GitHub

### Opción A: Por Terminal (Si tienes Git instalado)

#### 2A.1 Crear carpeta local
```bash
# En tu PC, crea una carpeta
mkdir autoradar-dashboard
cd autoradar-dashboard
```

#### 2A.2 Inicializar Git
```bash
git init
```

#### 2A.3 Copiar los archivos
Copia estos archivos a la carpeta `autoradar-dashboard`:
- `index.html`
- `car-tracker-supabase.html`
- `README.md`
- `DEPLOY_GUIA.md`
- `SETUP_GUIA.md`
- `package.json`
- `vercel.json`
- `.gitignore`
- `QUICK_START.txt`
- `autoradar-config.json`

#### 2A.4 Configurar Git
```bash
# Configurar identidad (una sola vez)
git config --global user.name "Tu Nombre"
git config --global user.email "tuemail@gmail.com"

# Volver a la carpeta del proyecto
cd autoradar-dashboard

# Agregar todos los archivos
git add .

# Crear primer commit
git commit -m "Initial commit - AutoRadar Dashboard v1.0"
```

#### 2A.5 Conectar con GitHub
```bash
# Cambiar rama a 'main' (si es necesario)
git branch -M main

# Agregar remote de GitHub
git remote add origin https://github.com/TU_USUARIO/autoradar-dashboard.git

# Subir archivos
git push -u origin main
```

**Cambia `TU_USUARIO` por tu nombre de usuario en GitHub**

#### Ejemplo completo:
```bash
mkdir autoradar-dashboard
cd autoradar-dashboard
git init
git config --global user.name "Juan Pérez"
git config --global user.email "juan@gmail.com"

# (Copiar archivos aquí)

git add .
git commit -m "Initial commit - AutoRadar Dashboard v1.0"
git branch -M main
git remote add origin https://github.com/juanperez/autoradar-dashboard.git
git push -u origin main
```

✅ Ve a GitHub.com y verifica que aparecen los archivos

---

### Opción B: Por Interfaz GitHub (Sin terminal)

1. En tu repo GitHub, click en **Add file** → **Upload files**
2. Arrastra los archivos a la zona indicada
3. Escribe el mensaje: "Initial commit - AutoRadar Dashboard"
4. Click en **Commit changes**

✅ Listo, archivos subidos

---

## PASO 3: Conectar con Vercel (Deployment automático)

### 3.1 Crear cuenta en Vercel
1. Ve a **[vercel.com](https://vercel.com)**
2. Click en **Sign Up**
3. Selecciona **GitHub** (la opción más fácil)
4. Autoriza Vercel a acceder a GitHub
5. Completa el perfil si es necesario

### 3.2 Crear Nuevo Proyecto
1. En Vercel, click en **New Project**
2. Selecciona tu repositorio `autoradar-dashboard`
3. Click en **Import**

### 3.3 Configurar Proyecto (Opcional)
Vercel debería detectar automáticamente:
- **Framework**: HTML (Static)
- **Build Command**: (dejar vacío)
- **Output Directory**: (dejar en raíz)

Si aparece algo diferente, déjalo igual y continúa.

### 3.4 Deploy
1. Click en **Deploy**
2. Espera 30-60 segundos
3. ¡Listo! Vercel te mostrará la URL:

```
https://autoradar-dashboard.vercel.app
```

✅ **Tu dashboard está en vivo en la nube**

---

## 🔄 Actualizar después de cambios

Una vez connected GitHub + Vercel:

### Cambio 1: Modificar algo en el HTML
```bash
cd autoradar-dashboard

# Edita el archivo (con tu editor favorito)
# Ejemplo: cambiar color de --accent en el CSS

# Guarda el archivo

# Sube a GitHub
git add .
git commit -m "Change accent color to #ffaa00"
git push
```

✅ **Vercel redeploy automático en < 1 min**

### Cambio 2: Agregar archivos nuevos
```bash
# Copiar archivo a la carpeta
cp /descargas/nuevarchivo.txt .

# Subir a GitHub
git add .
git commit -m "Add new feature"
git push
```

✅ **Vercel se redeploy automáticamente**

---

## 📊 Verificar Deploy en Vercel

1. Ve a **[vercel.com](https://vercel.com)** → Tu proyecto
2. Click en **Deployments** (arriba)
3. Verás lista de deploys con estado:
   - 🟢 **Ready** = Listo, en vivo
   - 🟡 **Building** = En proceso
   - 🔴 **Failed** = Error (ver logs)

### Ver logs del deploy
Click en el deploy → **View Build Logs** para ver qué pasó

---

## 🎯 Dominio Personalizado (Opcional)

Si tienes un dominio propio (ej: `autoradar.tuempresa.com`):

### En Vercel:
1. Tu proyecto → **Settings** → **Domains**
2. Click en **Add Domain**
3. Ingresa tu dominio
4. Sigue instrucciones de DNS (depende del registrador)

### En tu Registrador de Dominios (GoDaddy, Namecheap, etc):
Actualiza DNS con los records que Vercel te proporcione.

⏳ Cambios DNS pueden tardar 24-48 horas.

---

## 🔄 Sincronización Bidireccional

Ahora tienes:
- **GitHub**: Tu código
- **Vercel**: Tu sitio en vivo
- **Sincronización automática**: Cada push a GitHub = redeploy en Vercel

```
Tu PC → git push → GitHub → Webhook → Vercel → Deploy
```

---

## 🐛 Troubleshooting

### ❌ "Error: Repository not found"
**Causa**: URL de GitHub incorrecta
**Solución**: 
```bash
git remote -v  # Ver URLs actuales
git remote set-url origin https://github.com/USUARIO/autoradar-dashboard.git
```

### ❌ "Error: authentication failed"
**Causa**: Contraseña incorrecta o token expirado
**Solución**:
```bash
# Si usas HTTPS:
git config --global credential.helper store

# O usar SSH (más seguro):
git remote set-url origin git@github.com:USUARIO/autoradar-dashboard.git
```

### ❌ "Deploy Failed" en Vercel
1. Ve a **Deployments** → el que falló
2. Click en **View Build Logs**
3. Busca el error (generalmente al final)
4. Arregla en local y haz push de nuevo

### ❌ Archivos no aparecen en GitHub
```bash
git status  # Ver qué cambios hay sin subir

# Si faltan:
git add .
git commit -m "Add missing files"
git push
```

---

## 📱 Compartir tu Dashboard

Una vez deployado, comparte la URL:

```
https://autoradar-dashboard.vercel.app

O si usaste dominio personalizado:
https://autoradar.tuempresa.com
```

Tu equipo puede:
- ✅ Abrir en cualquier navegador
- ✅ Agregar a pantalla de inicio (webapp)
- ✅ Recibir datos en tiempo real
- ✅ Sincronización automática cada 60s

---

## 🔐 Seguridad

✅ **Anon Key es pública** (por eso está visible en el HTML)
- Solo acceso lectura
- RLS protege los datos

⚠️ **Nunca compartas**:
- Secret keys de Supabase
- Contraseñas de n8n
- Credenciales de servicio

---

## 📊 Estadísticas post-Deploy

Una vez deployado, puedes ver:
- Visitas y usuarios
- Tiempo de carga
- País/ciudad de acceso
- Dispositivos (móvil, desktop)

En **Vercel → Insights** (pestaña)

---

## ✅ Checklist Final

- [ ] Creé repo en GitHub ✓
- [ ] Subí archivos a GitHub ✓
- [ ] Creé cuenta en Vercel ✓
- [ ] Conecté GitHub con Vercel ✓
- [ ] Hice Deploy ✓
- [ ] Dashboard está en vivo ✓
- [ ] Abrí la URL y funciona ✓
- [ ] Veo punto verde (conectado a Supabase) ✓
- [ ] Veo datos en la tabla ✓

---

## 🎉 ¡Listo!

Tu dashboard está:
- ✅ En la nube (Vercel)
- ✅ Con código versionado (GitHub)
- ✅ Conectado a Supabase (datos en vivo)
- ✅ Auto-sync con n8n (cada 30 min)
- ✅ Disponible 24/7

**Puedes compartir la URL con tu equipo. ¡Ya funciona!**

---

## 🚀 Próximos pasos opcionales

1. **Dominio personalizado** → Agregar en Vercel
2. **Webhooks** → Alertas en Slack/Discord
3. **Analytics** → Monitorear uso en Vercel
4. **Backups** → Configurar en Supabase
5. **Métricas** → Dashboard de performance

---

**¿Preguntas?** Lee `DEPLOY_GUIA.md` o `SETUP_GUIA.md`.

**¡Gracias por usar AutoRadar!** 🚗✨
