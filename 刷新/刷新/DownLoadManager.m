//
//  DownLoadManager.m
//  DATEBAO
//
//  Created by liao on 15/6/28.
//  Copyright (c) 2015年 汪洋. All rights reserved.
//

#import "DownLoadManager.h"
#import "AFHTTPSessionManager.h"


@implementation DownLoadManager



+ (void)requestWithUrl:(NSString *)url dict:(NSDictionary *)parameters delegate:(id)downloaddelegate finishedSEL:(SEL)finished isPost:(BOOL)isPost failedSEL:(SEL)failed
{
    
    if (1) {
        
        if (isPost) {
            
            AFHTTPSessionManager *mymanager = [AFHTTPSessionManager manager];
            
            [mymanager POST:url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
                
                NSLog(@"responseObject is %@",responseObject);
                
                if (!downloaddelegate) {
                    return ;
                }
                
                @try {
                    [downloaddelegate performSelector:finished withObject:responseObject afterDelay:0];
                }
                @catch (NSException *exception) {
                    
                }
                @finally {
                    
                }
                
//                if (![responseObject objectForKey:@"code"] == 0) {
//                    UIAlertView *_alert = [[UIAlertView alloc]initWithTitle:@"提示" message:[responseObject objectForKey:@"message"] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//                    [_alert show];
//                }
                
                
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                [downloaddelegate performSelector:failed withObject:error afterDelay:0];
            }];
            
            
            
        }else{
            
            
            AFHTTPSessionManager *mymanager = [AFHTTPSessionManager manager];
            [mymanager GET:url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject){
                NSLog(@"responseObject is %@",responseObject);
                
                
                if (!downloaddelegate) {
                    return ;
                }
                
                @try {
                    [downloaddelegate performSelector:finished withObject:responseObject afterDelay:0];
                }
                @catch (NSException *exception) {
                    
                }
                @finally {
                    
                }
                
//                if (![responseObject objectForKey:@"code"] == 0) {
//                    UIAlertView *_alert = [[UIAlertView alloc]initWithTitle:@"提示" message:[responseObject objectForKey:@"message"] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//                    [_alert show];
//                }
                
                
            } failure:^(NSURLSessionDataTask *task, NSError *error){
                [downloaddelegate performSelector:failed withObject:error afterDelay:0];
            }];
        }
        
        
    }else{
        
        
    }
    
}
@end
