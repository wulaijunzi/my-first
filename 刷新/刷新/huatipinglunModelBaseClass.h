//
//  huatipinglunModelBaseClass.h
//
//  Created by 刘  on 15/11/27
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface huatipinglunModelBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double code;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, assign) double count;
@property (nonatomic, strong) NSArray *res;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
