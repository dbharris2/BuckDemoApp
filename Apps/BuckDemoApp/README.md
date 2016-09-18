# BuckDemoApp
Testing out Facebook's Buck tool

### How to get up and running
- ```brew install buck```
- ```buck project //:BuckDemoApp``` ((this will generate a '.xcworkspace' file))
- If you don't want to use Xcode: ```buck install -r //:BuckDemoApp```
- If you do want to use Xcode: ```open BuckDemoApp.xcworkspace/```
