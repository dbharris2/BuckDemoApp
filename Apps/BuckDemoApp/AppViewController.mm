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

  const CGSize labelSize = [_label sizeThatFits:{
    .width = CGRectGetWidth(self.view.bounds),
    .height = CGRectGetHeight(self.view.bounds)
  }];

  _label.frame = (CGRect) {
    .origin = {.x = 0, .y = self.topLayoutGuide.length},
    .size = {.width = labelSize.width, .height = labelSize.height}
  };
}

#pragma mark - CKComponentProvider

+ (CKComponent *)componentForModel:(id<NSObject>)model context:(id<NSObject>)context
{
  return [DHLabelComponent newWithText:@"DHLabelComponent!"];
}

@end
