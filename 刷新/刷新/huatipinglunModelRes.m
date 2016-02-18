//
//  huatipinglunModelRes.m
//
//  Created by 刘  on 15/11/27
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "huatipinglunModelRes.h"


NSString *const khuatipinglunModelResUpdateTime = @"update_time";
NSString *const khuatipinglunModelResImg = @"img";
NSString *const khuatipinglunModelResUid = @"uid";
NSString *const khuatipinglunModelResId = @"id";
NSString *const khuatipinglunModelResContent = @"content";
NSString *const khuatipinglunModelResUsername = @"username";
NSString *const khuatipinglunModelResCreateTime = @"create_time";
NSString *const khuatipinglunModelResIsShow = @"is_show";
NSString *const khuatipinglunModelResTid = @"tid";


@interface huatipinglunModelRes ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation huatipinglunModelRes

@synthesize updateTime = _updateTime;
@synthesize img = _img;
@synthesize uid = _uid;
@synthesize resIdentifier = _resIdentifier;
@synthesize content = _content;
@synthesize username = _username;
@synthesize createTime = _createTime;
@synthesize isShow = _isShow;
@synthesize tid = _tid;


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
            self.updateTime = [self objectOrNilForKey:khuatipinglunModelResUpdateTime fromDictionary:dict];
            self.img = [self objectOrNilForKey:khuatipinglunModelResImg fromDictionary:dict];
            self.uid = [self objectOrNilForKey:khuatipinglunModelResUid fromDictionary:dict];
            self.resIdentifier = [self objectOrNilForKey:khuatipinglunModelResId fromDictionary:dict];
            self.content = [self objectOrNilForKey:khuatipinglunModelResContent fromDictionary:dict];
            self.username = [self objectOrNilForKey:khuatipinglunModelResUsername fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:khuatipinglunModelResCreateTime fromDictionary:dict];
            self.isShow = [self objectOrNilForKey:khuatipinglunModelResIsShow fromDictionary:dict];
            self.tid = [self objectOrNilForKey:khuatipinglunModelResTid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.updateTime forKey:khuatipinglunModelResUpdateTime];
    [mutableDict setValue:self.img forKey:khuatipinglunModelResImg];
    [mutableDict setValue:self.uid forKey:khuatipinglunModelResUid];
    [mutableDict setValue:self.resIdentifier forKey:khuatipinglunModelResId];
    [mutableDict setValue:self.content forKey:khuatipinglunModelResContent];
    [mutableDict setValue:self.username forKey:khuatipinglunModelResUsername];
    [mutableDict setValue:self.createTime forKey:khuatipinglunModelResCreateTime];
    [mutableDict setValue:self.isShow forKey:khuatipinglunModelResIsShow];
    [mutableDict setValue:self.tid forKey:khuatipinglunModelResTid];

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

    self.updateTime = [aDecoder decodeObjectForKey:khuatipinglunModelResUpdateTime];
    self.img = [aDecoder decodeObjectForKey:khuatipinglunModelResImg];
    self.uid = [aDecoder decodeObjectForKey:khuatipinglunModelResUid];
    self.resIdentifier = [aDecoder decodeObjectForKey:khuatipinglunModelResId];
    self.content = [aDecoder decodeObjectForKey:khuatipinglunModelResContent];
    self.username = [aDecoder decodeObjectForKey:khuatipinglunModelResUsername];
    self.createTime = [aDecoder decodeObjectForKey:khuatipinglunModelResCreateTime];
    self.isShow = [aDecoder decodeObjectForKey:khuatipinglunModelResIsShow];
    self.tid = [aDecoder decodeObjectForKey:khuatipinglunModelResTid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_updateTime forKey:khuatipinglunModelResUpdateTime];
    [aCoder encodeObject:_img forKey:khuatipinglunModelResImg];
    [aCoder encodeObject:_uid forKey:khuatipinglunModelResUid];
    [aCoder encodeObject:_resIdentifier forKey:khuatipinglunModelResId];
    [aCoder encodeObject:_content forKey:khuatipinglunModelResContent];
    [aCoder encodeObject:_username forKey:khuatipinglunModelResUsername];
    [aCoder encodeObject:_createTime forKey:khuatipinglunModelResCreateTime];
    [aCoder encodeObject:_isShow forKey:khuatipinglunModelResIsShow];
    [aCoder encodeObject:_tid forKey:khuatipinglunModelResTid];
}

- (id)copyWithZone:(NSZone *)zone
{
    huatipinglunModelRes *copy = [[huatipinglunModelRes alloc] init];
    
    if (copy) {

        copy.updateTime = [self.updateTime copyWithZone:zone];
        copy.img = [self.img copyWithZone:zone];
        copy.uid = [self.uid copyWithZone:zone];
        copy.resIdentifier = [self.resIdentifier copyWithZone:zone];
        copy.content = [self.content copyWithZone:zone];
        copy.username = [self.username copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.isShow = [self.isShow copyWithZone:zone];
        copy.tid = [self.tid copyWithZone:zone];
    }
    
    return copy;
}


@end
