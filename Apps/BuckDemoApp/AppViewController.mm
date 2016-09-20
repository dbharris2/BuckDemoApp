#import "AppViewController.h"

#import <ComponentKit/CKComponentHostingView.h>
#import <ComponentKit/CKComponentFlexibleSizeRangeProvider.h>
#import <ComponentKit/CKComponentProvider.h>
#import <DHUIKit/DHLabelComponent.h>

@interface AppViewController () <CKComponentProvider>
@end

@implementation AppViewController {
  CKComponentHostingView *_label;
  NSString *_helloString;
}

- (instancetype)initWithHelloString:(NSString *)helloString
{
  if (self = [super init]) {
    _helloString = helloString;
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor whiteColor];

  _label = [[CKComponentHostingView alloc] initWithComponentProvider:[self class]
                                                   sizeRangeProvider:[CKComponentFlexibleSizeRangeProvider providerWithFlexibility:CKComponentSizeRangeFlexibleHeight]];
  [self.view addSubview:_label];

  [_label updateModel:@1 mode:CKUpdateModeSynchronous];
}

- (void)viewDidLayoutSubviews
{
  [super viewDidLayoutSubviews];
  _label.frame = CGRectMake(0,
                            200,
                            self.view.frame.size.width * 0.5f,
                            self.view.frame.size.height * 0.5f);
}

#pragma mark - CKComponentProvider

+ (CKComponent *)componentForModel:(id<NSObject>)model context:(id<NSObject>)context
{
  return [DHLabelComponent newWithText:@"ComponentKit!"];
}

@end
