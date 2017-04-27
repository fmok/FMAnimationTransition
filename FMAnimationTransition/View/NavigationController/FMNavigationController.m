//
//  FMNavigationController.m
//  FMAnimationTransition
//
//  Created by fm on 2017/4/27.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import "FMNavigationController.h"
#import <objc/runtime.h>

@interface FMNavigationController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong, readonly) UIPanGestureRecognizer *fullscreenPopGestureRecognizer;

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
    if (![self.interactivePopGestureRecognizer.view.gestureRecognizers containsObject:self.fullscreenPopGestureRecognizer]) {
        [self.interactivePopGestureRecognizer.view addGestureRecognizer:self.fullscreenPopGestureRecognizer];
        NSArray *internalTargets = [self.interactivePopGestureRecognizer valueForKey:@"targets"];
        id internalTarget = [internalTargets.firstObject valueForKey:@"target"];
        SEL internalAction = NSSelectorFromString(@"handleNavigationTransition:");
        self.fullscreenPopGestureRecognizer.delegate = self;
        [self.fullscreenPopGestureRecognizer addTarget:internalTarget action:internalAction];
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    // 实现以下代理 - (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.childViewControllers.count == 1) {
        return NO;
    }
    return YES;
}

#pragma mark - getter & setter
- (UIPanGestureRecognizer *)fullscreenPopGestureRecognizer
{
    UIPanGestureRecognizer *panGestureRecognizer = objc_getAssociatedObject(self, _cmd);
    if (!panGestureRecognizer) {
        panGestureRecognizer = [[UIPanGestureRecognizer alloc] init];
        panGestureRecognizer.maximumNumberOfTouches = 1;
        objc_setAssociatedObject(self, _cmd, panGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return panGestureRecognizer;
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
