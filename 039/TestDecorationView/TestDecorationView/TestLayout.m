//
//  TestLayout.m
//  TestDecorationView
//
//  Created by bk.xiong on 2023/9/14.
//

#import "TestLayout.h"
#import "TestReusableView.h"

@implementation TestLayout

- (void)prepareLayout{
    [super prepareLayout];
    
    [self registerClass:[TestReusableView class] forDecorationViewOfKind:@"TestReusableView"];
    
}



- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:elementKind withIndexPath:indexPath];
    
    
    layoutAttributes.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 110);
    
    return layoutAttributes;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *attributesArray = [super layoutAttributesForElementsInRect:rect].mutableCopy;
    
    // 遍历所有的 section，为每个 section 添加 Decoration View
    for (NSInteger section = 0; section < self.collectionView.numberOfSections; section++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:section];
        UICollectionViewLayoutAttributes *decorationAttributes = [self layoutAttributesForDecorationViewOfKind:@"DecorationView" atIndexPath:indexPath];
        [attributesArray addObject:decorationAttributes];
    }
    
    return [attributesArray copy];
}





@end
