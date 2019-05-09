//
//  FWBookShelfDecarationView.m
//  MaintenanceTrain
//
//  Created by 刘振汉 on 2019/4/28.
//  Copyright © 2019 sy_smart. All rights reserved.
//

#import "FWBookShelfDecarationView.h"

NSInteger const kDecorationViewHeight = 216;

@implementation FWBookShelfDecarationView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, kDecorationViewHeight)];
        img.image = [UIImage imageNamed:@"boolshelf.png"];
        [self addSubview:img];
    }
    
    return self;
}
@end

