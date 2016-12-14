//
//  RNetReponseManager.h
//  RNetManager
//
//  Created by bwrc on 16/12/1.
//  Copyright © 2016年 BWRC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RNetManager.h"
@interface RNetReponseManager : NSObject
+(NSError*)errorHandlerWithReponse:(NSHTTPURLResponse*)reponse andError:(NSError *)error;
@end
