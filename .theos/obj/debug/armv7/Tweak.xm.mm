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


#line 11 "Tweak.xm"
static void (*_logos_orig$ios13$SBRootFolderView$updateIconListIndexAndVisibility$)(_LOGOS_SELF_TYPE_NORMAL SBRootFolderView* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$ios13$SBRootFolderView$updateIconListIndexAndVisibility$(_LOGOS_SELF_TYPE_NORMAL SBRootFolderView* _LOGOS_SELF_CONST, SEL, BOOL); static CGRect (*_logos_orig$ios13$SBDockView$frame)(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL); static CGRect _logos_method$ios13$SBDockView$frame(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$ios13$SBDockView$setFrame$)(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL, CGRect); static void _logos_method$ios13$SBDockView$setFrame$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL, CGRect); static void (*_logos_orig$ios13$SBDockView$initWithFrame$)(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL, CGRect); static void _logos_method$ios13$SBDockView$initWithFrame$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL, CGRect); static CGPoint (*_logos_orig$ios13$SBDockView$center)(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL); static CGPoint _logos_method$ios13$SBDockView$center(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$ios13$SBDockView$setCenter$)(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL, CGPoint); static void _logos_method$ios13$SBDockView$setCenter$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL, CGPoint); 



static void _logos_method$ios13$SBRootFolderView$updateIconListIndexAndVisibility$(_LOGOS_SELF_TYPE_NORMAL SBRootFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1){
    if (@available(ios 13, *)) {
        self.dockEdge = 1;
        UIEdgeInsets safeAreaInsets = [[[UIApplication sharedApplication] keyWindow] safeAreaInsets];
        if (safeAreaInsets.bottom != 0) {
            self.dockView.frame = CGRectMake(0, 50, self.dockView.frame.size.width, self.dockView.frame.size.height);
            if (!dockPoint.x) {
                dockPoint = CGPointMake(self.dockView.center.x, (self.dockView.center.y + 50));
            }
            self.dockView.center = dockPoint;
        }
        _logos_orig$ios13$SBRootFolderView$updateIconListIndexAndVisibility$(self, _cmd, arg1);
    } else {
		_logos_orig$ios13$SBRootFolderView$updateIconListIndexAndVisibility$(self, _cmd, arg1);
	}
}






static CGRect _logos_method$ios13$SBDockView$frame(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    if (@available(ios 13, *)) {
        UIEdgeInsets safeAreaInsets = [[[UIApplication sharedApplication] keyWindow] safeAreaInsets];
        if (safeAreaInsets.bottom != 0){
            CGRect origFrame = _logos_orig$ios13$SBDockView$frame(self, _cmd);
            CGRect fixedFrame = CGRectMake(0, 50, origFrame.size.width, origFrame.size.height);
            return fixedFrame;
        } else {
            return _logos_orig$ios13$SBDockView$frame(self, _cmd);
        }
    } else {
		return _logos_orig$ios13$SBDockView$frame(self, _cmd);
	}
}

static void _logos_method$ios13$SBDockView$setFrame$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGRect arg1){
    if (@available(ios 13, *)) {
        UIEdgeInsets safeAreaInsets = [[[UIApplication sharedApplication] keyWindow] safeAreaInsets];
        if (safeAreaInsets.bottom != 0){
            CGRect origFrame = arg1;
            CGRect fixedFrame = CGRectMake(0, 50, origFrame.size.width, origFrame.size.height);
            _logos_orig$ios13$SBDockView$setFrame$(self, _cmd, fixedFrame);
        } else {
            _logos_orig$ios13$SBDockView$setFrame$(self, _cmd, arg1);
        }
    } else {
		_logos_orig$ios13$SBDockView$setFrame$(self, _cmd, arg1);
	}
}

static void _logos_method$ios13$SBDockView$initWithFrame$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGRect arg1){
    if (@available(ios 13, *)) {
        UIEdgeInsets safeAreaInsets = [[[UIApplication sharedApplication] keyWindow] safeAreaInsets];
        if (safeAreaInsets.bottom != 0){
            CGRect origFrame = arg1;
            CGRect fixedFrame = CGRectMake(0, 50, origFrame.size.width, origFrame.size.height);
            _logos_orig$ios13$SBDockView$initWithFrame$(self, _cmd, fixedFrame);
        } else {
            _logos_orig$ios13$SBDockView$initWithFrame$(self, _cmd, arg1);
        }
    } else {
		_logos_orig$ios13$SBDockView$initWithFrame$(self, _cmd, arg1);
	}
}

static CGPoint _logos_method$ios13$SBDockView$center(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    if (@available(ios 13, *)) {
        UIEdgeInsets safeAreaInsets = [[[UIApplication sharedApplication] keyWindow] safeAreaInsets];
        if (safeAreaInsets.bottom != 0){
            if (!dockPoint.x) {
                CGPoint origPoint = _logos_orig$ios13$SBDockView$center(self, _cmd);
                dockPoint = CGPointMake(origPoint.x, (origPoint.y + 50));
            }
            return dockPoint;
        } else {
            return _logos_orig$ios13$SBDockView$center(self, _cmd);
        }
    } else {
		return _logos_orig$ios13$SBDockView$center(self, _cmd);
	}
}

static void _logos_method$ios13$SBDockView$setCenter$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGPoint arg1){
    if (@available(iOS 13, *)) {
        UIEdgeInsets safeAreaInsets = [[[UIApplication sharedApplication] keyWindow] safeAreaInsets];
        if (safeAreaInsets.bottom != 0){
            if (!dockPoint.x) {
                CGPoint origPoint = arg1;
                dockPoint = CGPointMake(origPoint.x, (origPoint.y + 50));
            }
            _logos_orig$ios13$SBDockView$setCenter$(self, _cmd, dockPoint);
        } else {
            _logos_orig$ios13$SBDockView$setCenter$(self, _cmd, arg1);
        }
    } else {
		_logos_orig$ios13$SBDockView$setCenter$(self, _cmd, arg1);
	}
}





static void (*_logos_orig$old$SBRootFolderView$_coverSheetWillDismiss$)(_LOGOS_SELF_TYPE_NORMAL SBRootFolderView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$old$SBRootFolderView$_coverSheetWillDismiss$(_LOGOS_SELF_TYPE_NORMAL SBRootFolderView* _LOGOS_SELF_CONST, SEL, id); 



static void _logos_method$old$SBRootFolderView$_coverSheetWillDismiss$(_LOGOS_SELF_TYPE_NORMAL SBRootFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){
	self.dockEdge = 1;
	_logos_orig$old$SBRootFolderView$_coverSheetWillDismiss$(self, _cmd, arg1);
}






static __attribute__((constructor)) void _logosLocalCtor_25183486(int __unused argc, char __unused **argv, char __unused **envp){
	NSDictionary *prefs = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.samgisaninja.stratosphereprefs"];
	BOOL isEnabled = [[prefs objectForKey:@"isEnabled"] boolValue];
	if (isEnabled) {
		double CFNumber = kCFCoreFoundationVersionNumber;
		if (CFNumber >= 1600.0) {
			{Class _logos_class$ios13$SBRootFolderView = objc_getClass("SBRootFolderView"); MSHookMessageEx(_logos_class$ios13$SBRootFolderView, @selector(updateIconListIndexAndVisibility:), (IMP)&_logos_method$ios13$SBRootFolderView$updateIconListIndexAndVisibility$, (IMP*)&_logos_orig$ios13$SBRootFolderView$updateIconListIndexAndVisibility$);Class _logos_class$ios13$SBDockView = objc_getClass("SBDockView"); MSHookMessageEx(_logos_class$ios13$SBDockView, @selector(frame), (IMP)&_logos_method$ios13$SBDockView$frame, (IMP*)&_logos_orig$ios13$SBDockView$frame);MSHookMessageEx(_logos_class$ios13$SBDockView, @selector(setFrame:), (IMP)&_logos_method$ios13$SBDockView$setFrame$, (IMP*)&_logos_orig$ios13$SBDockView$setFrame$);MSHookMessageEx(_logos_class$ios13$SBDockView, @selector(initWithFrame:), (IMP)&_logos_method$ios13$SBDockView$initWithFrame$, (IMP*)&_logos_orig$ios13$SBDockView$initWithFrame$);MSHookMessageEx(_logos_class$ios13$SBDockView, @selector(center), (IMP)&_logos_method$ios13$SBDockView$center, (IMP*)&_logos_orig$ios13$SBDockView$center);MSHookMessageEx(_logos_class$ios13$SBDockView, @selector(setCenter:), (IMP)&_logos_method$ios13$SBDockView$setCenter$, (IMP*)&_logos_orig$ios13$SBDockView$setCenter$);}
		} else {
			{Class _logos_class$old$SBRootFolderView = objc_getClass("SBRootFolderView"); MSHookMessageEx(_logos_class$old$SBRootFolderView, @selector(_coverSheetWillDismiss:), (IMP)&_logos_method$old$SBRootFolderView$_coverSheetWillDismiss$, (IMP*)&_logos_orig$old$SBRootFolderView$_coverSheetWillDismiss$);}
		}
	}
}
