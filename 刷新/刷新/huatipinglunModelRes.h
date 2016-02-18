//
//  huatipinglunModelRes.h
//
//  Created by 刘  on 15/11/27
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface huatipinglunModelRes : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *updateTime;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *resIdentifier;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *isShow;
@property (nonatomic, strong) NSString *tid;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
