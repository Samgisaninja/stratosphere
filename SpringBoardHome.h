#include <UIKit/UIKit.h> 

@interface SBDockView : UIView
@end

@class SBRootFolderView;

@interface SBRootFolderController : UIViewController

@property (nonatomic, assign, readwrite) NSUInteger dockEdge;
@property (nonatomic, assign, readwrite) CGFloat dockHeight;
@property (nonatomic,readonly) SBDockView *dockView; 
@property (nonatomic, retain) SBRootFolderView *rootFolderView;

@end

@interface SBRootFolderView : UIView

@property (nonatomic, assign, readwrite) NSUInteger dockEdge;
@property (nonatomic,readonly) SBDockView *dockView; 

@end

@interface SBIconListView : UIView

@property (nonatomic, assign) UIEdgeInsets additionalLayoutInsets;
@property (nonatomic, retain) NSString *iconLocation;

@end

@interface SBIconModel

- (void)layout;
@end
@interface SBIconController : UIViewController

@property (getter=_rootFolderController, nonatomic, retain) SBRootFolderController *rootFolderController;
+(SBIconController *)sharedInstance;
@property (nonatomic, retain) SBIconModel *model;
@end
