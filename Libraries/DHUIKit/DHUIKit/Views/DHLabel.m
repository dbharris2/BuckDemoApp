#import "DHLabel.h"

@implementation DHLabel {
  UILabel *_label;
}

- (instancetype)initWithText:(NSString *)text
{
  if (self = [super init]) {
    _label = [UILabel new];
    _label.backgroundColor = [UIColor purpleColor];
    _label.font = [UIFont boldSystemFontOfSize:32.0f];
    _label.text = text;

    [self addSubview:_label];
  }
  return self;
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  _label.frame = CGRectMake(0, 0, 200, 200);
}

@end
