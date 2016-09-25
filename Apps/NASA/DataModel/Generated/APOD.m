//
//  APOD.m
//
//  Created by   on 9/24/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "APOD.h"


NSString *const kAPODTitle = @"title";
NSString *const kAPODCopyright = @"copyright";
NSString *const kAPODMediaType = @"media_type";
NSString *const kAPODHdurl = @"hdurl";
NSString *const kAPODExplanation = @"explanation";
NSString *const kAPODServiceVersion = @"service_version";
NSString *const kAPODDate = @"date";
NSString *const kAPODUrl = @"url";


@interface APOD ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation APOD

@synthesize title = _title;
@synthesize copyright = _copyright;
@synthesize mediaType = _mediaType;
@synthesize hdurl = _hdurl;
@synthesize explanation = _explanation;
@synthesize serviceVersion = _serviceVersion;
@synthesize date = _date;
@synthesize url = _url;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.title = [self objectOrNilForKey:kAPODTitle fromDictionary:dict];
            self.copyright = [self objectOrNilForKey:kAPODCopyright fromDictionary:dict];
            self.mediaType = [self objectOrNilForKey:kAPODMediaType fromDictionary:dict];
            self.hdurl = [self objectOrNilForKey:kAPODHdurl fromDictionary:dict];
            self.explanation = [self objectOrNilForKey:kAPODExplanation fromDictionary:dict];
            self.serviceVersion = [self objectOrNilForKey:kAPODServiceVersion fromDictionary:dict];
            self.date = [self objectOrNilForKey:kAPODDate fromDictionary:dict];
            self.url = [self objectOrNilForKey:kAPODUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kAPODTitle];
    [mutableDict setValue:self.copyright forKey:kAPODCopyright];
    [mutableDict setValue:self.mediaType forKey:kAPODMediaType];
    [mutableDict setValue:self.hdurl forKey:kAPODHdurl];
    [mutableDict setValue:self.explanation forKey:kAPODExplanation];
    [mutableDict setValue:self.serviceVersion forKey:kAPODServiceVersion];
    [mutableDict setValue:self.date forKey:kAPODDate];
    [mutableDict setValue:self.url forKey:kAPODUrl];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.title = [aDecoder decodeObjectForKey:kAPODTitle];
    self.copyright = [aDecoder decodeObjectForKey:kAPODCopyright];
    self.mediaType = [aDecoder decodeObjectForKey:kAPODMediaType];
    self.hdurl = [aDecoder decodeObjectForKey:kAPODHdurl];
    self.explanation = [aDecoder decodeObjectForKey:kAPODExplanation];
    self.serviceVersion = [aDecoder decodeObjectForKey:kAPODServiceVersion];
    self.date = [aDecoder decodeObjectForKey:kAPODDate];
    self.url = [aDecoder decodeObjectForKey:kAPODUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kAPODTitle];
    [aCoder encodeObject:_copyright forKey:kAPODCopyright];
    [aCoder encodeObject:_mediaType forKey:kAPODMediaType];
    [aCoder encodeObject:_hdurl forKey:kAPODHdurl];
    [aCoder encodeObject:_explanation forKey:kAPODExplanation];
    [aCoder encodeObject:_serviceVersion forKey:kAPODServiceVersion];
    [aCoder encodeObject:_date forKey:kAPODDate];
    [aCoder encodeObject:_url forKey:kAPODUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    APOD *copy = [[APOD alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.copyright = [self.copyright copyWithZone:zone];
        copy.mediaType = [self.mediaType copyWithZone:zone];
        copy.hdurl = [self.hdurl copyWithZone:zone];
        copy.explanation = [self.explanation copyWithZone:zone];
        copy.serviceVersion = [self.serviceVersion copyWithZone:zone];
        copy.date = [self.date copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end
