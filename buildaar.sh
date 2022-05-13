#!/bin/bash


#  LOG(INFO) << "TimedBoxListIdToLabelCalculator:Process " ;

rm -rf bazel-bin/mediapipe/examples/android/src/java/com/google/mediapipe/apps/aar_example
rm /home/github/mediapipe-yu/aar_dir/mediapipe_template_matching.aar  # && rm /home/github/mediapipe-yu/aar_dir/mediapipe_template_matching_android_lib.aar
rm /home/github/mediapipe-yu/aar_dir/mobile_cpu.binarypb
bazel build -c opt --strip=ALWAYS     --host_crosstool_top=@bazel_tools//tools/cpp:toolchain     --fat_apk_cpu=arm64-v8a,armeabi-v7a     //mediapipe/examples/android/src/java/com/google/mediapipe/apps/aar_example:mediapipe_template_matching.aar




cp bazel-bin/mediapipe/examples/android/src/java/com/google/mediapipe/apps/aar_example/mediapipe_template_matching.aar /home/github/mediapipe-yu/aar_dir/

# cp bazel-bin/mediapipe/examples/android/src/java/com/google/mediapipe/apps/aar_example/mediapipe_template_matching_android_lib.aar /home/github/mediapipe-yu/aar_dir/

bazel build mediapipe/graphs/template_matching:mobile_cpu_binary_graph


cp   bazel-bin/mediapipe/graphs/template_matching/mobile_cpu.binarypb /home/github/mediapipe-yu/aar_dir/