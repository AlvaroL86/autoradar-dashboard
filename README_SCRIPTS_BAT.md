# 🚗 AutoRadar Dashboard - Scripts BAT para Git

Estos scripts automatizan el proceso de subir cambios a GitHub desde Windows.

---

## 📦 **Archivos incluidos**

| Archivo | Función | Cuándo usar |
|---------|---------|-------------|
| **MENU.bat** | Menú principal con todas las opciones | Siempre que necesites controlar Git |
| **PUSH.bat** | Sube cambios automáticamente | Cambios simples, rápido |
| **PUSH_CON_MENSAJE.bat** | Sube con mensaje personalizado | Cambios importantes |
| **SETUP.bat** | Configura Git por primera vez | Una sola vez al inicio |

---

## 🚀 **Primeros pasos**

### 1️⃣ **Ejecuta SETUP.bat** (una sola vez)
```bash
Doble clic en SETUP.bat
```
Esto configura:
- Tu usuario de GitHub
- Tu email de GitHub
- La conexión al repositorio

### 2️⃣ **Luego usa MENU.bat o PUSH.bat**
```bash
Doble clic en MENU.bat   (para ver todas las opciones)
O
Doble clic en PUSH.bat   (para subir cambios rápidamente)
```

---

## 📋 **Instrucciones detalladas**

### **MENU.bat** (Recomendado - menú interactivo)
```
1. 📤 PUSH rápido
   → Sube todos los cambios con timestamp automático
   → Ejemplo: "Update: 2026-04-14 12:31"

2. 📝 PUSH con mensaje personalizado
   → Tú escribes el mensaje del commit
   → Ejemplo: "Fix: dashboard dark mode colors"

3. 📥 PULL
   → Trae cambios de GitHub al tu PC
   → Útil si trabajas desde múltiples dispositivos

4. 📋 Ver estado
   → Muestra qué archivos han cambiado
   → Muestra si hay cambios pendientes de subir

5. 🔍 Historial
   → Muestra los últimos 10 commits

6. 🔧 SETUP
   → Configura Git (ejecutar una sola vez)

7. ❌ Salir
   → Cierra el menú
```

### **PUSH.bat** (Rápido - sin preguntas)
```
1. Muestra los cambios pendientes
2. Te pide confirmación (S/N)
3. Si dices "S", sube automáticamente
4. Mensaje automático con fecha y hora
```

### **PUSH_CON_MENSAJE.bat** (Personalizado)
```
1. Muestra los cambios pendientes
2. Te pide escribir un mensaje
3. Sube con tu mensaje personalizado
```

### **SETUP.bat** (Configuración inicial)
```
1. Verifica que Git esté instalado
2. Configura tu nombre de usuario
3. Configura tu email
4. Inicializa el repositorio (si es necesario)
5. Configura la URL de GitHub
```

---

## 💡 **Casos de uso**

### **Cambios simples (estilos CSS, ajustes)**
```bash
→ Doble clic en PUSH.bat
→ Presiona "S" para confirmar
→ Listo ✅
```

### **Cambios importantes (nuevas funciones)**
```bash
→ Doble clic en PUSH_CON_MENSAJE.bat
→ Escribe: "Feature: Add dark mode toggle"
→ Presiona Enter
→ Listo ✅
```

### **Ver qué cambios harás antes de pushear**
```bash
→ Doble clic en MENU.bat
→ Selecciona "4. Ver estado"
→ Luego selecciona "1. PUSH rápido"
```

### **Deshacer cambios locales**
```bash
→ Abre una terminal en la carpeta
→ Escribe: git checkout .
→ Los cambios se deshacen
```

---

## 🔧 **Requisitos**

- ✅ Git instalado: https://git-scm.com/
- ✅ Cuenta de GitHub: https://github.com/
- ✅ Acceso a tu repositorio

---

## ❌ **Troubleshooting**

### "Git no está instalado"
```
→ Descarga Git desde https://git-scm.com/
→ Instálalo normalmente
→ Reinicia los scripts
```

### "Error: Repository not found"
```
→ Abre MENU.bat → 6. SETUP
→ Verifica que la URL de GitHub sea correcta
```

### "No hay cambios para commitear"
```
→ Es normal si no hiciste cambios
→ Edita un archivo, guarda, e intenta de nuevo
```

### "Permission denied"
```
→ Ejecuta los scripts como Administrador
→ Clic derecho en el .bat → "Ejecutar como administrador"
```

---

## 📝 **Ejemplos de mensajes buenos**

```
✅ BUENOS:
   - "Fix: header navigation responsive"
   - "Feature: add chart to stats page"
   - "Refactor: simplify data loading"
   - "Docs: update README with setup guide"
   - "Style: improve dark mode contrast"

❌ MALOS:
   - "asdfgh"
   - "cambios varios"
   - "fix"
   - "update"
```

---

## 🎯 **Flujo típico diario**

```
Mañana:
  1. MENU.bat → 3. PULL
  2. Trabajar en los cambios
  3. Guardar archivos

Cuando termines:
  4. MENU.bat → 1. PUSH rápido (o 2 si cambios importantes)
  5. Verifica en GitHub: https://github.com/AlvaroL86/autoradar-dashboard
```

---

## 📞 **Soporte**

Si tienes problemas:
1. Lee este archivo desde el principio
2. Verifica que Git esté instalado
3. Ejecuta SETUP.bat para reconfigurarlo
4. Intenta de nuevo

---

**¡Hecho por AutoRadar Bot! 🚗**
