//
//  ViewController.m
//  TestCircle
//
//  Created by Сергей Романков on 03.04.16.
//  Copyright © 2016 Сергей Романков. All rights reserved.
//

#import "ViewController.h"
#import "CircleLayout.h"
#import "CircleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CircleView* view = [[CircleView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:view];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
