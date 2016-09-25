#import "AppViewController.h"

#import <ComponentKit/CKComponentFlexibleSizeRangeProvider.h>
#import <ComponentKit/CKComponentHostingView.h>
#import <ComponentKit/CKNetworkImageComponent.h>
#import <ComponentKit/CKStackLayoutComponent.h>

#import <DHImageDownloader/DHImageDownloader.h>
#import <DHUIKit/DHLabelComponent.h>

#import "APOD.h"
#import "APODModel.h"

@implementation AppViewController {
  CKComponentHostingView *_apod;
  DHImageDownloader *_imageDownloader;
}

- (instancetype)init
{
  if (self = [super init]) {
    _apod = [[CKComponentHostingView alloc] initWithComponentProvider:[self class]
                                                    sizeRangeProvider:[CKComponentFlexibleSizeRangeProvider providerWithFlexibility:CKComponentSizeRangeFlexibleHeight]];
    _imageDownloader = [DHImageDownloader new];
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor whiteColor];
  [self.view addSubview:_apod];

  [self getDataFrom:@"https://api.nasa.gov/planetary/apod?api_key=SauwprTFEG9P39EALC2b6ACQ0BBpbg4YF43xWCgD&date=2016-09-25"];
}

- (void)viewDidLayoutSubviews
{
  [super viewDidLayoutSubviews];

  _apod.frame = (CGRect) {
    .origin = {.x = 0, .y = self.topLayoutGuide.length},
    .size = {.width = CGRectGetWidth(self.view.bounds), .height = CGRectGetHeight(self.view.bounds)}
  };
}

- (void)getDataFrom:(NSString *)url
{
  NSMutableURLRequest *request = [NSMutableURLRequest new];
  [request setHTTPMethod:@"GET"];
  [request setURL:[NSURL URLWithString:url]];

  NSURLSession *session = [NSURLSession sharedSession];

  __weak auto weakSelf = self;
  NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                          completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                            auto strongSelf = weakSelf;
                                            if (strongSelf != nil) {
                                              NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                                                                   options:NSJSONReadingMutableContainers
                                                                                                     error:nil];

                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                APODModel *model = [[APODModel alloc] initWithAPOD:[APOD modelObjectWithDictionary:json]
                                                                                   imageDownloader:strongSelf->_imageDownloader];
                                                [strongSelf->_apod updateModel:model mode:CKUpdateModeAsynchronous];
                                              });
                                            }
                                          }];

  [task resume];
}

#pragma mark - CKComponentProvider

+ (CKComponent *)componentForModel:(APODModel *)model context:(id<NSObject>)context
{
  return [CKStackLayoutComponent
          newWithView:{}
          size:{}
          style:{
            .direction = CKStackLayoutDirectionVertical,
            .spacing = 20,
          }
          children:{
            {
              [DHLabelComponent newWithText:model.apod.title]
            },
            {
              [DHLabelComponent newWithText:model.apod.explanation]
            },
            {
              [CKNetworkImageComponent
               newWithURL:[NSURL URLWithString:model.apod.url]
               imageDownloader:model.imageDownloader
               scenePath:nil
               size:{
                 .width = 300,
                 .height = 300,
               }
               options:{}
               attributes:{}]
            },
          }];
}

@end
