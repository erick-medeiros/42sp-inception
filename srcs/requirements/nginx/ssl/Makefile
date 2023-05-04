all: certificate.crt

certificate.crt:
	@sh ssl.sh

clean:
	$(RM) *.crt *.key *.csr *.srl

re: clean all

.PHONY: all clean re