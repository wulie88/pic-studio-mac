//
//  ViewController.m
//  pic-studio-mac
//
//  Created by Leo Wu on 2020/7/24.
//  Copyright © 2020 cnnl. All rights reserved.
//

#import "ViewController.h"
#import "ATDesktopEntity.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView {
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    // Setup our content to be the contents of the Desktop Pictures folder.
    NSURL *picturesURL =
        [[NSFileManager defaultManager] URLsForDirectory:NSLibraryDirectory inDomains:NSLocalDomainMask].lastObject;
    picturesURL = [picturesURL URLByAppendingPathComponent:@"Desktop Pictures"];
    ATDesktopFolderEntity *primaryFolder = [[ATDesktopFolderEntity alloc] initWithFileURL:picturesURL];
    [self.picGridView appendImageEntities:primaryFolder.children];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
