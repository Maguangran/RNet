//
//  RNetManager.m
//  RNetManager
//
//  Created by bwrc on 16/12/1.
//  Copyright © 2016年 BWRC. All rights reserved.
//

#import "RNetManager.h"
#import "RNetRequest.h"
#import "RNetTask.h"

@implementation RNetManager

+(instancetype)sharedManager{
    static dispatch_once_t onceToken;
    static id instance;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[self alloc] init];
        }
    });
    return instance;
}

-(void)getDataWithUrlStr:(NSString *)urlStr andPara:(NSDictionary *)para andSuccess:(RNetSuccessHandler)success andFail:(RNetFailHandler)fail{
    RNetRequest *request = [RNetRequest requestWithURL:urlStr andPara:para WithType:RNetTypeGet];
    [self requestWithRequest:request andSuccess:success andFail:fail];
}

-(void)postDataWithUrlStr:(NSString *)urlStr andPara:(NSDictionary *)para andSuccess:(RNetSuccessHandler)success andFail:(RNetFailHandler)fail{
    RNetRequest *request = [RNetRequest requestWithURL:urlStr andPara:para WithType:RNetTypePost];
    [self requestWithRequest:request andSuccess:success andFail:fail];
}

-(void)requestWithRequest:(RNetRequest *)request andSuccess:(RNetSuccessHandler)success andFail:(RNetFailHandler)fail{
    RNetTask *task = [RNetTask taskWithConfiguration:self.configuration];
    [task taskStartWithRequest:request andSuccess:success andFail:fail];
}
@end
