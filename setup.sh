#!/bin/bash

MBT_OLD="0.9.0"
MBT_NEW="0.9.1"

MBT_JAR_OLD=mbt/MaterialBinTool-$MBT_OLD-all.jar
MBT_JAR_NEW=mbt/MaterialBinTool-$MBT_NEW-all.jar

MBT_URL="https://github.com/ddf8196/MaterialBinTool/releases/download/v$MBT_OLD/MaterialBinTool-$MBT_OLD-all.jar"
MBT_URL_NEW="https://github.com/ddf8196/MaterialBinTool/releases/download/v$MBT_NEW/MaterialBinTool-$MBT_NEW-all.jar"
#create Directory
mkdir -p mbt
echo "downloading necessary files."
# Check if MaterialBinTool 0.9.0 exists
if [ -f "mbt/MaterialBinTool-0.9.0-all.jar" ]; then
  echo "MaterialBinTool 0.9.0 already exists. Skipping download."
else
  echo "downloading mbt 0.9.0"
  # Download MaterialBinTool 0.9.0
  curl -L -o $MBT_JAR_OLD $MBT_URL
fi

# Check if MaterialBinTool 0.9.1 exists
if [ -f "mbt/MaterialBinTool-0.9.1-all.jar" ]; then
  echo "MaterialBinTool latest already exits. Skipping download."
else
  echo "download mbt latest"
  # Download MaterialBinTool 0.9.1 (updater)
  curl -L -o $MBT_JAR_NEW $MBT_URL_NEW
fi

echo "setup complete."
