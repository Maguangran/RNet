//
//  RNetURLFormatter.h
//  RNetManager
//
//  Created by bwrc on 16/12/1.
//  Copyright © 2016年 BWRC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RNetManager.h"
@interface RNetURLFormatter : NSObject

@property (nonatomic,copy,setter=setUrlFormatter:) NSString *format;

+(instancetype)defaultFormatter;

-(NSString *)formatWithPara:(NSDictionary *)para andType:(RNetType)type;

@end
