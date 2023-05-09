all:
	gcab --create --nopath DBXUpdate-20100307-x64.cab DBXUpdate-20100307.x64.bin DBXUpdate-20100307.x64.metainfo.xml
	gcab --create --nopath DBXUpdate-20140413-x64.cab DBXUpdate-20140413.x64.bin DBXUpdate-20140413.x64.metainfo.xml
	gcab --create --nopath DBXUpdate-20160809-x64.cab DBXUpdate-20160809.x64.bin DBXUpdate-20160809.x64.metainfo.xml
	gcab --create --nopath DBXUpdate-20200729-aa64.cab DBXUpdate-20200729.aa64.bin DBXUpdate-20200729.aa64.metainfo.xml
	gcab --create --nopath DBXUpdate-20200729-ia32.cab DBXUpdate-20200729.ia32.bin DBXUpdate-20200729.ia32.metainfo.xml
	gcab --create --nopath DBXUpdate-20200729-x64.cab DBXUpdate-20200729.x64.bin DBXUpdate-20200729.x64.metainfo.xml
	gcab --create --nopath DBXUpdate-20210429-aa64.cab DBXUpdate-20210429.aa64.bin DBXUpdate-20210429.aa64.metainfo.xml
	gcab --create --nopath DBXUpdate-20210429-ia32.cab DBXUpdate-20210429.ia32.bin DBXUpdate-20210429.ia32.metainfo.xml
	gcab --create --nopath DBXUpdate-20210429-x64.cab DBXUpdate-20210429.x64.bin DBXUpdate-20210429.x64.metainfo.xml
	gcab --create --nopath DBXUpdate-20220812-aa64.cab DBXUpdate-20220812.aa64.bin DBXUpdate-20220812.aa64.metainfo.xml
	gcab --create --nopath DBXUpdate-20220812-ia32.cab DBXUpdate-20220812.ia32.bin DBXUpdate-20220812.ia32.metainfo.xml
	gcab --create --nopath DBXUpdate-20220812-x64.cab DBXUpdate-20220812.x64.bin DBXUpdate-20220812.x64.metainfo.xml
	gcab --create --nopath DBXUpdate-20230314-aa64.cab DBXUpdate-20230314.aa64.bin DBXUpdate-20230314.aa64.metainfo.xml
	gcab --create --nopath DBXUpdate-20230314-ia32.cab DBXUpdate-20230314.ia32.bin DBXUpdate-20230314.ia32.metainfo.xml
	gcab --create --nopath DBXUpdate-20230314-x64.cab DBXUpdate-20230314.x64.bin DBXUpdate-20230314.x64.metainfo.xml
	gcab --create --nopath DBXUpdate-20230509-aa64.cab DBXUpdate-20230509.aa64.bin DBXUpdate-20230509.aa64.metainfo.xml
	gcab --create --nopath DBXUpdate-20230509-ia32.cab DBXUpdate-20230509.ia32.bin DBXUpdate-20230509.ia32.metainfo.xml
	gcab --create --nopath DBXUpdate-20230509-x64.cab DBXUpdate-20230509.x64.bin DBXUpdate-20230509.x64.metainfo.xml

clean:
	rm -f *.cab
