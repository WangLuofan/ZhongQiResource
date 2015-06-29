//
//  ZQPolicyInterpretViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/15.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQSpecialSupportTableViewCell.h"
#import "ZQNavigationViewController.h"
#import "ZQPolicyDetailViewController.h"
#import "ZQPolicyInterpretViewController.h"

@interface ZQPolicyInterpretViewController ()

@end

@implementation ZQPolicyInterpretViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"政策解读"];
    [self setTableViewNeedLoadMore:YES];
    [self setViewControllerNeedFilterView:NO];
    
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"banner03"]];
    [imageView setFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, imageView.image.size.height / 2)];
    [self.tableView setTableHeaderView:imageView];
    
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZQSpecialSupportTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"PolicyInterpretTableViewCellIdentifier"];
    if(cell == nil) {
        cell = [[ZQSpecialSupportTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PolicyInterpretTableViewCellIdentifier"];
    }
    
    [cell.logoImageView setImage:[UIImage imageNamed:@"img_special"]];
    [cell.methodLabel setText:@"上海市建筑节能项目专项扶持办法"];
    [cell.detailLabel setText:@"湖南卡X电子商务有限公司成立于2008年8月，公司秉持为客户创造价值这一核心理念，为各行业企业提供专业的移动整合营销方案。公司拥有全球领先的企业APP和微信APP的开发、推广、运营、发布、管理、统计技术，汇聚行业最丰富、最优秀且最具性价比的产品，同时兼有专业的移动营销运营团队，让客房以最低的成本切入移动互联网营销，以达到最佳的宣传、推评选、促销、快速提升品牌知名度效果，为企业构建全新的营销渠道与方式。"];
    
    return cell;
}

-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZQPolicyDetailViewController* detailController = [[ZQPolicyDetailViewController alloc] init];
    [detailController setTitle:@"解读详情"];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:[[ZQNavigationViewController alloc] initWithRootViewController:detailController] animated:YES completion:^{
            [detailController setDetailContentLabelText:@"    新华社北京３月２６日电（记者 徐庆松）国务院２６日公布了《深化标准化工作改革方案》。方案强调改革坚持简政放权、放管结合、国际接轨、统筹推进的原则，明确了６个方面的改革措施。记者就相关问题采访了中国标准化研究院副院长汤万金。突出底线：强制性标准更强方案提出整合精简强制性标准。逐步将现行强制性国家标准、行业标准和地方标准整合为强制性国家标准。强制性国家标准由国务院批准发布或授权批准发布。汤万金说，强制性标准是保障健康和安全、保护环境的底线。目前，我国强制性标准管理实践中存在的突出问题主要表现在：管理上条块分割，指标上交叉重复矛盾，重要标准协调困难，以及超范围制定等方面，导致了我国强制性标准“不强”，缺乏科学性与权威性。由于强制性标准涉及安全、环保等公共利益，关乎民生福祉，必须发挥强制性标准“兜底线”的作用。汤万金表示，通过此次改革，国家将加强强制性标准的统一管理，建立统一的强制性标准体系。由国务院批准发布或授权批准发布，将提高其权威性和严肃性，更加有效地推动强制性标准在全国范围内有效实施。满足市场需求：团体标准更活方案提出要培育发展团体标准。鼓励具备相应能力的学会、协会、商会、联合会等社会组织和产业技术联盟，协调相关市场主体共同制定满足市场和创新需要的标准，增加标准的有效供给。团体标准是为满足市场、科技快速变化及多样性需求，由专业领域内具有影响力并具备相应能力的学会、协会、商会、联合会等社会组织和产业技术联盟制定的标准。汤万金说，国外的团体标准发展相对成熟，美、英、德、法、日、俄等国均有大量制定标准的专业性社会组织，团体标准不仅是这些国家标准体系的重要组成部分，也是非常活跃、非常贴近市场需求的一类标准。随着我国产业联盟、学会、协会、商会以及联合会等社会团体蓬勃发展，一些社会组织已积极探索团体标准的制定并取得了很好的成效。汤万金认为，培育和发展团体标准，是满足市场多样化的需要。消费个性化趋势和市场多样化发展，仅靠单一的政府供给模式已不能满足市场需求，通过设立团体标准，可以有效增加标准的供给。突出技术先进性：企业标准更高方案提出放开搞活企业标准。建立企业产品和服务标准自我声明公开和监督制度，逐步取消政府对企业产品标准的备案管理，落实企业标准化主体责任。"];
        }];
    });
    return ;
}

@end
