//
//  RNetManager.h
//  RNetManager
//
//  Created by bwrc on 16/12/1.
//  Copyright © 2016年 BWRC. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "RNetManagerConfiguration.h"

typedef NS_ENUM(NSUInteger, RNetType) {
    RNetTypeGet = 1,
    RNetTypePost = 2,
};

typedef void(^RNetSuccessHandler)(id response);

typedef void (^RNetFailHandler)(id error);

@interface RNetManager : NSObject

+(instancetype)sharedManager;

@property (nonatomic,strong) RNetManagerConfiguration *configuration;

-(void)getDataWithUrlStr:(NSString *)urlStr andPara:(NSDictionary *)para andSuccess:(RNetSuccessHandler)success andFail:(RNetFailHandler)fail;

-(void)postDataWithUrlStr:(NSString *)urlStr andPara:(NSDictionary *)para andSuccess:(RNetSuccessHandler)success andFail:(RNetFailHandler)fail;

@end
