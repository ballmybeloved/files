set -euo pipefail
 
PKG_ID="bhop-watcher"
BUILD="$(mktemp -d)"
trap 'rm -rf "$BUILD"' EXIT
 
mkdir -p "$BUILD/contents/code"
 
cat > "$BUILD/metadata.json" <<'JSON'
{
    "KPlugin": {
        "Id": "bhop-watcher",
        "Name": "Bhop Watcher",
        "Description": "Pushes active-window class to dev.ballmybeloved.bhop_watcher on focus change",
        "Version": "1.0",
        "License": "MIT",
        "EnabledByDefault": true
    },
    "X-Plasma-API": "javascript",
    "X-Plasma-MainScript": "code/main.js",
    "KPackageStructure": "KWin/Script"
}
JSON
 
cat > "$BUILD/contents/code/main.js" <<'JS'
function notify(window) {
    var cls = window ? window.resourceClass : "";
    callDBus(
        "dev.ballmybeloved.bhop_watcher",
        "/Bhop",
        "dev.ballmybeloved.bhop_watcher",
        "WindowChanged",
        cls
    );
}
 
workspace.windowActivated.connect(notify);
JS
 
if kpackagetool6 --type=KWin/Script --list 2>/dev/null | grep -qx "$PKG_ID"; then
    kpackagetool6 --type=KWin/Script --upgrade "$BUILD"
else
    kpackagetool6 --type=KWin/Script --install "$BUILD"
fi
 
kwriteconfig6 --file kwinrc --group Plugins --key "${PKG_ID}Enabled" true
 
if command -v qdbus6 >/dev/null;  then QDBUS=qdbus6
elif command -v qdbus >/dev/null; then QDBUS=qdbus
else QDBUS=""; fi
 
if [[ -n "$QDBUS" ]]; then
    "$QDBUS" org.kde.KWin /KWin reconfigure || true
fi