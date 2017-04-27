//
//  ViewController.m
//  FMAnimationTransition
//
//  Created by fm on 2017/4/27.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import "ViewController.h"
#import "FMMyButton.h"

#define Diameter_btn 100.f

@interface ViewController ()

@property (nonatomic, strong) FMMyButton *pushBtn;
@property (nonatomic, strong) FMMyButton *popBtn;
@property (nonatomic, assign) NSInteger index;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = [NSString stringWithFormat:@"page:%@",@(self.index)];
    [self initUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"\n** %s *** index: %@ ** \n", __FUNCTION__,@(self.index));
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"\n** %s *** index: %@ ** \n", __FUNCTION__,@(self.index));
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"\n** %s *** index: %@ ** \n", __FUNCTION__,@(self.index));
}

#pragma mark - Private methods
- (void)initUI
{
    CGPoint mainPoint = self.view.center;
    self.pushBtn.center = CGPointMake(mainPoint.x, mainPoint.y - Diameter_btn);
    [self.view addSubview:self.pushBtn];
    
    self.popBtn.center = CGPointMake(mainPoint.x, mainPoint.y + Diameter_btn);
    [self.view addSubview:self.popBtn];
}

#pragma mark - Events
- (void)btnClick:(FMMyButton *)sender
{
    if (sender.tag == 100) {
        ViewController *vc = [[ViewController alloc] init];
        vc.index = self.index+1;
        [self.navigationController pushViewController:vc animated:YES];
    } else if (sender.tag == 101) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - getter & setter
- (FMMyButton *)pushBtn
{
    if (!_pushBtn) {
        _pushBtn = [FMMyButton buttonWithType:UIButtonTypeCustom];
        _pushBtn.frame = CGRectMake(0, 0, Diameter_btn, Diameter_btn);
        _pushBtn.layer.cornerRadius = CGRectGetWidth(_pushBtn.frame)/2.f;
        _pushBtn.clipsToBounds = YES;
        _pushBtn.tag = 100;
        [_pushBtn setTitle:@"push" forState:UIControlStateNormal];
        [_pushBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushBtn;
}

- (FMMyButton *)popBtn
{
    if (!_popBtn) {
        _popBtn = [FMMyButton buttonWithType:UIButtonTypeCustom];
        _popBtn.frame = CGRectMake(0, 0, Diameter_btn, Diameter_btn);
        _popBtn.layer.cornerRadius = CGRectGetWidth(_pushBtn.frame)/2.f;
        _popBtn.clipsToBounds = YES;
        _popBtn.tag = 101;
        [_popBtn setTitle:@"pop" forState:UIControlStateNormal];
        [_popBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _popBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
