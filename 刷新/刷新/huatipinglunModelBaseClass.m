//
//  huatipinglunModelBaseClass.m
//
//  Created by 刘  on 15/11/27
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "huatipinglunModelBaseClass.h"
#import "huatipinglunModelRes.h"


NSString *const khuatipinglunModelBaseClassCode = @"code";
NSString *const khuatipinglunModelBaseClassMessage = @"message";
NSString *const khuatipinglunModelBaseClassCount = @"count";
NSString *const khuatipinglunModelBaseClassRes = @"res";


@interface huatipinglunModelBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation huatipinglunModelBaseClass

@synthesize code = _code;
@synthesize message = _message;
@synthesize count = _count;
@synthesize res = _res;


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
            self.code = [[self objectOrNilForKey:khuatipinglunModelBaseClassCode fromDictionary:dict] doubleValue];
            self.message = [self objectOrNilForKey:khuatipinglunModelBaseClassMessage fromDictionary:dict];
            self.count = [[self objectOrNilForKey:khuatipinglunModelBaseClassCount fromDictionary:dict] doubleValue];
    NSObject *receivedhuatipinglunModelRes = [dict objectForKey:khuatipinglunModelBaseClassRes];
    NSMutableArray *parsedhuatipinglunModelRes = [NSMutableArray array];
    if ([receivedhuatipinglunModelRes isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedhuatipinglunModelRes) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedhuatipinglunModelRes addObject:[huatipinglunModelRes modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedhuatipinglunModelRes isKindOfClass:[NSDictionary class]]) {
       [parsedhuatipinglunModelRes addObject:[huatipinglunModelRes modelObjectWithDictionary:(NSDictionary *)receivedhuatipinglunModelRes]];
    }

    self.res = [NSArray arrayWithArray:parsedhuatipinglunModelRes];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:khuatipinglunModelBaseClassCode];
    [mutableDict setValue:self.message forKey:khuatipinglunModelBaseClassMessage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:khuatipinglunModelBaseClassCount];
    NSMutableArray *tempArrayForRes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.res) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForRes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForRes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRes] forKey:khuatipinglunModelBaseClassRes];

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

    self.code = [aDecoder decodeDoubleForKey:khuatipinglunModelBaseClassCode];
    self.message = [aDecoder decodeObjectForKey:khuatipinglunModelBaseClassMessage];
    self.count = [aDecoder decodeDoubleForKey:khuatipinglunModelBaseClassCount];
    self.res = [aDecoder decodeObjectForKey:khuatipinglunModelBaseClassRes];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_code forKey:khuatipinglunModelBaseClassCode];
    [aCoder encodeObject:_message forKey:khuatipinglunModelBaseClassMessage];
    [aCoder encodeDouble:_count forKey:khuatipinglunModelBaseClassCount];
    [aCoder encodeObject:_res forKey:khuatipinglunModelBaseClassRes];
}

- (id)copyWithZone:(NSZone *)zone
{
    huatipinglunModelBaseClass *copy = [[huatipinglunModelBaseClass alloc] init];
    
    if (copy) {

        copy.code = self.code;
        copy.message = [self.message copyWithZone:zone];
        copy.count = self.count;
        copy.res = [self.res copyWithZone:zone];
    }
    
    return copy;
}


@end
