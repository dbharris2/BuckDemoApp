### Setup
- ```brew update```
- ```brew tap facebook/fb```
- ```brew install buck```
- ```brew install watchman```

### How to get up and running
- ```cd iOS```
- ```git submodule update --init```
- If you don't want to use Xcode:
  - ```buck build demo_app```
  - ```buck install -r demo_app```
- If you do want to use Xcode: 
  - ```buck project demo_app``` (this will generate a '.xcworkspace' file)
  - ```open Apps/BuckDemoApp/BuckDemoApp.xcworkspace/```
