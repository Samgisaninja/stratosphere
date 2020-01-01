#line 1 "Tweak.xm"
CGPoint dockPoint;

@interface SBDockView : UIView
@end

@interface SBRootFolderView : UIView
@property (nonatomic, assign, readwrite) NSUInteger dockEdge;
@property (nonatomic,readonly) SBDockView *dockView; 
@end


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBDockView; @class SBRootFolderView; 
static void (*_logos_orig$_ungrouped$SBRootFolderView$updateIconListIndexAndVisibility$)(_LOGOS_SELF_TYPE_NORMAL SBRootFolderView* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$SBRootFolderView$updateIconListIndexAndVisibility$(_LOGOS_SELF_TYPE_NORMAL SBRootFolderView* _LOGOS_SELF_CONST, SEL, BOOL); static CGRect (*_logos_orig$_ungrouped$SBDockView$frame)(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL); static CGRect _logos_method$_ungrouped$SBDockView$frame(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBDockView$setFrame$)(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL, CGRect); static void _logos_method$_ungrouped$SBDockView$setFrame$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL, CGRect); static void (*_logos_orig$_ungrouped$SBDockView$initWithFrame$)(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL, CGRect); static void _logos_method$_ungrouped$SBDockView$initWithFrame$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL, CGRect); static CGPoint (*_logos_orig$_ungrouped$SBDockView$center)(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL); static CGPoint _logos_method$_ungrouped$SBDockView$center(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBDockView$setCenter$)(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL, CGPoint); static void _logos_method$_ungrouped$SBDockView$setCenter$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL, CGPoint); 

#line 11 "Tweak.xm"


static void _logos_method$_ungrouped$SBRootFolderView$updateIconListIndexAndVisibility$(_LOGOS_SELF_TYPE_NORMAL SBRootFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1){
    self.dockEdge = 1;
	self.dockView.frame = CGRectMake(0, 50, self.dockView.frame.size.width, self.dockView.frame.size.height);
	if (!dockPoint.x) {
		dockPoint = CGPointMake(self.dockView.center.x, (self.dockView.center.y + 50));
	}
	self.dockView.center = dockPoint;
    _logos_orig$_ungrouped$SBRootFolderView$updateIconListIndexAndVisibility$(self, _cmd, arg1);
}






static CGRect _logos_method$_ungrouped$SBDockView$frame(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	CGRect origFrame = _logos_orig$_ungrouped$SBDockView$frame(self, _cmd);
	CGRect fixedFrame = CGRectMake(0, 50, origFrame.size.width, origFrame.size.height);
	return fixedFrame;
}

static void _logos_method$_ungrouped$SBDockView$setFrame$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGRect arg1){
	CGRect origFrame = arg1;
	CGRect fixedFrame = CGRectMake(0, 50, origFrame.size.width, origFrame.size.height);
	_logos_orig$_ungrouped$SBDockView$setFrame$(self, _cmd, fixedFrame);
}

static void _logos_method$_ungrouped$SBDockView$initWithFrame$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGRect arg1){
	CGRect origFrame = arg1;
	CGRect fixedFrame = CGRectMake(0, 50, origFrame.size.width, origFrame.size.height);
	_logos_orig$_ungrouped$SBDockView$initWithFrame$(self, _cmd, fixedFrame);
}

static CGPoint _logos_method$_ungrouped$SBDockView$center(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	if (!dockPoint.x) {
		CGPoint origPoint = _logos_orig$_ungrouped$SBDockView$center(self, _cmd);
		dockPoint = CGPointMake(origPoint.x, (origPoint.y + 50));
	}
	return dockPoint;
}
static void _logos_method$_ungrouped$SBDockView$setCenter$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGPoint arg1){
	if (!dockPoint.x) {
		CGPoint origPoint = arg1;
		dockPoint = CGPointMake(origPoint.x, (origPoint.y + 50));
	}
	_logos_orig$_ungrouped$SBDockView$setCenter$(self, _cmd, dockPoint);
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBRootFolderView = objc_getClass("SBRootFolderView"); MSHookMessageEx(_logos_class$_ungrouped$SBRootFolderView, @selector(updateIconListIndexAndVisibility:), (IMP)&_logos_method$_ungrouped$SBRootFolderView$updateIconListIndexAndVisibility$, (IMP*)&_logos_orig$_ungrouped$SBRootFolderView$updateIconListIndexAndVisibility$);Class _logos_class$_ungrouped$SBDockView = objc_getClass("SBDockView"); MSHookMessageEx(_logos_class$_ungrouped$SBDockView, @selector(frame), (IMP)&_logos_method$_ungrouped$SBDockView$frame, (IMP*)&_logos_orig$_ungrouped$SBDockView$frame);MSHookMessageEx(_logos_class$_ungrouped$SBDockView, @selector(setFrame:), (IMP)&_logos_method$_ungrouped$SBDockView$setFrame$, (IMP*)&_logos_orig$_ungrouped$SBDockView$setFrame$);MSHookMessageEx(_logos_class$_ungrouped$SBDockView, @selector(initWithFrame:), (IMP)&_logos_method$_ungrouped$SBDockView$initWithFrame$, (IMP*)&_logos_orig$_ungrouped$SBDockView$initWithFrame$);MSHookMessageEx(_logos_class$_ungrouped$SBDockView, @selector(center), (IMP)&_logos_method$_ungrouped$SBDockView$center, (IMP*)&_logos_orig$_ungrouped$SBDockView$center);MSHookMessageEx(_logos_class$_ungrouped$SBDockView, @selector(setCenter:), (IMP)&_logos_method$_ungrouped$SBDockView$setCenter$, (IMP*)&_logos_orig$_ungrouped$SBDockView$setCenter$);} }
#line 62 "Tweak.xm"
