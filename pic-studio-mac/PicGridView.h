//
//  PicGridView.h
//  pic-studio-mac
//
//  Created by Leo Wu on 2020/7/24.
//  Copyright © 2020 cnnl. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface PicGridView : NSScrollView
{
    NSView *_contentView;
    NSMutableArray *_imageViews;
    NSMutableArray *_imageEntities;
}

/**
 加入多个图片实体
 */
- (void)appendImageEntities:(NSArray*)imageEntities;

@end

NS_ASSUME_NONNULL_END
