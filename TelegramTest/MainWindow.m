//
//  MainWindow.m
//  Messenger for Telegram
//
//  Created by Dmitry Kondratyev on 3/11/14.
//  Copyright (c) 2014 keepcoder. All rights reserved.
//

#import "MainWindow.h"

@interface MainWindow()<NSWindowDelegate>
@property (nonatomic,assign) NSPoint point;
@end

@implementation MainWindow


- (void)initialize {
    
    self.autoSaver = [TGWindowArchiver find:NSStringFromClass(self.class)];

    [self setAcceptEvents:YES];
    
    [super initialize:self.autoSaver];
    
    
    if(!self.autoSaver) {
        self.autoSaver = [[TGWindowArchiver alloc] initWithName:NSStringFromClass(self.class)];
        self.autoSaver.origin = self.frame.origin;
        self.autoSaver.size = self.frame.size;
    }
    
    self.rootViewController = [[MainViewController alloc] initWithFrame:((NSView *)self.contentView).bounds];

    self.styleMask |= NSTitledWindowMask|NSClosableWindowMask|NSMiniaturizableWindowMask|NSResizableWindowMask;
    
    self.collectionBehavior = NSWindowCollectionBehaviorFullScreenPrimary;
    

}


-(void)setFrame:(NSRect)frameRect display:(BOOL)flag {
    
    [super setFrame:frameRect display:flag];
//    
//    if([self inLiveResize])
//    {
//        MainViewController *mainViewController = (MainViewController *)self.rootViewController;
//        
//        NSPoint current = [self convertScreenToBase:[NSEvent mouseLocation]];
//        
//         if(current.x < (self.point.x - NSWidth(frameRect)/4)  && NSWidth(frameRect) == self.minSize.width) {
//            [mainViewController minimisize];
//            
//         }
////         else if(current.x > (self.point.x - NSWidth(frameRect)/4) && NSWidth(mainViewController.rightViewController.view.frame) > 600) {
////            [mainViewController unminimisize];
////          
////         }
//    }
    
    
    
    
}

-(void)windowWillStartLiveResize:(NSNotification *)notification {
    
    self.point = [self convertScreenToBase:[NSEvent mouseLocation]];
    
    
}

- (void)sendEvent:(NSEvent *)theEvent {
    [super sendEvent:theEvent];
    
}

@end
