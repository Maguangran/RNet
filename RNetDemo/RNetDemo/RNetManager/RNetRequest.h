//
//  RNetRequest.h
//  RNetManager
//
//  Created by bwrc on 16/11/30.
//  Copyright © 2016年 BWRC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RNetManager.h"

@interface RNetRequest : NSMutableURLRequest

+(instancetype)requestWithURL:(NSString *)URL andPara:(NSDictionary *)para WithType:(RNetType)type;

@end
