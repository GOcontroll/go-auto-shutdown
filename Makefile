ODIR=$(PWD)

_OBJ = main.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

LIBS = -liio

$(ODIR)/%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS) $(LIBS)

go-auto-shutdown: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

install: go-auto-shutdown
	install -Dm755 go-auto-shutdown $(DESTDIR)/usr/bin/go-auto-shutdown

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core go-auto-shutdown
