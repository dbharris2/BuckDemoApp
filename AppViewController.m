#import "AppViewController.h"

#import <DHUIKit/DHLabel.h>

@implementation AppViewController {
  DHLabel *_label;
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

  _label = [[DHLabel alloc] initWithText:_helloString];
  [self.view addSubview:_label];
}

- (void)viewDidLayoutSubviews
{
  [super viewDidLayoutSubviews];
  _label.frame = CGRectMake(0,
                            0,
                            self.view.frame.size.width * 0.5f,
                            self.view.frame.size.height * 0.5f);
}

@end
