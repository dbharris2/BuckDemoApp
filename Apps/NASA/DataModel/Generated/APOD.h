//
//  APOD.h
//
//  Created by   on 9/24/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface APOD : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *copyright;
@property (nonatomic, strong) NSString *mediaType;
@property (nonatomic, strong) NSString *hdurl;
@property (nonatomic, strong) NSString *explanation;
@property (nonatomic, strong) NSString *serviceVersion;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *url;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
