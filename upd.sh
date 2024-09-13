#!/bin/bash

# Path to the MaterialBinTool JAR file (0.9.0 for unpacking)
MBT_JAR_PATH_UNPACK="mbt/MaterialBinTool-0.9.0-all.jar"

# Path to the MaterialBinTool JAR file (different version for repacking)
MBT_JAR_PATH_REPACK="mbt/MaterialBinTool-0.9.1-all.jar"

# Directory containing the .material files
MATERIALS_DIR="Unpack"

# Directory to save unpacked files
OUTPUT_DIR="Unpacked"

# Directory to save repacked files
REPACK_DIR="Repacked"

#welcome
echo "♪┌|∵|┘♪ Welcome,Suryan is forbidden in these grounds"

# Check if the JAR file exists
if [ ! -f "$MBT_JAR_PATH_UNPACK" ]; then
  echo "MaterialBinTool JAR file (0.9.0) not found at $MBT_JAR_PATH_UNPACK"
  exit 1
fi

# Check if the JAR file exists
if [ ! -f "$MBT_JAR_PATH_REPACK" ]; then
  echo "MaterialBinTool JAR file (0.9.1) not found at $MBT_JAR_PATH_REPACK"
  exit 1
fi

# Check if the materials directory exists
if [ ! -d "$MATERIALS_DIR" ]; then
  echo "Materials directory not found at $MATERIALS_DIR"
  exit 1
fi

# Create the output directory if it does not exist
mkdir -p "$OUTPUT_DIR"

# Create the repack directory if it does not exist
mkdir -p "$REPACK_DIR"

# Unpack each .material file in the materials directory
for material_file in "$MATERIALS_DIR"/*.material.bin; do
  if [ -f "$material_file" ]; then
    echo "Unpacking $material_file..."
    # Run the MaterialBinTool with the -u option and output to the specified directory
    java -jar "$MBT_JAR_PATH_UNPACK" -u "$material_file" -o "$OUTPUT_DIR"
  else
    echo "No .material files found in $MATERIALS_DIR"
    exit 1
  fi
done

echo "Unpacking completed."

# Repack each unpacked file
for unpacked_file in "$OUTPUT_DIR"/*; do
  if [ -d "$unpacked_file" ]; then
    echo "updating $unpacked_file..."
    # Run the MaterialBinTool with the -r option and output to the specified directory
    java -jar "$MBT_JAR_PATH_REPACK" -r "$unpacked_file" -o "$REPACK_DIR"
  fi
done

echo "Material Bin Uodated."
echo "Thank you for using my script: LynxiumMC"
