//
//  PicGridView.m
//  pic-studio-mac
//
//  Created by Leo Wu on 2020/7/24.
//  Copyright © 2020 cnnl. All rights reserved.
//

#import "PicGridView.h"
#import "ATDesktopEntity.h"

@implementation PicGridView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _imageViews = [NSMutableArray array];
        _imageEntities = [NSMutableArray array];
        _contentView = [[NSView alloc] init];
        [self addSubview:_contentView];
    }
    
    return self;
}

- (void)appendImageEntities:(NSArray *)imageEntities
{
    [imageEntities enumerateObjectsUsingBlock:^(ATDesktopImageEntity *imageEntity, NSUInteger idx, BOOL * _Nonnull stop) {
        if (![imageEntity isKindOfClass:[ATDesktopImageEntity class]])
            return;
        
        NSImageView *imageView = [[NSImageView alloc] init];
        imageView.imageAlignment = NSImageAlignCenter;
        imageView.imageScaling = NSImageScaleProportionallyUpOrDown;
        [_contentView addSubview:imageView];
        
        [imageEntity addObserver:self forKeyPath:ATEntityPropertyNamedThumbnailImage options:0 context:nil];
        [imageEntity loadImage];
        
        [_imageViews addObject:imageView];
        [_imageEntities addObject:imageEntity];
    }];
}

- (void)layout
{
    [super layout];
    
    CGFloat w = 200, h = 200;
    CGFloat cols = floor(self.frame.size.width / w);
    [_imageViews enumerateObjectsUsingBlock:^(NSImageView *imageView, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat x = (idx % (int)cols) * w;
        CGFloat y = floor(idx / cols) * h;
        imageView.frame = NSMakeRect(x, y, w, h);
    }];
    _contentView.frame = NSMakeRect(0, 0, cols*200, floor(_imageViews.count / cols) * h);
    self.documentView = _contentView;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:ATEntityPropertyNamedThumbnailImage]) {
        [self performSelectorOnMainThread:@selector(updateThumbnailImageForEntity:)
                               withObject:object
                            waitUntilDone:NO];
    }
}

- (void)updateThumbnailImageForEntity:(ATDesktopImageEntity *)imageEntity {
    NSUInteger index = [_imageEntities indexOfObject:imageEntity];
    NSImageView *imageView = _imageViews[index];
    imageView.image = imageEntity.thumbnailImage;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
