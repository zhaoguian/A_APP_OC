//
//  FWAncientPoetryCollectionViewController.m
//  MaintenanceTrain
//
//  Created by 刘振汉 on 2019/4/28.
//  Copyright © 2019 sy_smart. All rights reserved.
//

#import "FWAncientPoetryCollectionViewController.h"

#import "FWBookShelfDecarationView.h"
#import "FWBookshelfCollectionViewLayout.h"
//#import "FWBookCategoryViewController.h"

@interface FWAncientPoetryCollectionViewController () <LXReorderableCollectionViewDataSource, LXReorderableCollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSMutableArray *books;

@end

@implementation FWAncientPoetryCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
static NSString * const cellReuseIdentifier = @"Cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"古籍";
    
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bookShelfBackground.png"]];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellReuseIdentifier];
    
//    self.books = [[NSMutableArray alloc] initWithArray:[self bookNameOfAllBooks]];
}

//- (NSArray *)bookNameOfAllBooks
//{
////    return [[FWDataManager getDataForPoetry] allKeys];
//}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    //    UIImage *image = [UIImage imageNamed:self.books[indexPath.item]];
    //
    //
    //    cell.backgroundColor = [UIColor colorWithPatternImage:image];
    
    cell.backgroundColor = UIColor.yellowColor;
    
    return cell;

//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellReuseIdentifier forIndexPath:indexPath];
//    UIImage *image = [UIImage imageNamed:self.books[indexPath.item]];
//    cell.backgroundColor = [UIColor colorWithPatternImage:image];
//
//    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView itemAtIndexPath:(NSIndexPath *)fromIndexPath willMoveToIndexPath:(NSIndexPath *)toIndexPath
{
//    NSString *theBookName = self.books[fromIndexPath.item];
//    [self.books removeObjectAtIndex:fromIndexPath.item];
//    [self.books insertObject:theBookName atIndex:toIndexPath.item];
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(300,300);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    FWBookCategoryViewController *vc = [[FWBookCategoryViewController alloc] initWithUrlString:[[FWDataManager getDataForPoetry] objectForKey:self.books[indexPath.item]]];
//    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    [self.books removeAllObjects];
    self.books = nil;
}

@end

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/


