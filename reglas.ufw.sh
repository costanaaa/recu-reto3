#!/bin/bash
set -e

# Resetear reglas
sudo ufw --force reset

# Políticas por defecto
sudo ufw default deny incoming
sudo ufw default allow outgoing

# -------------------------
# Servicios permitidos
# -------------------------

# SSH
sudo ufw allow 22/tcp comment "SSH"
sudo ufw limit 22/tcp comment "SSH rate limit"

# Web
sudo ufw allow 80/tcp comment "HTTP"
sudo ufw allow 443/tcp comment "HTTPS"

# -------------------------
# Servicios bloqueados
# -------------------------

# Base de datos (solo local)
sudo ufw deny 3306/tcp comment "Block MySQL/MariaDB"

# Puertos comunes no usados
sudo ufw deny 21/tcp comment "FTP"
sudo ufw deny 23/tcp comment "TELNET"

# -------------------------
# Logging y activación
# -------------------------

sudo ufw logging medium
sudo ufw --force enable

# Estado final
sudo ufw status verbose
sudo ufw status numbered

echo "[✓] UFW configurado correctamente"
