# FMAnimationTransition
全屏滑动的实现方案：
//****************************************************************
function1:
    （1）创建全屏滑动手势，调用系统自带滑动手势的target的action方法
        id target = self.interactivePopGestureRecognizer.delegate;
    （2）设置手势代理，拦截手势触发
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)]; 
        pan.delegate = self;
    （3）给导航控制器的view添加全屏滑动手势
        [self.view addGestureRecognizer:pan];
    （4）禁止使用系统自带的滑动手势
        self.interactivePopGestureRecognizer.enabled = NO;
        
    - (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
    {
        if (self.childViewControllers.count == 1) {
            return NO;
        }
        return YES;
    }
//****************************************************************
function2:



待续......
