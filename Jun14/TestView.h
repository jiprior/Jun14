//
//  TestView.h
//  Jun14
//
//  Created by Julia Prior on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestView : UIView {
    NSString *thetext;
	CGPoint startpoint;
	UIFont *font;
}

@property (nonatomic, copy) NSString *thetext;

- (id) initWithFrame: (CGRect) frame
             thetext: (NSString *) s
     backgroundColor: (UIColor *) c
          startpoint: (CGPoint) p
                font: (UIFont *) f;

@end
