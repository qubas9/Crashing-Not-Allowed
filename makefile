NAME ?= race

PLATFORM ?= linux
OPTIMIZATION ?= -O2

SRCS := $(wildcard src/*.c)

# -------------------
# Linux build
# -------------------
ifeq ($(PLATFORM),linux)

CC := gcc
BUILD_DIR := build/linux

CFLAGS := -I./lib/raylib/linux
LDFLAGS := -L./lib/raylib/linux -lraylib -lGL -lm -lpthread -ldl -lrt -lX11

TARGET := $(NAME)

endif

# -------------------
# Windows build
# -------------------
ifeq ($(PLATFORM),windows)

CC := x86_64-w64-mingw32-gcc
BUILD_DIR := build/windows

CFLAGS := -I./lib/raylib/win
LDFLAGS := -L./lib/raylib/win -lraylib -lopengl32 -lgdi32 -lwinmm

TARGET := $(NAME).exe

endif

.PHONY: all release clean

# -------------------
# OBJS
# -------------------
OBJS := $(patsubst src/%.c,$(BUILD_DIR)/%.o,$(SRCS))

# -------------------
# RULES
# -------------------

all: $(TARGET)

release:
	$(MAKE) clean
	$(MAKE) PLATFORM=linux OPTIMIZATION=-O3
	$(MAKE) PLATFORM=windows OPTIMIZATION=-O3

$(TARGET): $(OBJS)
	$(CC) -o $@ $^ $(LDFLAGS) $(OPTIMIZATION)

$(BUILD_DIR)/%.o: src/%.c
	mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) $(OPTIMIZATION) -c $< -o $@

clean:
	rm -rf build
	rm -f $(NAME) $(NAME).exe