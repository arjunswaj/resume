# syntax=docker/dockerfile:1
# Slim TeX Live 2026 development image for resume-latex.
# All LaTeX builds and tools run inside this container via .devcontainer/exec.sh.
ARG BASE_IMAGE=debian:trixie-slim
FROM ${BASE_IMAGE}

ENV DEBIAN_FRONTEND=noninteractive \
    TEXLIVE_INSTALL_ENV_NOCHECK=1 \
    TEXLIVE_INSTALL_NO_WELCOME=1

# Apply all OS security updates to fix base-image CVEs and install only minimal runtime dependencies.
RUN apt-get update \
    && apt-get dist-upgrade -y --no-install-recommends \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        fontconfig \
        libfontconfig1 \
        libfreetype6 \
        perl \
        xz-utils \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install latest TeX Live (scheme-basic without docs/sources) and only the packages required by main.tex.
# Pins a single Tier-1 CTAN mirror per attempt (with automatic fallback) so install-tl and tlmgr never
# hit an out-of-sync mirror via mirror.ctan.org round-robin redirects.
RUN set -eux; \
    installed=0; \
    for repo in \
        "https://mirrors.rit.edu/CTAN/systems/texlive/tlnet" \
        "https://ctan.math.utah.edu/ctan/tex-archive/systems/texlive/tlnet" \
        "https://mirror.math.princeton.edu/pub/CTAN/systems/texlive/tlnet" \
        "https://mirror.ctan.org/systems/texlive/tlnet"; \
    do \
        rm -rf /tmp/install-tl /usr/local/texlive; \
        mkdir -p /tmp/install-tl; \
        cd /tmp/install-tl; \
        if curl -fsSL "${repo}/install-tl-unx.tar.gz" | tar -xz --strip-components=1 \
            && printf '%s\n' \
                'selected_scheme scheme-basic' \
                'tlpdbopt_install_docfiles 0' \
                'tlpdbopt_install_srcfiles 0' \
                'tlpdbopt_autobackup 0' \
                'tlpdbopt_sys_bin /usr/local/bin' \
                'option_path 1' \
                > texlive.profile \
            && ./install-tl --profile=texlive.profile --repository="${repo}" \
            && tlmgr option repository "${repo}" \
            && tlmgr install \
                academicons \
                fontawesome6 \
                fontspec \
                geometry \
                latexmk \
                microtype \
                moderncv \
                multirow \
                pgf \
                type1cm \
                xetex; \
        then \
            installed=1; \
            break; \
        fi; \
        echo "Mirror ${repo} failed or was mid-sync; trying next mirror..." >&2; \
    done; \
    [ "$installed" -eq 1 ]; \
    tlmgr path add; \
    TL_CONF="$(find /usr/local/texlive -name texlive-fontconfig.conf | head -n 1)"; \
    if [ -n "$TL_CONF" ]; then \
        cp "$TL_CONF" /etc/fonts/conf.d/09-texlive.conf; \
    fi; \
    fc-cache -fv; \
    rm -rf /tmp/install-tl /tmp/* /var/tmp/*

WORKDIR /workspace

CMD ["sleep", "infinity"]
