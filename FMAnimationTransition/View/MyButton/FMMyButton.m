//
//  FMMyButton.m
//  FMAnimationTransition
//
//  Created by fm on 2017/4/27.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import "FMMyButton.h"

#define A_DURATION (arc4random()%4+2)

@implementation FMMyButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.f green:arc4random_uniform(255)/255.f blue:arc4random_uniform(255)/255.f alpha:1];
    }
    return self;
}

- (void)didMoveToSuperview
{
    [self startAnimation];
}

- (void)startAnimation
{
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.repeatCount = MAXFLOAT;
    pathAnimation.autoreverses = YES;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    pathAnimation.duration = A_DURATION;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(self.frame, self.frame.size.width/2-5, self.frame.size.width/2-5)];
    pathAnimation.path = path.CGPath;
    [self.layer addAnimation:pathAnimation forKey:@"pathAnimation"];
    
    CAKeyframeAnimation *scaleX=[CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
    scaleX.values = @[@1.0, @1.1, @1.0];
    scaleX.keyTimes = @[@0.0, @0.5,@1.0];
    scaleX.repeatCount = MAXFLOAT;
    scaleX.autoreverses = YES;
    scaleX.duration = A_DURATION;
    [self.layer addAnimation:scaleX forKey:@"scaleX"];
    
    CAKeyframeAnimation *scaleY=[CAKeyframeAnimation animationWithKeyPath:@"transform.scale.y"];
    scaleY.values = @[@1.0, @1.1, @1.0];
    scaleY.keyTimes = @[@0.0, @0.5,@1.0];
    scaleY.repeatCount = MAXFLOAT;
    scaleY.autoreverses = YES;
    scaleY.duration = A_DURATION;
    [self.layer addAnimation:scaleY forKey:@"scaleY"];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
