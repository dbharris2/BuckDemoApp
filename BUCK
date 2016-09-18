apple_resource(
  name = 'BuckDemoAppResources',
  files = glob(['*.png']),
  dirs = [],
)

apple_bundle(
  name = 'BuckDemoApp',
  binary = ':BuckDemoAppBinary',
  extension = 'app',
  info_plist = 'Info.plist',
  tests = [':BuckDemoAppTest'],
)

apple_binary(
  name = 'BuckDemoAppBinary',
  deps = [
    ':BuckDemoAppResources',
    '//Libraries/DHUIKit:DHUIKit',
  ],
  preprocessor_flags = ['-fobjc-arc'],
  compiler_flags = ['-Wno-objc-designated-initializers'],
  headers = glob([
    '*.h',
  ]),
  srcs = glob([
    '*.m',
    '*.mm',
  ]),
  frameworks = [
    '$SDKROOT/System/Library/Frameworks/UIKit.framework',
    '$SDKROOT/System/Library/Frameworks/Foundation.framework',
  ],
)

apple_package(
  name = 'BuckDemoAppPackage',
  bundle = ':BuckDemoApp',
)

apple_test(
  name = 'BuckDemoAppTest',
  test_host_app = ':BuckDemoApp',
  srcs = ['tests/BuckDemoAppTest.m'],
  info_plist = 'tests/Test.plist',
  frameworks = [
    '$PLATFORM_DIR/Developer/Library/Frameworks/XCTest.framework',
    '$SDKROOT/System/Library/Frameworks/Foundation.framework',
    '$SDKROOT/System/Library/Frameworks/UIKit.framework',
  ],
)
