# docker-sgx

This is a Docker image for an Intel SGX enabled application.
Note that the driver, the PSW, the SDK must be installed on the Docker host.

```
$ docker build -t sgx:2.1.3 .
$ docker run -it \
	-v /var/run/aesmd/aesm.socket:/var/run/aesmd/aesm.socket \
	-v /opt/intel/sgxsdk/SampleCode:/SampleCode \
	--device /dev/isgx \
	sgx:2.1.3 \
	bash
root@...:/# cd /SampleCode/SampleEnclave
root@...:/SampleCode/SampleEnclave# ./app
```
