//
//  DCGisticsModel.h
//  物流进度demo
//
//  Created by 大橙子 on 2018/9/27.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DCGisticsModel : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *time;
@property (nonatomic,copy) NSString *type;
/**
 控制分割线的显示隐藏
 */
@property (assign, nonatomic)  BOOL isBottomShow;

@end

NS_ASSUME_NONNULL_END
