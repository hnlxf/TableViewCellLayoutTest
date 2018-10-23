//
//  FirstVC.m
//  TableViewCellLayoutTest
//
//  Created by lixiaofei1 on 2018/10/23.
//  Copyright © 2018 lixiaofei1. All rights reserved.
//

#import "FirstVC.h"
#import "FirstCell.h"
@interface FirstVC ()
<UITableViewDelegate,
UITableViewDataSource
>
@property (nonatomic,strong)UITableView *centerTableView;
@property (nonatomic,strong)FirstCell *firstCell;
@property (nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation FirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor brownColor];
    [self loadUI];
    [self loadData];
}

-(void)loadUI {
    [self.view addSubview:self.centerTableView];
    [_centerTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    self.firstCell=[[FirstCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FirstCell"];
}

-(void)loadData {
    for (int i=0; i<10; i++) {
        FirstModel *firstModel=[[FirstModel alloc]init];
        firstModel.name=@"假如生活欺骗了你";
        firstModel.describ=@"《假如生活欺骗了你》是俄国诗人普希金于1825年流放南俄敖德萨同当地总督发生冲突后，被押送到其父亲的领地米哈伊洛夫斯科耶村幽禁期间创作的一首诗歌。诗歌全文表述了一种积极乐观而坚强的人生态度，并且因它亲切和蔼的口气让许多人把它记于自己的笔记本上，成为了激励自己勇往直前，永不放弃的座右铭。";
        firstModel.content=@"假如生活欺骗了你，\n不要悲伤，不要心急！\n忧郁的日子里须要镇静：\n相信吧，快乐的日子将会来临！\n心儿永远向往着未来；\n现在却常是忧郁。\n一切都是瞬息，一切都将会过去；\n而那过去了的，就会成为亲切的怀恋。";
        [self.dataArray addObject:firstModel];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifiler=@"FirstCell";
    FirstCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifiler];
    if (cell==nil) {
        cell=[[FirstCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifiler];
    }
    cell.firstModel=self.dataArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //首次计算高度，重用时候自动获取缓存高度
    FirstModel *firstModel=self.dataArray[indexPath.row];
    CGFloat cellHeight=0;
    if (firstModel.cellHeight==0) {
        cellHeight=[self.firstCell getCellHeihgtWithModel:firstModel];
        return cellHeight;
    } else
        return cellHeight;
}


-(UITableView *)centerTableView {
    if (!_centerTableView) {
        _centerTableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _centerTableView.delegate=self;
        _centerTableView.dataSource=self;
    }
    return _centerTableView;
}

-(NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray=[[NSMutableArray alloc]init];
    }
    return _dataArray;
}
@end
