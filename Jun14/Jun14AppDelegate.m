//
//  Jun14AppDelegate.m
//  Jun14
//
//  Created by Julia Prior on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Jun14AppDelegate.h"
#import "TestView.h"

@implementation Jun14AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    UIScreen *screen = [UIScreen mainScreen];
    CGRect applicationFrame = screen.applicationFrame;
    CGRect bounds = screen.bounds;
    CGRect topviewframe = CGRectMake(0, 0, bounds.size.width, bounds.size.height/2);
    CGRect bottomviewframe = CGRectMake(0, bounds.size.height/2, bounds.size.width, bounds.size.height/2);
    
   //Create the top view
    UIDevice *thisdevice = [UIDevice currentDevice];
    NSString *who = thisdevice.model;
    NSString *hi = [@"Hello, " stringByAppendingString: who];
    topview = [[TestView alloc] initWithFrame: topviewframe thetext: hi backgroundColor: [UIColor lightGrayColor] startpoint: CGPointZero font: [UIFont systemFontOfSize: 26.0]];
    
    //Create the bottom view
    NSURL *url = [[NSURL alloc] initWithString:
                  @"http://finance.yahoo.com/d/quotes.csv?s=IBM&f=sl1t1"];
    
	NSError *error;
	NSString *stock = [[NSString alloc]
                       initWithContentsOfURL: url
                       encoding: NSUTF8StringEncoding
                       error: &error
                       ];
    
	if (stock == nil) {
		stock = [error localizedDescription];
	}
    NSString *news = [@"The current price of IBM stock is: " stringByAppendingString: stock];
  
    bottomview = [[TestView alloc] initWithFrame: bottomviewframe thetext: news backgroundColor: [UIColor orangeColor] startpoint: CGPointZero font: [UIFont systemFontOfSize: 11.0]];

   
    // Create the window
    self.window = [[UIWindow alloc] initWithFrame: bounds];
    
    // Put the view into the window
    //self.window.backgroundColor = [UIColor whiteColor];
    [self.window addSubview: topview];
    [self.window addSubview: bottomview];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    //Trigger another call to drawRect:
	[topview setNeedsDisplay];
    [bottomview setNeedsDisplay];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
