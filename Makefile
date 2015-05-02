obj-m := sch_fq_pie.o
IDIR= /lib/modules/$(shell uname -r)/kernel/net/sched/
KDIR := /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)
default:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules

install:
	install -v -m 644 sch_fq_pie.ko $(IDIR)
	depmod
	modprobe sch_fq_pie

clean:
	rm -rf Module.markers modules.order Module.symvers sch_fq_pie.ko sch_fq_pie.mod.c sch_fq_pie.mod.o sch_fq_pie.o
