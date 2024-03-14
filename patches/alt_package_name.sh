#!/usr/bin/env bash

# Change applicationId to "com.ciphermd.notes.alt"
echo "Changing applicationId to com.ciphermd.notes.alt"
sed -i "s/applicationId \"com.ciphermd.notes\"/applicationId \"com.ciphermd.notes.alt\"/g" android/app/build.gradle
