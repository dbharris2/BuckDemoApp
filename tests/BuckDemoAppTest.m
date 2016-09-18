#import <XCTest/XCTest.h>
#import <UIKit/UIKit.h>

#import "AppDelegate.h"

@interface BuckDemoAppTest : XCTestCase
@end

@implementation BuckDemoAppTest

- (void)testHello
{
  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  XCTAssertEqualObjects(@"Hello world!", [appDelegate helloString]);
}

@end
