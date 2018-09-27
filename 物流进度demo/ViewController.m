//
//  ViewController.m
//  物流进度demo
//
//  Created by 大橙子 on 2018/9/27.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import "ViewController.h"
#import "MJExtension.h"
#import "DCGisticsView.h"
#import "DCGisticsModel.h"
@interface ViewController ()
@property (nonatomic,strong) NSMutableArray *dataSource;
@end

@implementation ViewController

-(NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *arr = @[
                     @{
                         @"name":@"1-批次安排",
                         @"time":@"2018-05-10 19:10",
                         @"type":@"1"
                         },
                     @{
                         @"name":@"2-批次安排",
                         @"time":@"2018-05-11 19:10",
                         @"type":@"0"
                         },
                     @{
                         @"name":@"3-批次安排",
                         @"time":@"2018-05-12 ",
                         @"type":@"0"
                         },
                     @{
                         @"name":@"4-批次安排",
                         @"time":@"2018-05-13",
                         @"type":@"0"
                         },
                     @{
                         @"name":@"5-批次安排",
                         @"time":@"2018-05-14 19:10",
                         @"type":@"0"
                         }
                     ];
    _dataSource = [DCGisticsModel mj_objectArrayWithKeyValuesArray:arr];
    
    DCGisticsView *stateView = [[DCGisticsView alloc]initWithSourceData:_dataSource];
    stateView.frame = CGRectMake(20, 100, self.view.width - 40, 300);
    stateView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:stateView];
}


@end
