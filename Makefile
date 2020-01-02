include $(THEOS)/makefiles/common.mk

ARCHS = armv7 armv7s arm64 arm64e
TWEAK_NAME = stratosphere
stratosphere_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += stratosphereprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
