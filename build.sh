# git clone git@github.com:milas/talos-sbc-rk3588.git
# sudo apt install docker-buildx

# docker buildx create --driver docker-container  --driver-opt network=host --name local1 --buildkitd-flags '--allow-insecure-entitlement security.insecure' --use

export  PLATFORM=linux/arm64
export  INSTALLER_ARCH=targetarch
export  USERNAME=tom
export  TALOS_VERSION=v1.7.4
export  KERNEL_VARIANT=bsp
export  REALKTEK_FIRMWARE_EXTENSION_IMAGE=ghcr.io/siderolabs/realtek-firmware:20240513@sha256:4ca40c2836c1cdb5105456186afd880925d72e81ee6b0ff69a40c9c05b7b74a4
docker buildx create --driver docker-container  --driver-opt network=host --name local1 --buildkitd-flags '--allow-insecure-entitlement security.insecure' --use

make talos-kernel-rk3588-bsp talos-sbc-rk3588-bsp PUSH=true
