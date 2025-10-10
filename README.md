# Docker Alpine Node Chromium

A lightweight Docker image based on Alpine Linux with Node.js 22 and Chromium browser for headless automation, web scraping, and testing.

## Features

- 🐧 **Alpine Linux 3.22** - Minimal, secure base image
- 🟢 **Node.js 22** - Latest Node.js runtime
- 🌐 **Chromium Browser** - Full Chromium installation with dependencies
- 🎨 **Font Support** - Includes Noto fonts for emoji and CJK characters
- 📦 **Optimized Size** - Multi-stage build for minimal image size
- 🔒 **Security** - Updated CA certificates and minimal attack surface

## Quick Start

### Build the Image

```bash
docker build -t alpine-node-chromium .
```

### Run the Container

```bash
docker run -it --rm alpine-node-chromium sh
```

### Run with Volume Mount

```bash
docker run -it --rm -v $(pwd):/app -w /app alpine-node-chromium node your-script.js
```

## Installed Packages

- **chromium** - Chromium web browser
- **nss** - Network Security Services
- **freetype** - Font rendering library
- **harfbuzz** - Text shaping library
- **ca-certificates** - Certificate authority certificates
- **ttf-freefont** - Free TrueType fonts
- **font-noto-emoji** - Google Noto Emoji fonts
- **font-noto-cjk** - Google Noto CJK (Chinese, Japanese, Korean) fonts

### Example Dockerfile Extension

```dockerfile
FROM alpine-node-chromium

# Create non-root user
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nextjs -u 1001

# Copy and install dependencies
COPY package*.json ./
RUN npm ci --only=production

# Copy application code
COPY . .
RUN chown -R nextjs:nodejs /app

USER nextjs
CMD ["node", "index.js"]
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test with your use case
5. Submit a pull request

## License

This project is open source and available under the [MIT License](LICENSE).
