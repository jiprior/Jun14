//
//  TestView.m
//  Jun14
//
//  Created by Julia Prior on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TestView.h"

@implementation TestView
@synthesize thetext;


- (id) initWithFrame: (CGRect) frame
             thetext: (NSString *) s
     backgroundColor: (UIColor *) c
          startpoint: (CGPoint) p
                font: (UIFont *) f 
{
    
	self = [super initWithFrame: frame];
	if (self != nil) {
		self.backgroundColor = c;
		self.thetext = s;
		startpoint = p;	//not a property, doesn't need self.
		font = f;
        CGFloat viewwidth = self.bounds.size.width;
        CGFloat viewheight = self.bounds.size.height;
        self.bounds = CGRectMake(-viewwidth / 2, -viewheight / 2, viewwidth, viewheight);
	}
	return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code



    // Print the text
 CGSize textsize = [thetext sizeWithFont: font];
 startpoint = CGPointMake(-textsize.width / 2, -textsize.height/2);
 CGContextSetRGBFillColor(UIGraphicsGetCurrentContext(), 0, 0.5, 0.5, 1); //red, green, blue, alpha
 [thetext drawAtPoint: startpoint withFont: font];


 
}


@end
