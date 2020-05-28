//
//  Dome1.m
//  A_APP_OC
//
//  Created by 赵桂安 on 2018/1/16.
//  Copyright © 2018年 赵桂安. All rights reserved.
//

#import "Dome1.h"
@interface Dome1 ()
@property (nonatomic, strong) UILabel * label;
@property (nonatomic, strong) UILabel * la;
@end

@implementation Dome1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}

- (void)setupUI{
    UIView * superView = self.view;
    _label = [[UILabel alloc]init];
    _label.numberOfLines = 0;
    [self.view addSubview:_label];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView).offset(kTopHeight);
        make.left.equalTo(superView).offset(10);
        make.right.equalTo(superView).offset(-10);
        make.height.offset(150);
    }];
    UIButton * btn = [UIButton buttonWithType:0];
    [btn setTitle:@"比较" forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
    [btn setTitleColor:[UIColor blackColor] forState:0];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(superView);
        make.height.offset(30);
        make.width.offset(200);
    }];
    _la = [[UILabel alloc]init];
    _la.textAlignment = NSTextAlignmentCenter;
    _la.font = SYS_FONT(20);
    [self.view addSubview:_la];
    [_la mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_label.mas_bottom).offset(20);
        make.left.equalTo(superView).offset(10);
        make.right.equalTo(superView).offset(-10);
        make.height.offset(30);
    }];
}

- (void)click:(UIButton *)sender{
    NSArray * arr = [NSArray arrayWithObjects:[NSNumber numberWithInteger:20],[NSNumber numberWithFloat:3.14f],[NSNumber numberWithInteger:10], nil];
    BOOL is = [self judgeWithArr:arr number:[NSNumber numberWithFloat:13.14f]];
    
    NSString * string = nil;
    for (NSNumber * num in arr) {
        if (string == nil) {
            string = [NSString stringWithFormat:@"数组中的值:\n%@",num];
        }else{
            string = [NSString stringWithFormat:@"%@\n%@",string,num];
        }
    }
    self.label.text = [NSString stringWithFormat:@"%@\n输入值:\n%@",string,[NSNumber numberWithFloat:13.14f]];
    if (is) {
        NSLog(@"YES");
        self.la.text = @"有相等的值";
    }else{
        NSLog(@"NO");
        self.la.text = @"没有相等的值";
    }
}

- (BOOL)judgeWithArr:(NSArray*)array number:(NSNumber *)number{
    for (int i = 0; i < array.count; i ++) {
        for (int j = i + 1; j < array.count; j ++) {
            NSDecimalNumber * num1 = [NSDecimalNumber decimalNumberWithString:[array[i] stringValue]];
            NSDecimalNumber * num2 = [NSDecimalNumber decimalNumberWithString:[array[j] stringValue]];
            ///求和
            NSDecimalNumber * sum = [num1 decimalNumberByAdding:num2];
            NSDecimalNumber * dnumber = [NSDecimalNumber decimalNumberWithString:[number stringValue]];
            if([sum compare:dnumber] == NSOrderedSame){//self.number1  =  self.number2
                NSLog(@"self.number1  =  self.number2");
                return YES;
            }
        }
    }
    return NO;
}

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
