//
//  ViewController.m
//  TabBarFit_Demo
//
//  Created by yu on 2017/11/24.
//  Copyright © 2017年 timely. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];
    
    CGFloat buttonWidth = 80;
    NSArray *titles = @[@"modal", @"push"];
    for (int i = 0; i < titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 1000 + i;
        [self.view addSubview:button];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button addTarget: self action:@selector(testButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake((self.view.bounds.size.width - buttonWidth) / 2, 200 + 100 * i, buttonWidth, 35);
    }
    
}

- (void)testButtonAction:(UIButton *)sender {
    
    if (sender.tag - 1000 == 0) {
        UIViewController *modalCtrl = [[UIViewController alloc] init];
        modalCtrl.view.backgroundColor = [UIColor grayColor];
        [self presentViewController:modalCtrl animated:YES completion:nil];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [modalCtrl dismissViewControllerAnimated:YES completion:nil];
        });
    } else {
        UIViewController *pushCtrl = [[UIViewController alloc] init];
        pushCtrl.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:pushCtrl animated:YES];
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
