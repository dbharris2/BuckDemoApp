#import "DHLabelComponent.h"

#import <ComponentKit/CKLabelComponent.h>

@implementation DHLabelComponent {
  UILabel *_label;
}

+ (instancetype)newWithText:(NSString *)text
{
  return [super newWithComponent:
          [CKLabelComponent
           newWithLabelAttributes:{
             .string = text,
             .font = [UIFont systemFontOfSize:32 weight:1],
           }
           viewAttributes:{}
           size:{}]];
}

@end
