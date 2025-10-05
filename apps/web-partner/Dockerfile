# syntax=docker/dockerfile:1.6
FROM node:20-alpine AS deps
WORKDIR /srv/app
RUN corepack enable
COPY package.json ./
RUN pnpm install --prod --no-optional

FROM deps AS runner
CMD ["node", "--version"]
