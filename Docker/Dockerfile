FROM pandoc/latex:3.8-ubuntu
WORKDIR /context
# Remove /data folder from pandoc container
RUN rmdir "/data"
ENV CONTEXT_ZIP_FILE=context-linux-64.zip
RUN apt-get -q update && apt-get install -y unzip  && rm -rf /var/lib/apt/lists/*
RUN <<EOF
	wget https://lmtx.pragma-ade.com/install-lmtx/${CONTEXT_ZIP_FILE}
	unzip ${CONTEXT_ZIP_FILE}
	sh install.sh
	rm ${CONTEXT_ZIP_FILE}
EOF
ENV PATH="/context/tex/texmf-linux-64/bin:${PATH}"
RUN mtxrun --generate
COPY --chmod=555 ["entrypoint.sh", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
