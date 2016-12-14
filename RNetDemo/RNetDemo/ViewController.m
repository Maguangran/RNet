//
//  ViewController.m
//  RNetDemo
//
//  Created by bwrc on 16/12/14.
//  Copyright © 2016年 BWRC. All rights reserved.
//

#import "ViewController.h"
#import "RNet.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)getData:(id)sender {
    [[RNetManager sharedManager] getDataWithUrlStr:@"http://npc.bjbwrc.com/buss/GetCategorys.ashx" andPara:@{@"cn":@"1"} andSuccess:^(id response) {
        NSLog(@"success--\n");
        NSLog(@"response --\n %@",response);
    } andFail:^(id error) {
        NSLog(@"fail handler--\n");
        NSLog(@"%@",error);
    }];
}

- (IBAction)postData:(id)sender {
    [[RNetManager sharedManager] postDataWithUrlStr:@"http://npc.bjbwrc.com/buss/GetCategorys.ashx" andPara:@{@"cn":@"1"} andSuccess:^(id response) {
        NSLog(@"success--\n");
        NSLog(@"response --\n %@",response);
    } andFail:^(id error) {
        NSLog(@"fail handler--\n");
        NSLog(@"%@",error);
    }];
}



@end
