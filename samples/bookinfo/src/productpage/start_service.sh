
/opt/istio/prepare_proxy.sh -p 15001 -u 1337
python /opt/microservices/productpage.py 9080 &
su istio-proxy -c "/opt/istio/pilot-agent proxy -v 2 --serviceregistry Consul --serviceCluster productpage-v1 --zipkinAddress zipkin:9411 > /tmp/envoy.log"
