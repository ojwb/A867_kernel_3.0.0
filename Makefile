# License: GPL


SOURCEDIR := $(PWD)
# ----------------------------------------

dvb-usb-a867-objs := a867_af903x-core.o a867_af903x-devices.o a867_af903x-drv.o \
                       a867_af903x-fe.o a867_af903x-tuner.o a867_cmd.o a867_standard.o \
                       a867_demodulator.o a867_demodulatorextend.o a867_usb2impl.o \
                       a867_user.o a867_mxl5007t.o a867_Maxlinear_MXL5007.o a867_Afa_AF9007.o

obj-m += dvb-usb-a867.o


EXTRA_CFLAGS += -I$(SOURCEDIR)/include/ \
		-I$(KBUILD_SRC)/drivers/media/dvb/dvb-usb/ \
		-I$(KBUILD_SRC)/drivers/media/dvb/dvb-core/ \
		-I$(KBUILD_SRC)/drivers/media/dvb/frontends/ \
		-I$(KBUILD_SRC)/drivers/media/common/tuners/

KINS = /lib/modules
KDIR = /usr/src/linux-headers-`uname -r`

default:
	make -C $(KDIR) SUBDIRS=$(PWD) modules

install:
	cp dvb-usb-a867.ko $(KINS)/`uname -r`/kernel/drivers/media/dvb/dvb-usb/ 
	depmod -a

clean:
	-rm -f  *.o  *.ko *.mod.c .*.o.cmd  .*.o.d  .*.ko.cmd Module.symvers Module.markers modules.order
	-rm -rf .tmp_versions
