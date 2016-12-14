//
//  RNetTask.m
//  RNetManager
//
//  Created by bwrc on 16/12/1.
//  Copyright © 2016年 BWRC. All rights reserved.
//

#import "RNetTask.h"
#import "RNetReponseManager.h"
#import "RNetReponseManager.h"
@interface RNetTask ()<NSURLSessionDelegate>

@property (nonatomic,strong) NSURLSessionConfiguration *sessionConfiguration;

@property (nonatomic,copy) RNetSuccessHandler success;
@property (nonatomic,copy) RNetFailHandler fail;

@end
@implementation RNetTask

+(instancetype)defaultConfiguration{
    RNetTask *task = [[RNetTask alloc] init];
    task.sessionConfiguration = [RNetManagerConfiguration defaultSessionConfiguration];
    return task;
}

+(instancetype)taskWithConfiguration:(RNetManagerConfiguration *)configuration{
    RNetTask *task = [[RNetTask alloc] init];
    task.sessionConfiguration = configuration ? configuration : [RNetManagerConfiguration defaultSessionConfiguration];
    return task;
}

-(void)taskStartWithRequest:(RNetRequest*)request andSuccess:(RNetSuccessHandler)success andFail:(RNetFailHandler)fail{
    NSURLSession *session = [NSURLSession sessionWithConfiguration:self.sessionConfiguration delegate:self delegateQueue:[NSOperationQueue new]];

    NSURLSessionTask * task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *rError = [RNetReponseManager errorHandlerWithReponse:(NSHTTPURLResponse*)response andError:error];
        if (rError) {
            if (fail) {
                fail(rError);
            }
            return ;
        }
        if (!data) {
            fail(error);
        }
        id re = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];

        success(re);
    }];
    
//    self.success = success;
//    self.fail = fail;
    [task resume];
}

#pragma -mark urlSessionTaskDelegate

/*
 * Sent when complete statistics information has been collected for the task.
 */
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didFinishCollectingMetrics:(NSURLSessionTaskMetrics *)metrics API_AVAILABLE(macosx(10.12), ios(10.0), watchos(3.0), tvos(10.0)){
    NSLog(@"%s",__func__);
}

/* Sent as the last message related to a specific task.  Error may be
 * nil, which implies that no error occurred and this task is complete.
 */
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
didCompleteWithError:(nullable NSError *)error{
    NSLog(@"%s",__func__);
    
}


@end
