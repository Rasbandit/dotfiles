function create_script() {
    local SCRIPT_NAME=${1:-"test"}

    touch ./${SCRIPT_NAME}.sh
    chmod +x ./${SCRIPT_NAME}.sh
    echo '#!/bin/bash' >> ./${SCRIPT_NAME}.sh
    code ./${SCRIPT_NAME}.sh
}

function docker_build_publish() {
    local REGISTRY_URL=${1}
    local IMAGE_NAME=${2}
    local TAG=${3}
    local DOCKER_FILE=${4:-"Dockerfile"}

    docker build . -f ${DOCKER_FILE} -t ${IMAGE_NAME}:${TAG}
    docker tag ${IMAGE_NAME}:${TAG} ${REGISTRY_URL}:${TAG}
    docker push ${REGISTRY_URL}:${TAG}
}

function nordvpn_defualt_connect() {
    nordvpn set technology nordlynx
    nordvpn set lan-discovery enable

    nordvpn connect
}

function nordvpn_connect_public() {
    nordvpn set technology openvpn
    nordvpn set lan-discovery disable

    nordvpn connect "${1}"
}