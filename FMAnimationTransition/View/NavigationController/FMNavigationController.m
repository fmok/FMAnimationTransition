//
//  FMNavigationController.m
//  FMAnimationTransition
//
//  Created by fm on 2017/4/27.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import "FMNavigationController.h"

@interface FMNavigationController ()<UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@end

@implementation FMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self fullScreenPopFuncOne];
}

//****************************************** function 1 **********************************************
- (void)fullScreenPopFuncOne
{
    // 创建全屏滑动手势，调用系统自带滑动手势的target的action方法
    id target = self.interactivePopGestureRecognizer.delegate;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];
    self.interactivePopGestureRecognizer.enabled = NO;
    
    // 实现以下代理 - (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.childViewControllers.count == 1) {
        return NO;
    }
    return YES;
}

//****************************************** function 2 **********************************************



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
