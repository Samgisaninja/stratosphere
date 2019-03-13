@interface SBRootFolderView: UIView
@property (nonatomic, assign, readwrite) NSUInteger dockEdge;
@end

%hook SBRootFolderView

-(void)_coverSheetWillDismiss:(id) arg1{
	self.dockEdge = 1;
}

%end

