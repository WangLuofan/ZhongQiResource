//
//  ZQResourceInfomationViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/15.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQSplitDistrictPostTableViewCell.h"
#import "ZQSplitDistrictPostViewController.h"

@interface ZQSplitDistrictPostViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ZQSplitDistrictPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
    
    return ;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZQSplitDistrictPostTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"SplitDistrictPostTableViewCellIdentifier"];
    if(cell == nil)
        cell = [[ZQSplitDistrictPostTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SplitDistrictPostTableViewCellIdentifier"];
    [cell.logoImageView setImage:[UIImage imageNamed:@"tx"]];
    [cell.enterpriseLabel setText:@"羽凌贸易商圈"];
    [cell.dateTimeLabel setText:@"2015-05-25 18:00:00"];
    [cell.offerLabel setText:@"供求资源:本公司急需采购400纱10吨"];
    
    [cell.detailLabel setText:@"零租金:不收租金、水电费、管理费，免费提供办公设备；零成本：凭借丰富的货源渠道和先进的物流仓储系统解决入驻者的后顾之忧；零风险：利用优势互补关系的抱团营销模式可将经营风险降至更低；有规模：园区可提供200多个就业、创业岗位，汇聚优势资源，利用规模效应将你相关费用；有培训：引入专业电商团队提供定期电商培训和全天候技术指导；有前途：挖掘本地特色，优化人才培养环境，打造具有萍乡特色的产业带。"];
    
    [cell setBrowseCount:8899888 AttentionCount:8899888 ReplyCount:8899888];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 250;
}

-(void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self.tableView setFrame:self.view.bounds];
    
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
