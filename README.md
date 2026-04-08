# codercom-java-images
This repository contains java images for use with Coder. but can choose jdk version!!!

All of our base images are built for Ubuntu or Debian environments. For example, you can use images like `eclipse-temurin:21-jdk-noble` or `eclipse-temurin:17-jdk-noble`.

## Base Image
The base image is using from https://hub.docker.com/_/eclipse-temurin/
![](https://raw.githubusercontent.com/docker-library/docs/cb27e17c8b50fddc58f1933d266a1a7686fea8ed/eclipse-temurin/logo.png)

## User Management

We do not explicitly delete the default user (e.g., `ubuntu`) or user `1001` in these containers. This is because some base images do not contain user `1001` or a default user out of the box, which would cause user deletion commands to fail during the build process (e.g., `id: '1001': no such user`). Instead, we handle user permissions and creation dynamically to ensure compatibility across various JDK base images.

## Agent Harness Usage

When using these images with Coder, the Coder agent harness will automatically provision the workspace and execute startup scripts. Since we retain the default users, the agent can easily be configured to run as the existing non-root user (or a dedicated `coder` user if you choose to provision one in your template).

Ensure your Coder templates are configured to start the agent with the appropriate user privileges so that your IDEs, terminal, and file system permissions behave correctly within the workspace.
