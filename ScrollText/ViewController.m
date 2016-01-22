//
//  ViewController.m
//  ScrollText
//
//  Created by roboca on 15/10/22.
//  Copyright © 2015年 roboca. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ScrollTextView *scrolltext = [[ScrollTextView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 40)];
    scrolltext.backgroundColor = [UIColor yellowColor];
    [scrolltext setStartPosition:170];
    [scrolltext setText:@"锄禾日当午，汗滴禾下土。谁知盘中餐，粒粒皆辛苦。"];
    [scrolltext setMargin:100];
    [scrolltext setSpeed:50];
    scrolltext.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    scrolltext.autoresizesSubviews = YES;
    [self.view addSubview:scrolltext];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
