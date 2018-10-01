# Name: David Hunt
# Course: CS178 Build Automation for DevOps and QA
# CRN: 76718
# Date: 09/30/2018
# Assignment: Makefile for ServerCountThrees
# This Makefile compiles and runs the ServerCountThrees program

# Defining variables for file names and directories
PROGRAM_NAME = ServerCountThrees
READ_NAME = readInt32BitLE
DATA_NAME = threesData.bin
SOURCE_DIR = src
DATA_DIR = data
TARGET_DIR = build

# Creates target directory and executable file from object files
run : $(SOURCE_DIR)/$(PROGRAM_NAME).o $(SOURCE_DIR)/$(READ_NAME).o
	mkdir $(TARGET_DIR); \
	gcc -g -o $(TARGET_DIR)/$(PROGRAM_NAME) $(SOURCE_DIR)/$(PROGRAM_NAME).o $(SOURCE_DIR)/$(READ_NAME).o; \
	cp $(DATA_DIR)/$(DATA_NAME) $(TARGET_DIR)/.
#	cd $(TARGET_DIR); \
#	./$(PROGRAM_NAME)

# Compiles program source file into program object file
$(SOURCE_DIR)/$(PROGRAM_NAME).o : $(SOURCE_DIR)/$(PROGRAM_NAME).c
	gcc -g -c $(SOURCE_DIR)/$(PROGRAM_NAME).c -o $(SOURCE_DIR)/$(PROGRAM_NAME).o

# Compiles read source files into read object file
$(SOURCE_DIR)/$(READ_NAME).o : $(SOURCE_DIR)/$(READ_NAME).c $(SOURCE_DIR)/$(READ_NAME).h
	gcc -g -c $(SOURCE_DIR)/$(READ_NAME).c -o $(SOURCE_DIR)/$(READ_NAME).o

# cleans up object files and target directory
clean :
	rm $(SOURCE_DIR)/*.o -dr $(TARGET_DIR)
