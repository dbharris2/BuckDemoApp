#import <Foundation/Foundation.h>

@class APOD;
@protocol CKNetworkImageDownloading;

@interface APODModel : NSObject

- (instancetype)initWithAPOD:(APOD *)apod imageDownloader:(id<CKNetworkImageDownloading>)imageDownloader;

@property (nonatomic, strong, readonly) APOD *apod;
@property (nonatomic, strong, readonly) id<CKNetworkImageDownloading> imageDownloader;

@end
