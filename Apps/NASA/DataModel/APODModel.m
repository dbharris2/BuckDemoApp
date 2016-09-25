#import "APODModel.h"

@implementation APODModel

- (instancetype)initWithAPOD:(APOD *)apod imageDownloader:(id<CKNetworkImageDownloading>)imageDownloader
{
  if (self = [super init]) {
    _apod = apod;
    _imageDownloader = imageDownloader;
  }
  return self;
}

@end
