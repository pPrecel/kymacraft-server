.PHONY: install
install:
	kubectl create namespace kymacraft-system
	kubectl label namespace kymacraft-system istio-injection=enabled
	helm install --set minecraft.minecraftServer.eula=$(EULA) kymacraft --set gateway.shootDomain=$(CLUSTER_DOMAIN) --namespace kymacraft-system ./charts/kymacraft

.PHONY: uninstall
uninstall:
	helm delete --namespace kymacraft-system kymacraft
	kubectl delete namespace kymacraft-system
