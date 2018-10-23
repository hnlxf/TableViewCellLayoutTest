//
//  FirstCell.h
//  TableViewCellLayoutTest
//
//  Created by lixiaofei1 on 2018/10/23.
//  Copyright © 2018 lixiaofei1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface FirstCell : UITableViewCell
@property (nonatomic,strong)FirstModel *firstModel;

-(CGFloat)getCellHeihgtWithModel:(FirstModel *)firstModel;
@end

NS_ASSUME_NONNULL_END
