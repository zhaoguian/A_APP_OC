//
//  Dome2.m
//  A_APP_OC
//
//  Created by 赵桂安 on 2018/1/16.
//  Copyright © 2018年 赵桂安. All rights reserved.
//

#import "Dome2.h"

@interface Dome2 ()
@property (nonatomic, strong) UILabel * label;
@property (nonatomic, strong) UILabel * la;
@end

@implementation Dome2
/// 字符创分割：‘aaaa222bbb22mmmj333nhhhgb332ffjkjk2378aaaa222’
/// 字符串分割成分成字母为key，数字为value的键值对，按value由小到大输出
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
    self.title = @"字符串分割";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
    self.label.text = @"aaaa222bbb22mmmj333nhhhgb332ffjkjk2378aaaa222";
    
    UIBarButtonItem *barbtn=[[UIBarButtonItem alloc]initWithTitle:@"分割" style:(UIBarButtonItemStylePlain) target:self action:@selector(click)];
    self.navigationItem.rightBarButtonItem=barbtn;
    
    
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
//    UIButton * btn = [UIButton buttonWithType:0];
//    [btn setTitle:@"分割" forState:(UIControlStateNormal)];
//    [btn addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
//    [btn setTitleColor:[UIColor blackColor] forState:0];
//    [self.view addSubview:btn];
//    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.mas_equalTo(superView);
//        make.height.offset(30);
//        make.width.offset(200);
//    }];
    _la = [[UILabel alloc]init];
    _la.numberOfLines = 0;
    _la.textAlignment = NSTextAlignmentCenter;
    _la.font = SYS_FONT(20);
    [self.view addSubview:_la];
    [_la mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_label.mas_bottom).offset(20);
        make.left.equalTo(superView).offset(10);
        make.right.equalTo(superView).offset(-10);
    }];
}

- (void)click{
    // 初始化一个scanner
    NSScanner *scanner = [NSScanner scannerWithString:self.label.text];
    //
    NSLog(@"The string the scanner will scan: %@", scanner.string);
    NSCharacterSet *numSet = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *letterSet = [NSCharacterSet letterCharacterSet];
    
    NSString *key = [NSString string];
    
    NSString *value = [NSString string];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    while (scanner.isAtEnd == NO) {
        
        if ([scanner scanCharactersFromSet:letterSet intoString:&key]) {
            
            NSLog(@"key: %@", key);
            
        } else {
            
            [scanner scanCharactersFromSet:numSet intoString:&value];
            NSLog(@"value: %@", value);
        }
        
        dic[key] = value;
    }
    
    NSArray *values = [dic allValues];
    values = [values sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        return [obj1 integerValue] > [obj2 integerValue];
    }];
    
    NSLog(@"values: %@", values);
    
    NSMutableArray *resultArr = [NSMutableArray array];
    for (NSString *value in values) {
        
        [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            
            if (value == obj) {
                
                NSDictionary *dic = [NSDictionary dictionaryWithObject:obj forKey:key];
                [resultArr addObject:dic];
                NSLog(@"key: %@---value: %@", key, obj);
                *stop = YES;
            }
        }];
    }
    NSLog(@"resultArr: %@", resultArr);
    
    NSString * las = nil;
    for (NSDictionary * dic in resultArr) {
        if (las.length > 0) {
            las = [NSString stringWithFormat:@"%@\n%@",las,dic];
        }else{
            las = [NSString stringWithFormat:@"%@",dic];
        }
    }
    self.la.text = [NSString stringWithFormat:@"%@",las];
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
