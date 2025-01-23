all:
	gcab --create --nopath DBXUpdate-20230314-aa64.cab DBXUpdate-20230314.aa64.bin DBXUpdate-20230314.aa64.metainfo.xml
	gcab --create --nopath DBXUpdate-20230314-ia32.cab DBXUpdate-20230314.ia32.bin DBXUpdate-20230314.ia32.metainfo.xml
	gcab --create --nopath DBXUpdate-20230314-x64.cab DBXUpdate-20230314.x64.bin DBXUpdate-20230314.x64.metainfo.xml
	gcab --create --nopath DBXUpdate-20230509-aa64.cab DBXUpdate-20230509.aa64.bin DBXUpdate-20230509.aa64.metainfo.xml
	gcab --create --nopath DBXUpdate-20230509-ia32.cab DBXUpdate-20230509.ia32.bin DBXUpdate-20230509.ia32.metainfo.xml
	gcab --create --nopath DBXUpdate-20230509-x64.cab DBXUpdate-20230509.x64.bin DBXUpdate-20230509.x64.metainfo.xml
	gcab --create --nopath DBXUpdate-20241101-ia32.cab DBXUpdate-20241101.ia32.bin DBXUpdate-20241101.ia32.metainfo.xml
	gcab --create --nopath DBXUpdate-20241101-x64.cab DBXUpdate-20241101.x64.bin DBXUpdate-20241101.x64.metainfo.xml

clean:
	rm -f *.cab
