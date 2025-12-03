# Compiler settings
CC = gcc
CXX = g++
CFLAGS = -Wall -Wextra -g -std=c11
CXXFLAGS = -Wall -Wextra -g -std=c++11

# Directories
INCLUDE_DIR = include
SRC_DIR = src
EXAMPLES_DIR = examples
BUILD_DIR = build

# Source files
MEMWATCH_SRC = $(SRC_DIR)/memwatch.cpp
EXAMPLES_C_SRC = $(EXAMPLES_DIR)/examples_c.c

# Object files
MEMWATCH_OBJ = $(BUILD_DIR)/memwatch.o
EXAMPLES_C_OBJ = $(BUILD_DIR)/examples_c.o

# Executables
EXAMPLES_C_EXE = $(EXAMPLES_DIR)/examples_c

# Default target
all: $(EXAMPLES_C_EXE)

# Create build directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Compile memwatch.cpp (C++ library)
$(MEMWATCH_OBJ): $(MEMWATCH_SRC) | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -I$(INCLUDE_DIR) -c $< -o $@

# Compile examples_c.c (C program)
$(EXAMPLES_C_OBJ): $(EXAMPLES_C_SRC) | $(BUILD_DIR)
	$(CC) $(CFLAGS) -I$(INCLUDE_DIR) -c $< -o $@

# Link examples_c executable (use C++ linker since library is C++)
$(EXAMPLES_C_EXE): $(EXAMPLES_C_OBJ) $(MEMWATCH_OBJ)
	$(CXX) $(CXXFLAGS) $^ -o $@

# Clean build artifacts
clean:
	rm -rf $(BUILD_DIR)
	rm -f $(EXAMPLES_C_EXE)
	rm -f *.o
	rm -f $(EXAMPLES_DIR)/*.o

# Phony targets
.PHONY: all clean

