//
//  TestReusableView.m
//  TestDecorationView
//
//  Created by bk.xiong on 2023/9/14.
//

#import "TestReusableView.h"

@implementation TestReusableView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]){
        

        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 20, 110)];
        [self addSubview:view];
        view.backgroundColor = [UIColor yellowColor];

    }
    return self;
}

@end
