FROM jenkins/jnlp-agent-docker:latest

# Switch to root user
USER root

# Install curl and Node.js using Alpine's package manager
RUN apk update && apk add --no-cache curl nodejs npm

# Switch back to the Jenkins user
USER jenkins