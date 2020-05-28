//
//  ViewController.m
//  A_APP_OC
//
//  Created by 赵桂安 on 2017/12/25.
//  Copyright © 2017年 赵桂安. All rights reserved.
//

#import "ViewController.h"
#import "Dome1.h"
#import "Dome2.h"
#import "FWBookshelfCollectionViewLayout.h"
#import "FWAncientPoetryCollectionViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray * arr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"总结";
    self.view.backgroundColor = [UIColor whiteColor];
    self.arr = @[@"1.  数组内n个不同NSNumber数值任意两个数值的和,与一个NSNumber数值相比较是否是否相等（可以解决数字精度的问题,可解决金钱计算精度问题）.",@"2. 字符创分割：把2‘aaaa222bbb22nn33mmmj333nhhhgb332ffjkjk2378aaaa222’字符串分割成分成字母为key，数字为value的键值对，按value由小到大输出",@"343",@"444",@"55",@"6666",@"777"];
    [self setupUI];
}
#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"UITableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = _arr[indexPath.row];
    cell.textLabel.numberOfLines = 0;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        Dome1 * dome = [[Dome1 alloc]init];
        [self.navigationController pushViewController:dome animated:YES];
    }else if (indexPath.row == 1){
        Dome2 * dome = [[Dome2 alloc]init];
        [self.navigationController pushViewController:dome animated:YES];
    }else if (indexPath.row == 2){
        
        FWBookshelfCollectionViewLayout *layOut = [[FWBookshelfCollectionViewLayout alloc] init];
        FWAncientPoetryCollectionViewController *vc = [[FWAncientPoetryCollectionViewController alloc] initWithCollectionViewLayout:layOut];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

- (void)setupUI {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH - 64) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.estimatedRowHeight = 666;
    tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:tableView];
    tableView.tableFooterView = [UIView new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
