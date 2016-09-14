//
//  DropDownMenu.h
//  DropDownMenu
//
//  Created by mac on 15-1-12.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndexPath : NSObject

@property (nonatomic, assign) NSInteger column;
// 0 左边   1 右边
@property (nonatomic, assign) NSInteger leftOrRight;
// 左边行
@property (nonatomic, assign) NSInteger leftRow;
// 右边行
@property (nonatomic, assign) NSInteger row;

- (instancetype)initWithColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow row:(NSInteger)row;
+ (instancetype)indexPathWithCol:(NSInteger)col leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow row:(NSInteger)row;

@end

#pragma mark - data source protocol
@class DropDownMenu;

@protocol DropDownMenuDataSource <NSObject>

@required
- (NSInteger)menu:(DropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow;
- (NSString *)menu:(DropDownMenu *)menu titleForRowAtIndexPath:(IndexPath *)indexPath;
- (NSString *)menu:(DropDownMenu *)menu titleForColumn:(NSInteger)column;
/**
 * 表视图显示时，左边表显示比例
 */
- (CGFloat)widthRatioOfLeftColumn:(NSInteger)column;
/**
 * 表视图显示时，是否需要两个表显示
 */
- (BOOL)haveRightTableViewInColumn:(NSInteger)column;

/**
 * 返回当前菜单左边表选中行
 */
- (NSInteger)currentLeftSelectedRow:(NSInteger)column;

@optional
//default value is 1
- (NSInteger)numberOfColumnsInMenu:(DropDownMenu *)menu;

/**
 * 是否需要显示为UICollectionView 默认为否
 */
- (BOOL)displayByCollectionViewInColumn:(NSInteger)column;

@end

#pragma mark - delegate
@protocol DropDownMenuDelegate <NSObject>
@optional
- (void)menu:(DropDownMenu *)menu didSelectRowAtIndexPath:(IndexPath *)indexPath;
@end

#pragma mark - interface
@interface DropDownMenu : UIView <UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) id <DropDownMenuDataSource> dataSource;
@property (nonatomic, weak) id <DropDownMenuDelegate> delegate;

@property (nonatomic, strong) UIColor *indicatorColor;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *separatorColor;
/**
 *  the width of menu will be set to screen width defaultly
 *
 *  @param origin the origin of this view's frame
 *  @param height menu's height
 *
 *  @return menu
 */
- (instancetype)initWithOrigin:(CGPoint)origin andHeight:(CGFloat)height;
- (NSString *)titleForRowAtIndexPath:(IndexPath *)indexPath;

@end
