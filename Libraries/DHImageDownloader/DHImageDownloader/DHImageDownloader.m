#import "DHImageDownloader.h"

@implementation DHImageDownloader

#pragma mark - CKNetworkImageDownloading

- (id)downloadImageWithURL:(NSURL *)URL
                 scenePath:(id)scenePath
                    caller:(id)caller
             callbackQueue:(dispatch_queue_t)callbackQueue
     downloadProgressBlock:(void (^)(CGFloat progress))downloadProgressBlock
                completion:(void (^)(CGImageRef image, NSError *error))completion
{
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    NSError *error;
    NSData *imageData = [NSData dataWithContentsOfURL:URL
                                              options:NSDataReadingMappedIfSafe
                                                error:&error];
    UIImage *image = [[UIImage alloc] initWithData:imageData];
    dispatch_async(callbackQueue, ^{
      completion(image.CGImage, error);
    });
  });

  return @0;
}

- (void)cancelImageDownload:(id)download
{

}

@end
