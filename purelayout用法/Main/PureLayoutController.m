//
//  PureLayoutController.m
//  purelayout用法
//
//  Created by  enniu on 16/6/26.
//  Copyright © 2016年  enniu. All rights reserved.
//

#import "PureLayoutController.h"
#import "PureLayoutTableViewCell.h"

#import "FirstDemoController.h"
#import "SecondDemoController.h"
#import "ThirdDemoController.h"
#import "PracticalApplicationController.h"
#import "PracticePureLayoutController.h"
#import "PracticeThreeController.h"

@interface PureLayoutController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *pureTableView;
@property (nonatomic, strong) NSArray *dataArr;
@end

@implementation PureLayoutController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"PureLayout";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.pureTableView = [[UITableView alloc]init];
    [self.view addSubview:self.pureTableView];
    self.pureTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-STATUSBAR_NAVIGATION);
    self.pureTableView.delegate = self;
    self.pureTableView.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PureLayoutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"animation"];
    if (cell == nil) {
        cell = [[PureLayoutTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"animation"];
    }
    
    cell.cellNameLabel.text = self.dataArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        FirstDemoController *firstVC = [[FirstDemoController alloc]init];
        [self.navigationController pushViewController:firstVC animated:YES];
    }else if (indexPath.row == 1){
        SecondDemoController *secondVC = [[SecondDemoController alloc]init];
        [self.navigationController pushViewController:secondVC animated:YES];
    }else if (indexPath.row == 2){
        ThirdDemoController *thirdVC = [[ThirdDemoController alloc]init];
        [self.navigationController pushViewController:thirdVC animated:YES];
    }else if (indexPath.row == 3){
        PracticalApplicationController *practicVC = [[PracticalApplicationController alloc]init];
        [self.navigationController pushViewController:practicVC animated:YES];
    }else if (indexPath.row == 4){
        PracticePureLayoutController *practiceVC2 = [[PracticePureLayoutController alloc]init];
        [self.navigationController pushViewController:practiceVC2 animated:YES];
    }else if (indexPath.row == 5){
        PracticeThreeController *threeVC3 = [[PracticeThreeController alloc]init];
        [self.navigationController pushViewController:threeVC3 animated:YES];
    }
}

- (NSArray *)dataArr{
    return @[@"FirstDemo",@"SecondDemo",@"ThirdDemo",@"实际应用",@"实际应用2",@"实际应用3-Scrollow"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
