set -e

ensure_n() {
  local k="$1"
  sed -i "/^${k}=y/d;/^${k}=m/d" .config || true
  grep -q "^${k}=n" .config || echo "${k}=n" >> .config
}
ensure_y() {
  local k="$1"
  sed -i "/^${k}=n/d" .config || true
  grep -q "^${k}=y" .config || echo "${k}=y" >> .config
}

# 1) 禁用 FRP 全家
for k in \
  CONFIG_PACKAGE_frpc \
  CONFIG_PACKAGE_frps \
  CONFIG_PACKAGE_luci-app-frpc \
  CONFIG_PACKAGE_luci-app-frps
do
  ensure_n "${k}"
done

# 2) 启用你要的包
ensure_y CONFIG_PACKAGE_luci
ensure_y CONFIG_PACKAGE_luci-ssl
ensure_y CONFIG_PACKAGE_luci-i18n-base-zh-cn
ensure_y CONFIG_PACKAGE_ca-bundle
ensure_y CONFIG_PACKAGE_ca-certificates
ensure_y CONFIG_PACKAGE_htop

# tailscale
ensure_y CONFIG_PACKAGE_tailscale
ensure_y CONFIG_PACKAGE_luci-app-tailscale

# wolplus（sundaqiang）
ensure_y CONFIG_PACKAGE_luci-app-wolplus

# samba4
ensure_y CONFIG_PACKAGE_luci-app-samba4
ensure_y CONFIG_PACKAGE_samba4-server
ensure_y CONFIG_PACKAGE_samba4-libs

# filebrowser-go
ensure_y CONFIG_PACKAGE_luci-app-filebrowser-go
ensure_y CONFIG_PACKAGE_filebrowser-go

# openlist
ensure_y CONFIG_PACKAGE_luci-app-openlist

# Argon主题及配置
ensure_y CONFIG_PACKAGE_luci-theme-argon
ensure_y CONFIG_PACKAGE_luci-app-argon-config

# tailscale
ensure_y CONFIG_PACKAGE_tailscale
ensure_y CONFIG_PACKAGE_luci-app-tailscale

# qbittorrent
ensure_y CONFIG_PACKAGE_qbittorrent
ensure_y CONFIG_PACKAGE_luci-app-qbittorrent

# podman
# ensure_y CONFIG_PACKAGE_podman
