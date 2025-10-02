# syntax=docker/dockerfile:1.6
FROM node:20-alpine AS base
WORKDIR /srv/app
RUN corepack enable
COPY package.json ./
RUN pnpm install --prod --no-optional

FROM base AS runner
CMD ["node", "--version"]
