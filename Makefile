all: \
	DBUpdate-3P2023.cab \
	DBUpdate-3P2023+OROM2023-crtd.cab \
	DBUpdate-3P2023+OROM2023.cab \
	DBUpdate-WIN2023.cab \
	DBXUpdate-20250507-legacy-x64.cab \
	DBXUpdate-20250902-x64.cab \
	DBXUpdate-20260402-x64.cab \
	DBXUpdate-20260707-x64.cab

clean:
	rm -f *.zip *.cab

DBUpdate-3P2023+OROM2023.zip: DBUpdate3P2023.bin DBUpdateOROM2023.bin
	zip -0 $@ $^
DBUpdate-3P2023.zip: DBUpdate3P2023.bin
	zip -0 $@ $^
DBUpdate-WIN2023.zip: DBUpdate2024.bin
	zip -0 $@ $^
DBUpdate-3P2023+OROM2023.cab: DBUpdate-3P2023+OROM2023.zip DBUpdate-3P2023+OROM2023.metainfo.xml
	fwupdtool --force build-cabinet $@ $^
DBUpdate-3P2023+OROM2023-crtd.cab: DBUpdate-3P2023+OROM2023.zip DBUpdate-3P2023+OROM2023-crtd.metainfo.xml
	fwupdtool --force build-cabinet $@ $^
DBUpdate-3P2023.cab: DBUpdate-3P2023.zip DBUpdate-3P2023.metainfo.xml
	fwupdtool --force build-cabinet $@ $^
DBUpdate-WIN2023.cab: DBUpdate-WIN2023.zip DBUpdate-WIN2023.metainfo.xml
	fwupdtool --force build-cabinet $@ $^

DBXUpdate-20250507-legacy-x64.cab: DBXUpdate-20250507.x64.bin DBXUpdate-20250507-legacy.x64.metainfo.xml
	fwupdtool --force build-cabinet $@ $^
DBXUpdate-20250902-x64.cab: DBXUpdate-20250902.x64.bin DBXUpdate-20250902.x64.metainfo.xml
	fwupdtool --force build-cabinet $@ $^
DBXUpdate-20260402-x64.cab: DBXUpdate-20260402.x64.bin DBXUpdate-20260402.x64.metainfo.xml
	fwupdtool --force build-cabinet $@ $^
DBXUpdate-20260707-x64.cab: DBXUpdate-20260707.x64.bin DBXUpdate-20260707.x64.metainfo.xml
	sudo fwupdtool --force build-cabinet $@ $^
