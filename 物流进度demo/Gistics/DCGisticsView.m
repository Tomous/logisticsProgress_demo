//
//  DCGisticsView.m
//  物流进度demo
//
//  Created by 大橙子 on 2018/9/27.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import "DCGisticsView.h"
#import "DCGisticsCell.h"
@interface DCGisticsView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *myTableView;
@property(strong,nonatomic) NSArray* dataArray;
@end
@implementation DCGisticsView
-(instancetype)initWithSourceData:(NSArray *)dataArray
{
    if (self = [super init]) {
        _dataArray = dataArray;
        
        _myTableView = [[UITableView alloc]init];
        _myTableView.scrollEnabled = NO;
        _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _myTableView.dataSource = self;
        _myTableView.delegate = self;
        [self addSubview:_myTableView];
        
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _myTableView.frame = CGRectMake(0, 0, self.width, self.height);
}
#pragma mark--UITableView
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DCGisticsCell *cell = [DCGisticsCell cellWithTableView:tableView];

    if (indexPath.row < [self.dataArray count]) {
        for (DCGisticsModel *mode in _dataArray) {
            if (indexPath.row == _dataArray.count - 1){
                mode.isBottomShow = NO;
            }else
            {
                mode.isBottomShow = YES;
            }
            
        }
        cell.model = _dataArray[indexPath.row];
    }
    return cell;
    
}
-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return 40;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *headView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.width, 30)];
    headView.backgroundColor = [UIColor whiteColor];
    headView.text = @"系统状态跟踪";
    return headView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
