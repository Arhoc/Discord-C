LIB_NAME = discord-c
SRC_DIR = src
INC_DIR = include
BUILD_DIR = build
LIB_DIR = lib
CC = gcc
CFLAGS = -Wall -Wextra -I$(INC_DIR) -c

SRCS = $(wildcard $(SRC_DIR)/*.c)
OBJS = $(patsubst $(SRC_DIR)/%.c, $(BUILD_DIR)/%.o, $(SRCS))

LIB = $(LIB_DIR)/lib$(LIB_NAME).a

all: dirs $(LIB)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) $< -o $@

$(LIB): $(OBJS)
	ar rcs $(LIB) $(OBJS)

clean:
	rm -rf $(BUILD_DIR)

dirs:
	mkdir -p $(BUILD_DIR) $(LIB_DIR)

.PHONY: all clean dirs
