include theos/makefiles/common.mk

BUNDLE_NAME = SnoozeOrStopSettings
SnoozeOrStopSettings_FILES = SnoozeOrStopSettings.mm
SnoozeOrStopSettings_INSTALL_PATH = /Library/PreferenceBundles
SnoozeOrStopSettings_FRAMEWORKS = UIKit
SnoozeOrStopSettings_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/SnoozeOrStopSettings.plist$(ECHO_END)
