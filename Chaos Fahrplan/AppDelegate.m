//
//  AppDelegate.m
//  Chaos Fahrplan
//
//  Copyright (C) 2013  Gerrit Giehl <r4mp@chaosdorf.de>
//
//  This program is free software: you can redistribute it and/or modify it under
//  the terms of the GNU General Public License as published by the Free Software
//  Foundation, either version 3 of the License, or (at your option) any later
//  version.
//
//  This program is distributed in the hope that it will be useful, but WITHOUT
//  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
//  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
//  details.
//
//  You should have received a copy of the GNU General Public License along with
//  this program.  If not, see <http://www.gnu.org/licenses/>.
//

#import "AppDelegate.h"

@implementation AppDelegate

//@synthesize window = _window; // create getter/setter


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self customizeAppearance];
    
    self.xmlParser = [[XmlParser alloc] initXmlParser];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSData *xml = [[appDelegate xmlParser] getXmlFile:@"2011" language: nil];
    [[appDelegate xmlParser] doParse:xml];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    TalkList *talkListDayOne = [[TalkList alloc] initWithNibName:@"TalkList" bundle:nil];
    talkListDayOne.title = @"Day 1";
    self.navDayOne = [[TalkListNavigation alloc] initWithRootViewController:talkListDayOne];

    TalkList *talkListDayTwo = [[TalkList alloc] initWithNibName:@"TalkList" bundle:nil];
    talkListDayTwo.title = @"Day 2";
    self.navDayTwo = [[TalkListNavigation alloc] initWithRootViewController:talkListDayTwo];
    
    TalkList *talkListDayThree = [[TalkList alloc] initWithNibName:@"TalkList" bundle:nil];
    talkListDayThree.title = @"Day 3";
    self.navDayThree = [[TalkListNavigation alloc] initWithRootViewController:talkListDayThree];
    
    TalkList *talkListDayFour = [[TalkList alloc] initWithNibName:@"TalkList" bundle:nil];
    talkListDayFour.title = @"Day 4";
    self.navDayFour = [[TalkListNavigation alloc] initWithRootViewController:talkListDayFour];
    
    TalkList *talkListFavorites = [[TalkList alloc] initWithNibName:@"TalkList" bundle:nil];
    talkListFavorites.title = @"Favorites";
    
    UIBarButtonItem *btEdit = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:talkListFavorites action:@selector(editingButtonPressed:)];
    
    talkListFavorites.navigationItem.rightBarButtonItem = btEdit;
    
    self.navFavorites = [[TalkListNavigation alloc] initWithRootViewController:talkListFavorites];
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects: self.navDayOne, self.navDayTwo, self.navDayThree, self.navDayFour, self.navFavorites, nil];

    
    //    TalkList *talkList2 = [[TalkList alloc] initWithNibName:@"TalkList" bundle:nil];
    //    [nav pushViewController:talkList2 animated:YES];
    
    NSLog(@"%@", [[[self xmlParser] conference] city]);
    
    self.window.rootViewController = self.tabBarController; //nav; // self.tabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)customizeAppearance
{

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
