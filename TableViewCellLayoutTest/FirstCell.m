//
//  FirstCell.m
//  TableViewCellLayoutTest
//
//  Created by lixiaofei1 on 2018/10/23.
//  Copyright © 2018 lixiaofei1. All rights reserved.
//

#import "FirstCell.h"
@interface FirstCell ()
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *describLabel;
@property (nonatomic,strong)UILabel *contentLabel;
@end
@implementation FirstCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self=[super initWithStyle:style  reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        [self loadUI];
    }
    return self;
}

-(void)loadUI {
    [self.contentView  addSubview:self.nameLabel];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(10);
        make.left.mas_equalTo(self.mas_left).offset(15);
        make.right.mas_equalTo(self.mas_right).offset(-15);
        make.height.mas_equalTo(30);
    }];
    
    [self.contentView addSubview:self.describLabel];
    _describLabel.preferredMaxLayoutWidth=kScreenWidth-30;//多行文本设置最大宽度
    //自适应高度
    [_describLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [_describLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(self.mas_left).offset(15);
        make.right.mas_equalTo(self.mas_right).offset(-15);
    }];
    
    [self.contentView addSubview:self.contentLabel];
    _contentLabel.preferredMaxLayoutWidth=kScreenWidth-30;
    [_contentLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.describLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(self.mas_left).offset(15);
        make.right.mas_equalTo(self.mas_right).offset(-15);
    }];
}

-(void)setFirstModel:(FirstModel *)firstModel {
    self.nameLabel.text=firstModel.name;
    self.describLabel.text=firstModel.describ;
    self.contentLabel.text=firstModel.content;
}

//获取cell 自适应的高度
-(CGFloat)getCellHeihgtWithModel:(FirstModel *)firstModel {
    [self setFirstModel:firstModel];
    [self layoutIfNeeded];
    CGRect frame=self.contentLabel.frame;
    CGFloat cellHeight=frame.origin.y+frame.size.height+20;
    return cellHeight;
}

-(UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel=[[UILabel alloc]init];
        _nameLabel.font=[UIFont boldSystemFontOfSize:16];
        _nameLabel.textAlignment=NSTextAlignmentCenter;
        _nameLabel.textColor=[UIColor purpleColor];
    }
    return _nameLabel;
}

-(UILabel *)describLabel {
    if (!_describLabel) {
        _describLabel=[[UILabel alloc]init];
        _describLabel.numberOfLines=0;
        _describLabel.font=[UIFont systemFontOfSize:13];
        _describLabel.textColor=[UIColor cyanColor];
    }
    return _describLabel;
}

-(UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel=[[UILabel alloc]init];
        _contentLabel.numberOfLines=0;
        _contentLabel.textColor=[UIColor grayColor];
        _contentLabel.font=[UIFont systemFontOfSize:15];
        _contentLabel.textAlignment=NSTextAlignmentCenter;
    }
    return _contentLabel;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
