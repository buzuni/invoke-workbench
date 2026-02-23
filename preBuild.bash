#!/bin/bash
# Pre-build script: set up pip config for longer timeout
mkdir -p /home/workbench/.config/pip
cat > /home/workbench/.config/pip/pip.conf << 'EOF'
[global]
timeout = 300
retries = 5
EOF

# Fix requirements.txt if it has the broken URL (missing space)
if [ -f /opt/project/build/requirements.txt ]; then
    sed -i 's/--extra-index-urlhttps/--extra-index-url https/' /opt/project/build/requirements.txt
fi
