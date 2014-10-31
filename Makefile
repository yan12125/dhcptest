DMD:=dmd
OBJECTS=$(patsubst %.d, %.o, $(shell find -name '*.d'))

all: dhcptest

dhcptest: dhcptest.o linux/if_header.o
	$(DMD) $^ -of$@

%.o: %.d
	$(DMD) -c $< -of$@

clean:
	rm -f dhcptest $(OBJECTS)

.PHONY: all clean
