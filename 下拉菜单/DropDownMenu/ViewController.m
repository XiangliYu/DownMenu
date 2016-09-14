//
//  ViewController.m
//  DropDownMenu
//
//  Created by Mac on 16/9/13.
//  Copyright © 2016年 LoveSpending. All rights reserved.
//

#import "ViewController.h"
#import "DropDownMenu.h"

@interface ViewController ()<DropDownMenuDataSource,DropDownMenuDelegate>{

    NSArray *moneyArr;
    NSArray *cityArr;
    NSArray *chooseArr;

    NSInteger moneyIndex;
    NSInteger cityIndex;
    NSInteger chooseIndex;
    
    NSInteger currentSelectedIndex;
}

@property(nonatomic,strong) DropDownMenu *menu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    moneyArr = @[@"一万以内", @"1~50万", @"50~100万", @"100~500万", @"500万以上"];
    cityArr = @[@"北京", @"上海", @"广东", @"深圳"];
    chooseArr = @[@"最好", @"最新", @"最热", @"全部"];
    
    [self menuView];
}

- (void)menuView{
    
    // 指定默认选中
    moneyIndex = 0;
    currentSelectedIndex = 1;
    
    self.menu = [[DropDownMenu alloc] initWithOrigin:CGPointMake(0, 20) andHeight:45];
    self.menu.indicatorColor = [UIColor colorWithRed:175.0f/255.0f green:175.0f/255.0f blue:175.0f/255.0f alpha:1.0];
    self.menu.separatorColor = [UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:210.0f/255.0f alpha:1.0];
    self.menu.textColor = [UIColor colorWithRed:83.f/255.0f green:83.f/255.0f blue:83.f/255.0f alpha:1.0f];
    self.menu.dataSource = self;
    self.menu.delegate = self;
    
    [self.view addSubview:self.menu];
    
    
}

- (NSInteger)numberOfColumnsInMenu:(DropDownMenu *)menu {
    
    return 3;
}

-(BOOL)displayByCollectionViewInColumn:(NSInteger)column{
    
    return NO;
}

-(BOOL)haveRightTableViewInColumn:(NSInteger)column{
    
    return NO;
}

-(CGFloat)widthRatioOfLeftColumn:(NSInteger)column{
    
    return 1;
}

-(NSInteger)currentLeftSelectedRow:(NSInteger)column{
    
    if (column==0) {
        
        return moneyIndex;
        
    }
    if (column==1) {
        
        return cityIndex;
    }
    
    if (column==2) {
        return chooseIndex;
    }
    
    return 0;
}

- (NSInteger)menu:(DropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow{
    
    if (column==0) {
        
        return moneyArr.count;
        
    } else if (column==1){
        
        return cityArr.count;
        
    } else if (column==2){
        
        return chooseArr.count;
    }
    
    return 0;
}

- (NSString *)menu:(DropDownMenu *)menu titleForColumn:(NSInteger)column{
    
    switch (column) {
        case 0: return @"金额";
            break;
        case 1: return @"地区";
            break;
        case 2: return @"筛选";
            break;
        default:
            return nil;
            break;
    }
}

- (NSString *)menu:(DropDownMenu *)menu titleForRowAtIndexPath:(IndexPath *)indexPath {
    
    if (indexPath.column==0) {
        
        return moneyArr[indexPath.row];
        
    } else if (indexPath.column==1) {
        
        return cityArr[indexPath.row];
        
    } else {
        
        return chooseArr[indexPath.row];
    }
}

- (void)menu:(DropDownMenu *)menu didSelectRowAtIndexPath:(IndexPath *)indexPath {
    
    NSString *cityStr;
    NSString *moneyStr;
    NSString *chooseStr;
    
    if (indexPath.column == 0) {
        
        moneyIndex = indexPath.row;
        moneyStr = [moneyArr objectAtIndex:moneyIndex];
        
    } else if(indexPath.column == 1){
        
        cityIndex = indexPath.row;
        cityStr = [cityArr objectAtIndex:cityIndex];
        
        
    } else{
        
        chooseIndex = indexPath.row;
        chooseStr = [chooseArr objectAtIndex:chooseIndex];
    }
    
    if (moneyStr.length==0) {
        moneyStr = [moneyArr objectAtIndex:0];
    }
    if (cityStr.length==0) {
        cityStr = [cityArr objectAtIndex:0];
    }
    if (chooseStr.length==0) {
        chooseStr = [chooseArr objectAtIndex:0];
    }
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
