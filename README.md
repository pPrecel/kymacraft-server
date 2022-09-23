# kymacraft

>super fancy logo here

This repository contains the Minecraft server config based on the [Kyma](https://github.com/kyma-project/kyma), the [Gardener](https://github.com/gardener/gardener) cluster, and the [docker-minecraft-server](https://github.com/itzg/docker-minecraft-server).

You can find the `Kymacraft` modpack and serverpack on the curseforge [here](https://www.curseforge.com/minecraft/modpacks/kymacraft).

## Prerequisites

* Gardener cluster
* Kyma installed ( >2.6 )

>Note: minimal setup of the Kyma is to install the `istio` and the `istio-resources` components

## Installation

1. Clone this repository:

    ```bash
    git clone https://github.com/pPrecel/kymacraft-server.git
    cd kymacraft-server
    ```

2. Edit the `istio-ingressgateway` Service:

    ```bash
    kubectl edit svc -n istio-system istio-ingressgateway
    ```

    and add port number `25565` under the `.spec.ports` field:

    ```yaml
    ...
    spec:
        ...
        ports:
        - name: tcp
            nodePort: 30623
            port: 25565
            protocol: TCP
            targetPort: 25565
    ...
    ```

    >Note: if the value for the [nodePort](https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport) is in-use then choose anything else from the range 30000-32767 :)

3. Export following envs:

    ```bash
    export EULA=true
    export CLUSTER_DOMAIN=<cluster_domain>
    ```

4. Install chart:

    ```bash
    make install
    ```

5. After a few seconds you can reach your server by using the following address in the Minecraft application:

    ```text
    <cluster_domain>:25565
    ```
