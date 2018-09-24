# We're built on a super-small Linux distro
FROM nginx:stable-alpine

# But if it all breaks, blame us instead
MAINTAINER David J. Bianco <david.bianco@target.com>

# Copy the ATT&CK Navigator source to the local system
COPY attack-navigator/nav-app/dist /usr/share/nginx/html
