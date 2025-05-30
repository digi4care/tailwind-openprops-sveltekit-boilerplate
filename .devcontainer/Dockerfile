FROM mcr.microsoft.com/devcontainers/javascript-node:1-20-bookworm

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# [Optional] Uncomment if you want to install an additional version of node using nvm
# ARG EXTRA_NODE_VERSION=10
# RUN su node -c "source /usr/local/share/nvm/nvm.sh && nvm install ${EXTRA_NODE_VERSION}"

# [Optional] Uncomment if you want to install more global node modules
# RUN su node -c "npm install -g <your-package-list-here>"

# Installeer systeemafhankelijkheden
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install --no-install-recommends \
  make \
  build-essential \
  libssl-dev \
  zlib1g-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  wget \
  curl \
  llvm \
  libncurses5-dev \
  libncursesw5-dev \
  xz-utils \
  tk-dev \
  libffi-dev \
  liblzma-dev \
  git \
  python3-pip \
  python3-venv \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/*

# Set NVM directory environment variable
ENV NVM_DIR="/usr/local/share/nvm"

# Install nvm
RUN mkdir -p "$NVM_DIR" && \
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# Load nvm and install Node.js versions
RUN echo 'export NVM_DIR="'"$NVM_DIR"'"' >> /home/node/.bashrc && \
  echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> /home/node/.bashrc && \
  echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> /home/node/.bashrc

# Installeer bun als node gebruiker
RUN su node -c "curl -fsSL https://bun.sh/install | bash"

# Installeer deno als node gebruiker
RUN su node -c "curl -fsSL https://deno.land/x/install/install.sh | sh"

# Werk de PATH van de gebruiker bij
ENV PATH="/home/node/.bun/bin:/home/node/.deno/bin:/home/node/.local/bin:${PATH}"

# Accept NODE_VERSIONS as build argument
ARG NODE_VERSIONS=${NODE_VERSIONS}

# Install Node.js versions and global packages in a single layer
RUN . "$NVM_DIR/nvm.sh" && \
  for version in $NODE_VERSIONS; do nvm install "$version"; done && \
  nvm use stable && \
  # Install global npm packages with --omit=optional to reduce size
  npm install -g --omit=optional \
  npm@latest \
  yarn@latest \
  pnpm@latest \
  npm-check-updates@latest && \
  # Clean npm cache to reduce image size
  npm cache clean --force

# Set default shell and user
ENV SHELL=/usr/bin/zsh
USER node

# Set working directory and set permissions
WORKDIR /workspace
RUN sudo chown -R node:node /workspace

# Add healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD node -e "console.log('Container is healthy')" || exit 1

# Show versions on container start
RUN echo "\n=== Development Environment ===" && \
  echo "Node.js: $(node --version)" && \
  echo "npm: $(npm --version)" && \
  echo "Yarn: $(yarn --version || echo 'Niet geïnstalleerd')" && \
  echo "pnpm: $(pnpm --version || echo 'Niet geïnstalleerd')" && \
  echo "Bun: $(bun --version || echo 'Niet geïnstalleerd')" && \
  echo "Deno: $(deno --version || echo 'Niet geïnstalleerd')" && \
  echo "Python: $(python3 --version)" && \
  echo "Pip: $(pip3 --version)" && \
  echo "============================\n"