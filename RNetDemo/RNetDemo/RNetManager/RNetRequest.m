//
//  RNetRequest.m
//  RNetManager
//
//  Created by bwrc on 16/11/30.
//  Copyright © 2016年 BWRC. All rights reserved.
//

#import "RNetRequest.h"
#import "RNetURLFormatter.h"

@implementation RNetRequest

+(instancetype)requestWithURL:(NSString *)urlStr andPara:(NSDictionary *)para WithType:(RNetType)type{
    RNetRequest *request;
    if (type == RNetTypeGet) {
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",urlStr,[[RNetURLFormatter defaultFormatter] formatWithPara:para andType:RNetTypeGet]]];
        request = [RNetRequest requestWithURL:url];
        request.HTTPMethod = @"GET";
    }else if (type == RNetTypePost){
        request = [RNetRequest requestWithURL:[NSURL URLWithString:urlStr]];
        request.HTTPMethod = @"POST";
        request.HTTPBody = [[[RNetURLFormatter defaultFormatter] formatWithPara:para andType:RNetTypePost] dataUsingEncoding:NSUTF8StringEncoding];
    }
    return request;
}

@end
