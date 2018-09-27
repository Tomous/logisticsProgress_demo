//
//  DCGisticsCell.h
//  物流进度demo
//
//  Created by 大橙子 on 2018/9/27.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCGisticsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface DCGisticsCell : UITableViewCell

@property (nonatomic,strong) DCGisticsModel *model;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
