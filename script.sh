#!/bin/bash

set -e

echo "🚀 Cài đặt Firebase CLI..."
npm install -g firebase-tools

echo "🚀 Kiểm tra phiên bản Firebase CLI..."
firebase --version  # Kiểm tra Firebase CLI đã được cài chưa

echo "🚀 Bắt đầu quá trình Build & Deploy tới thiết bị test..."

echo "📌 Cài đặt dependencies..."
flutter pub get

echo "📌 Chạy unit test..."
flutter test

# 📱 Build Android & upload lên Firebase
echo "📌 Build APK (Android)..."
flutter build apk --release
echo "📌 Upload APK lên Firebase App Distribution..."
firebase appdistribution:distribute build/app/outputs/apk/release/app-release.apk \
  --app $FIREBASE_APP_ID_ANDROID \
  --token "$FIREBASE_TOKEN" \
  --groups test-1

# 🍏 Build iOS & upload lên TestFlight
#echo "📌 Build iOS..."
#flutter build ios --no-codesign
#echo "📌 Cài đặt Fastlane..."
#gem install fastlane -NV
#echo "📌 Upload lên TestFlight..."
#cd ios && fastlane deploy_to_testflight
