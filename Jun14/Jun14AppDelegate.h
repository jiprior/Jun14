//
//  Jun14AppDelegate.h
//  Jun14
//
//  Created by Julia Prior on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TestView;

@interface Jun14AppDelegate : UIResponder <UIApplicationDelegate> {
    TestView *topview;
    TestView *bottomview;
    UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;

@end
