//
//  FWBookshelfCollectionViewLayout.m
//  MaintenanceTrain
//
//  Created by 刘振汉 on 2019/4/28.
//  Copyright © 2019 sy_smart. All rights reserved.
//

#import "FWBookshelfCollectionViewLayout.h"

#import "FWBookShelfDecarationView.h"
NSString * const FWBookshelfCollectionViewLayoutDecorationViewKind = @"FWBookshelfCollectionViewLayoutDecorationViewKind";
@interface FWBookshelfCollectionViewLayout ()

@property (nonatomic, strong) NSDictionary *bookShelfRectanges;
@property NSInteger countOfRow;

@end
@implementation FWBookshelfCollectionViewLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
    [self registerClass:[FWBookShelfDecarationView class] forDecorationViewOfKind:FWBookshelfCollectionViewLayoutDecorationViewKind];
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    self.countOfRow = ceilf(itemCount / 3.0);
    for (int row = 0; row < self.countOfRow; row++)
    {
        dictionary[[NSIndexPath indexPathForItem:row inSection:0]] = [NSValue valueWithCGRect:CGRectMake(0, kDecorationViewHeight * row, UIScreen.mainScreen.bounds.size.width, kDecorationViewHeight)];
    }
    
    self.bookShelfRectanges = [NSDictionary dictionaryWithDictionary:dictionary];
}

#pragma mark Runtime Layout Calculations
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    // call super so flow layout can return default attributes for all cells, headers, and footers
    // NOTE: Flow layout has already taken care of the Cell view layout attributes! :)
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    // create a mutable copy so we can add layout attributes for any shelfs that
    // have frames that intersect the rect the CollectionView is interested in
    NSMutableArray *newArray = [array mutableCopy];
    //    NSLog(@"in rect:%@",NSStringFromCGRect(rect));
    // Add any decoration views (shelves) who's rect intersects with the
    // CGRect passed to the layout by the CollectionView
    [self.bookShelfRectanges enumerateKeysAndObjectsUsingBlock:^(id key, id shelfRect, BOOL *stop) {
        //        NSLog(@"[shelfRect CGRectValue]:%@",NSStringFromCGRect([shelfRect CGRectValue]));
        
        if (CGRectIntersectsRect([shelfRect CGRectValue], rect))
        {
            UICollectionViewLayoutAttributes *shelfAttributes =
            [self layoutAttributesForDecorationViewOfKind:FWBookshelfCollectionViewLayoutDecorationViewKind
                                              atIndexPath:key];
            [newArray addObject:shelfAttributes];
        }
    }];
    
    for (int i = 0; i < [self.collectionView numberOfItemsInSection:0]; i++)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        [newArray addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    
    return [newArray copy];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    NSLog(@"%@", NSStringFromCGSize([self screenSize]));375 667
    
    //    NSLog(@"%@", NSStringFromCGSize([self screenSize]));375 667
    UICollectionViewLayoutAttributes *attris = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    NSInteger currentRow = indexPath.item / 3;
    //    CGRect frame = CGRectMake(20 + (indexPath.item % 3) * (100 + 17.5), 35+ currentRow * (100 + 65), 100, 100);
    
    CGRect frame = CGRectMake(20 + (indexPath.item % 3) * (([[UIScreen mainScreen] bounds].size.width - 80 )/3  + 17.5), 35+ currentRow * (151 + 65), ([[UIScreen mainScreen] bounds].size.width - 80 )/3 , 216 - 35 -30);
    
    attris.frame = frame;
    attris.zIndex = 1;
    
    return attris;
    
//    UICollectionViewLayoutAttributes *attris = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
//
//    NSInteger currentRow = indexPath.item / 3;
//    CGRect frame = CGRectMake(20 + (indexPath.item % 3) * (100 + 17.5), 35+ currentRow * (100 + 65), 100, 100);
//    attris.frame = frame;
//    attris.zIndex = 1;
//
//    return attris;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind atIndexPath:(NSIndexPath *)indexPath
{
    
    id shelfRect = self.bookShelfRectanges[indexPath];
    
    // this should never happen, but just in case...
    if (!shelfRect)
        return nil;
    
    UICollectionViewLayoutAttributes *attributes =
    [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:decorationViewKind
                                                                withIndexPath:indexPath];
    attributes.frame = [shelfRect CGRectValue];
    //    NSLog(@"UICollectionViewLayoutAttributes :.%@", NSStringFromCGRect([shelfRect CGRectValue]));
    
    attributes.zIndex = -1; // shelves go behind other views
    
    return attributes;
}

- (CGSize)collectionViewContentSize
{
    CGSize contentSize = CGSizeMake(self.collectionView.bounds.size.width, self.countOfRow * kDecorationViewHeight + 20);
    
    return contentSize;
}

@end
