//
//  DownLoadManager.h
//  DATEBAO
//
//  Created by liao on 15/6/28.
//  Copyright (c) 2015年 汪洋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownLoadManager : NSObject
+ (void)requestWithUrl:(NSString *)url dict:(NSDictionary *)parameters delegate:(id)downloaddelegate finishedSEL:(SEL)finished isPost:(BOOL)isPost failedSEL:(SEL)failed;

@end
