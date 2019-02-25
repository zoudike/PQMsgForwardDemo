//
//  ViewController.m
//  PQMsgForwardDemo
//
//  Created by wenpq on 2019/2/25.
//  Copyright © 2019年 wenpq. All rights reserved.
//

#import "ViewController.h"
#import "PQPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    PQPerson *person = [[PQPerson alloc] init];
    [person performSelector:@selector(wolk)];
    [person performSelector:@selector(study:) withObject:@"内容"];
    [person performSelector:@selector(workWith:) withObject:@"键盘"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
