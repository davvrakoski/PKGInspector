CC = gcc
CFLAGS = -Wall -Wextra
LIBS = -lcurl -lcjson
TARGET = PKGInspect

all: $(TARGET)

$(TARGET): main.c
	$(CC) $(CFLAGS) -o $(TARGET) main.c $(LIBS)

clean:
	rm -f $(TARGET)
