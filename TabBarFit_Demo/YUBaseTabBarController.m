//
//  YUBaseTabBarController.m
//  TabBarFit_Demo
//
//  Created by yu on 2017/11/24.
//  Copyright © 2017年 timely. All rights reserved.
//

#import "YUBaseTabBarController.h"
#import "YUBaseTabBar.h"
#import "ViewController.h"
#import "YUBaseNavigationController.h"

#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

@interface YUBaseTabBarController ()

@end

@implementation YUBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

//    if (kDevice_Is_iPhoneX) {
//        YUBaseTabBar *baseTabBar = [[YUBaseTabBar alloc] init];
//        [self setValue:baseTabBar forKey:@"tabBar"];
//    }
    self.tabBar.tintColor = [UIColor redColor];
    
    
    [self setupAllChildViewControllers];
    
}

/**
 *  初始化所有的子控制器
 */
- (void)setupAllChildViewControllers
{
    NSArray *titles = @[@"首页", @"论坛", @"发现", @"我的"];
    NSArray *imageNames = @[@"tab_news", @"tab_forum", @"tab_selectCar", @"tab_mySpace"];
    
    for (int i = 0; i < 4; i++) {
        NSString *imageName = [imageNames[i] stringByAppendingString:@"_normal"];
        NSString *selectedImageName = [imageNames[i] stringByAppendingString:@"_highlighted"];
        ViewController *homeCtrl = [[ViewController alloc] init];
        [self setupChildViewController:homeCtrl title:titles[i] imageName:imageName selectedImageName:selectedImageName];
    }

}


/**
 * 初始化子控制器
 */
- (void)setupChildViewController:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 设置文字
    vc.title = title;
    vc.tabBarItem.title = title;
    //    vc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    
    // 设置普通状态下图片
    UIImage *normalImage = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.image = normalImage;
    
    // 设置选中状态下图片
    UIImage *selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = selectedImage;
    
    // 包装一个导航控制器
    YUBaseNavigationController *nav = [[YUBaseNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
