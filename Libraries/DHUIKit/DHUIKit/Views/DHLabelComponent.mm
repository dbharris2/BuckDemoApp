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
           }
           viewAttributes:{
             {@selector(setBackgroundColor:), [UIColor clearColor]},
           }
           size:{}]];
}

@end
