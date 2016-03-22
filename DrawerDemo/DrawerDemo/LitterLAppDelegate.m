
#import "LitterLAppDelegate.h"
#import "MMDrawerController.h"
#import "UIViewController+MMDrawerController.h"
#import "LitterLCenterViewController.h"
#import "LitterLLeftViewController.h"
#import "LitterLRightViewController.h"

@interface LitterLAppDelegate ()
/**
 *  属性
 */
@property(nonatomic,strong) MMDrawerController * drawerController;
@end

@implementation LitterLAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //1、初始化控制器
    UIViewController *centerVC = [[LitterLCenterViewController alloc]init];
    UIViewController *leftVC = [[LitterLLeftViewController alloc]init];
    UIViewController *rightVC = [[LitterLRightViewController alloc]init];
    //2、初始化导航控制器
    UINavigationController *centerNvaVC = [[UINavigationController alloc]initWithRootViewController:centerVC];
    UINavigationController *leftNvaVC = [[UINavigationController alloc]initWithRootViewController:leftVC];
    UINavigationController *rightNvaVC = [[UINavigationController alloc]initWithRootViewController:rightVC];
    
    //3、使用MMDrawerController
    self.drawerController = [[MMDrawerController alloc]initWithCenterViewController:centerNvaVC leftDrawerViewController:leftNvaVC rightDrawerViewController:rightNvaVC];
    
    //4、设置打开/关闭抽屉的手势
    self.drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    self.drawerController.closeDrawerGestureModeMask =MMCloseDrawerGestureModeAll;
    //5、设置左右两边抽屉显示的多少
    self.drawerController.maximumLeftDrawerWidth = 200.0;
    self.drawerController.maximumRightDrawerWidth = 200.0;

    
    //6、初始化窗口、设置根控制器、显示窗口
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setRootViewController:self.drawerController];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
