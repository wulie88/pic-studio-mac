//
//  SiderView.m
//  pic-studio-mac
//
//  Created by Leo Wu on 2020/7/24.
//  Copyright © 2020 cnnl. All rights reserved.
//

#import "SiderView.h"

@implementation SiderView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    
    [[NSColor gridColor] set];
    NSRectFill(dirtyRect);
}

@end
