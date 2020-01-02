include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = stratosphereprefs

stratosphereprefs_FILES = STRRootListController.m
stratosphereprefs_INSTALL_PATH = /Library/PreferenceBundles
stratosphereprefs_FRAMEWORKS = UIKit
stratosphereprefs_PRIVATE_FRAMEWORKS = Preferences
stratosphereprefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/stratosphereprefs.plist$(ECHO_END)
