//
//  RNetURLFormatter.m
//  RNetManager
//
//  Created by bwrc on 16/12/1.
//  Copyright © 2016年 BWRC. All rights reserved.
//

#import "RNetURLFormatter.h"

@implementation RNetURLFormatter

+(instancetype)defaultFormatter{
    RNetURLFormatter *formatter = [[RNetURLFormatter alloc] init];
    [formatter setUrlFormatter:@"?!@#$^&%*+,:;='\"`<>()[]{}/\\|"];
    return formatter;
}
-(NSString *)formatWithPara:(NSDictionary *)para andType:(RNetType)type{
    NSMutableString *paraStr = [NSMutableString stringWithString:@""];
    [para enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [paraStr appendString:[NSString stringWithFormat:@"&%@=%@",key,obj]];
    }];
    if (paraStr.length != 0) {
        NSString *prefix ;
        if (type == RNetTypeGet) {
            prefix = @"?";
        }else{
            prefix = @"";
        }
        [paraStr replaceCharactersInRange:NSMakeRange(0, 1) withString:prefix];
    }
    NSAssert(self.format != nil, @"set format first...");
    return [paraStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:self.format]];
}
@end
