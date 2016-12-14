//
//  RNetReponseManager.m
//  RNetManager
//
//  Created by bwrc on 16/12/1.
//  Copyright © 2016年 BWRC. All rights reserved.
//

#import "RNetReponseManager.h"

@implementation RNetReponseManager
+(NSError *)errorHandlerWithReponse:(NSHTTPURLResponse*)reponse andError:(NSError *)error{
    
    if (error) {
        return error;
    }
    
    switch (reponse.statusCode) {
        case 200:
            NSLog(@"请求成功");
            if ([reponse.URL.absoluteString containsString:@"www.hugedomains.com"]) {
                return [NSError errorWithDomain:NSURLErrorDomain code:reponse.statusCode userInfo:reponse.allHeaderFields];
            }
            return nil;
            break;
        default:
        {
            NSError *statusError = [NSError errorWithDomain:NSURLErrorDomain code:reponse.statusCode userInfo:reponse.allHeaderFields];
            return statusError;
        }
            break;
    }
    return nil;
}
@end
