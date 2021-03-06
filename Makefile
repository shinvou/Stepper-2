DEBUG = 0

GO_EASY_ON_ME = 1

TARGET = iphone:clang:latest:8.0
ARCHS = arm64

THEOS_DEVICE_IP = 127.0.0.1
THEOS_DEVICE_PORT = 2222
THEOS_PACKAGE_DIR_NAME = deb

include theos/makefiles/common.mk

TWEAK_NAME = Stepper2
Stepper2_FILES = Tweak.xm StepperFetcher.xm DBManipulator.xm
Stepper2_FRAMEWORKS = UIKit CoreMotion
Stepper2_CFLAGS = -fobjc-arc
Stepper2_LIBRARIES = sqlite3

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += Stepper2Settings
include $(THEOS_MAKE_PATH)/aggregate.mk

before-stage::
	find . -name ".DS_Store" -delete
after-install::
	install.exec "killall -9 backboardd"
