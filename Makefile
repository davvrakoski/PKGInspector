CC = gcc
CFLAGS = -Wall -Wextra
LIBS = -lcurl -lcjson
TARGET = PKGInspect

all: $(TARGET)

$(TARGET): main.c
	$(CC) $(CFLAGS) -o $(TARGET) main.c $(LIBS)

install: all
	install -m 755 $(TARGET) /usr/local/bin/$(TARGET)
	install -m 755 pkginspect_wrapper.sh /usr/local/bin/aur

uninstall:
	rm -f /usr/local/bin/$(TARGET)
	rm -f /usr/local/bin/aur

clean:
	rm -f $(TARGET)
