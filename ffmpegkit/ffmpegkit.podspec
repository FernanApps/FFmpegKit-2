Pod::Spec.new do |spec|
    spec.name                     = 'ffmpegkit'
    spec.version                  = '0.0.0'
    spec.homepage                 = ''
    spec.source                   = { :http=> ''}
    spec.authors                  = ''
    spec.license                  = ''
    spec.summary                  = ''
    spec.vendored_frameworks      = 'build/cocoapods/framework/ffmpegkit.framework'
    spec.libraries                = 'c++'
    spec.ios.deployment_target = '12.1'
    spec.dependency 'ffmpeg-kit-ios-full-gpl', '~> 5.1'
                
    spec.pod_target_xcconfig = {
        'KOTLIN_PROJECT_PATH' => ':ffmpegkit',
        'PRODUCT_MODULE_NAME' => 'ffmpegkit',
    }
                
    spec.script_phases = [
        {
            :name => 'Build ffmpegkit',
            :execution_position => :before_compile,
            :shell_path => '/bin/sh',
            :script => <<-SCRIPT
                if [ "YES" = "$OVERRIDE_KOTLIN_BUILD_IDE_SUPPORTED" ]; then
                  echo "Skipping Gradle build task invocation due to OVERRIDE_KOTLIN_BUILD_IDE_SUPPORTED environment variable set to \"YES\""
                  exit 0
                fi
                set -ev
                REPO_ROOT="$PODS_TARGET_SRCROOT"
                "$REPO_ROOT/../gradlew" -p "$REPO_ROOT" $KOTLIN_PROJECT_PATH:syncFramework \
                    -Pkotlin.native.cocoapods.platform=$PLATFORM_NAME \
                    -Pkotlin.native.cocoapods.archs="$ARCHS" \
                    -Pkotlin.native.cocoapods.configuration="$CONFIGURATION"
            SCRIPT
        }
    ]
                
end