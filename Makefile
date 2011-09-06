TWEAK_NAME = SnoozeOrStop
SnoozeOrStop_FRAMEWORKS = UIKit
SnoozeOrStop_FILES = Tweak.xm
SUBPROJECTS = snoozeorstopsettings

include theos/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk