obj-m = gclip.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

install:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
	sudo insmod /home/anthony/dev/gclip/gclip.ko
	sudo mknod /dev/gclip c 250 0
	sudo chmod 777 /dev/gclip

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
	sudo rmmod gclip
	sudo rm /dev/gclip
