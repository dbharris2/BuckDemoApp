#import "AppViewController.h"

@implementation AppViewController {
  UILabel *_label;
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

  _label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, 80.0f)];
  _label.adjustsFontSizeToFitWidth = YES;
  _label.backgroundColor = [UIColor clearColor];
  _label.font = [UIFont boldSystemFontOfSize:32.0f];
  _label.text = _helloString;
  _label.textAlignment = NSTextAlignmentCenter;

  [self.view addSubview:_label];
}

- (void)viewDidLayoutSubviews
{
  [super viewDidLayoutSubviews];
  _label.center = CGPointMake(
    self.view.frame.size.width * 0.5f,
    self.view.frame.size.height * 0.5f
  );
}

@end
