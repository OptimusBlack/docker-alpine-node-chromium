# Multi-stage build for optimal image size
FROM node:22-alpine3.22 AS base

# Install Chromium and dependencies in base image
RUN apk add --no-cache \
  chromium \
  nss \
  freetype \
  harfbuzz \
  ca-certificates \
  ttf-freefont \
  font-noto-emoji \
  font-noto-cjk

# Set environment variables for Puppeteer
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser