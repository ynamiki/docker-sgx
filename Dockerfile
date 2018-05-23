FROM ubuntu:16.04
RUN buildDeps=' \
		wget \
	' \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends \
		$buildDeps \
		libprotobuf9v5 \
	&& PSW_TEMP_FOLDER=sgx-psw \
	&& NR_SCRIPT_LINES=130 \
	&& mkdir $PSW_TEMP_FOLDER \
	&& wget -O - --no-check-certificate https://download.01.org/intel-sgx/linux-2.1.3/ubuntu64-server/sgx_linux_x64_psw_2.1.103.44322.bin \
		| tail -n +$NR_SCRIPT_LINES \
		| tar zx -C $PSW_TEMP_FOLDER \
	&& PSW_LIB_PATH=$PSW_TEMP_FOLDER/package/lib64 \
	&& mv $PSW_LIB_PATH/libsgx_uae_service.so /usr/lib \
	&& mv $PSW_LIB_PATH/libsgx_urts.so /usr/lib \
	&& rm -fr $PSW_TEMP_FOLDER \
	&& apt-get purge -y --auto-remove $buildDeps \
	&& rm -rf /var/lib/apt/lists/*
