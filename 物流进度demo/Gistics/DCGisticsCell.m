//
//  DCGisticsCell.m
//  物流进度demo
//
//  Created by 大橙子 on 2018/9/27.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import "DCGisticsCell.h"

@interface DCGisticsCell()

@property (weak,nonatomic)  UIView *topLineView;
@property (weak,nonatomic)  UIImageView *circularView;
@property (weak,nonatomic)  UIView *bottomLineView;

@property (weak,nonatomic)  UILabel *timeOneLabel;

@end
@implementation DCGisticsCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *LogisticsTableViewCellID = @"LogisticsTableViewCell";
    
    DCGisticsCell *cell = [tableView dequeueReusableCellWithIdentifier:LogisticsTableViewCellID];
    if (cell == nil) {
        cell = [[DCGisticsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:LogisticsTableViewCellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // 添加自己可能显示的所有子控件
        
        //中间的圆
        UIImageView *circularView = [[UIImageView alloc]init];
        [self.contentView addSubview:circularView];
        self.circularView = circularView;
        
        //底部的线
        UIView *bottomLineView = [[UIView alloc]init];
        bottomLineView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:bottomLineView];
        self.bottomLineView = bottomLineView;
        
        UILabel *timeOneLabel = [[UILabel alloc]init];
        timeOneLabel.font = [UIFont systemFontOfSize:12];
        timeOneLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:timeOneLabel];
        self.timeOneLabel = timeOneLabel;
    }
    return self;
}
-(void)setModel:(DCGisticsModel *)model
{
    _model = model;
    if ([model.type isEqualToString:@"0"]) {
        self.timeOneLabel.text = [NSString stringWithFormat:@"%@",model.name];
        self.circularView.image = [UIImage imageNamed:@"icon_灰点"];
        self.timeOneLabel.textColor = [UIColor lightGrayColor];
        
    }else
    {
        self.timeOneLabel.text = [NSString stringWithFormat:@"%@:%@",model.name,model.time];
        self.circularView.image = [UIImage imageNamed:@"icon_Agreed"];
        self.timeOneLabel.textColor = [UIColor orangeColor];
    }
    
    if (model.isBottomShow) {
        self.bottomLineView.hidden = NO;
    }
    else
    {
        self.bottomLineView.hidden = YES;
    }
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    self.circularView.frame = CGRectMake(30, 0, 16, 16);
    self.circularView.layer.cornerRadius = self.circularView.width/2;
    
    self.bottomLineView.frame = CGRectMake(self.circularView.x + self.circularView.width/2, self.circularView.height, 1, self.height - self.circularView.height);
    
    self.timeOneLabel.frame = CGRectMake(CGRectGetMaxX(self.circularView.frame) + 5, self.circularView.y, 200, 16);
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
