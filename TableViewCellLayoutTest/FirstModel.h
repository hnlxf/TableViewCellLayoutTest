//
//  FirstModel.h
//  TableViewCellLayoutTest
//
//  Created by lixiaofei1 on 2018/10/23.
//  Copyright © 2018 lixiaofei1. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstModel : NSObject
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *describ;
@property (nonatomic,copy)NSString *content;
@property (nonatomic,assign)CGFloat cellHeight;//cell 高度
@end

NS_ASSUME_NONNULL_END
