//
//  RNetTask.h
//  RNetManager
//
//  Created by bwrc on 16/12/1.
//  Copyright © 2016年 BWRC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RNetManager.h"
#import "RNetRequest.h"
#import "RNetManagerConfiguration.h"
@interface RNetTask : NSObject

+(instancetype)defaultConfiguration;

+(instancetype)taskWithConfiguration:(RNetManagerConfiguration *)configuration;

-(void)taskStartWithRequest:(RNetRequest*)request andSuccess:(RNetSuccessHandler)success andFail:(RNetFailHandler)fail;

@end

