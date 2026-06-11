VERSION ?= v0.0.1-b
APP_NAME = crashing-not-allowed
NAME ?= $(APP_NAME)_$(VERSION)

PLATFORM ?= linux
OPTIMIZATION ?= -O2

RAYLIB_PATH := ./lib/thirdparty/raylib

SRCS := $(wildcard src/*.c)

# -------------------
# Linux build
# -------------------
ifeq ($(PLATFORM),linux)

CC := gcc
BUILD_DIR := build/linux

CFLAGS := -I$(RAYLIB_PATH)/linux
CFLAGS += -DVERSION=\"$(VERSION)\"
LDFLAGS := -L$(RAYLIB_PATH)/linux -lraylib -lGL -lm -lpthread -ldl -lrt -lX11

TARGET := $(APP_NAME)

endif

# -------------------
# Windows build
# -------------------
ifeq ($(PLATFORM),windows)

CC := x86_64-w64-mingw32-gcc
BUILD_DIR := build/windows

CFLAGS := -I$(RAYLIB_PATH)/win
LDFLAGS := -L$(RAYLIB_PATH)/win -lraylib -lopengl32 -lgdi32 -lwinmm

TARGET := $(APP_NAME).exe

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
	rm -f $(APP_NAME)*