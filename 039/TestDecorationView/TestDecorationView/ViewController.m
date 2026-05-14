//
//  ViewController.m
//  TestDecorationView
//
//  Created by bk.xiong on 2023/9/14.
//

#import "ViewController.h"
#import "TestLayout.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    TestLayout *layout = [[TestLayout alloc]init];
    layout.itemSize = CGSizeMake(self.view.bounds.size.width-50, 100);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    UICollectionView *collectionview = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.view addSubview:collectionview];
    collectionview.contentInset = UIEdgeInsetsMake(25, 25, 0, 25);
    [collectionview registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    collectionview.dataSource = self;
    collectionview.delegate = self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 10;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    // 设置组间距，这里使用UIEdgeInsets来指定上、左、下、右的内边距值
    UIEdgeInsets sectionInset = UIEdgeInsetsMake(0, 0, 30, 0);
    
    return sectionInset;
}



@end
