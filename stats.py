#!/usr/bin/python3
# -*- coding: utf-8 -*-
#
# Copyright (C) 2022 Richard Hughes <richard@hughsie.com>
#
# SPDX-License-Identifier: GPL-2.0+
#
# pylint: disable=consider-using-f-string,missing-module-docstring,missing-class-docstring
# pylint: disable=too-few-public-methods,missing-function-docstring

import sys
import glob
import subprocess
from typing import Optional, List


class DbxEntry:
    def __init__(self):
        self.guid: str = None
        self.type: str = None
        self.checksum: str = None

    def __repr__(self) -> str:
        return "DbxEntry[type={}, hash={}]".format(self.type, self.checksum)


class DbxFile:
    def __init__(self, filename: str):
        self.filename = filename
        self.entries: List[DbxEntry] = []
        out = subprocess.run(
            ["dbxtool", "-l", "-d", filename], capture_output=True, check=True
        )
        for line in out.stdout.decode().split("\n"):
            entry = DbxEntry()
            try:
                _, entry.guid, entry.type, entry.checksum = line.split(":")[1].split(
                    " "
                )
                if entry.type == "{sha256}":
                    entry.type = "SHA256"
                if entry.type == "{x509_cert}":
                    entry.type = "X509CT"
            except IndexError:
                pass
            else:
                self.entries.append(entry)

    def find_entry_from_hash(self, checksum: str) -> Optional[DbxEntry]:
        for entry in self.entries:
            if checksum == entry.checksum:
                return entry
        return None

    def __repr__(self) -> str:
        return "DbxFile[{}]".format(", ".join(str(entry) for entry in self.entries))


def print_stats(fns: List[str]) -> None:

    dbxfiles: List[DbxFile] = []
    for filename in fns:
        dbxfiles.append(DbxFile(filename))

    for idx, dbxfile_new in enumerate(dbxfiles):

        if idx == 0:
            dbxfile_old = None
            dbxfile_fns = "origin -> {}".format(dbxfile_new.filename)
        else:
            dbxfile_old = dbxfiles[idx - 1]
            dbxfile_new = dbxfiles[idx]
            dbxfile_fns = "{} -> {}".format(
                dbxfile_old.filename, dbxfile_new.filename
            )

        # look for added hashes
        for entry in dbxfile_new.entries:
            if not dbxfile_old or not dbxfile_old.find_entry_from_hash(
                entry.checksum
            ):
                print("{} ADD {}".format(dbxfile_fns.ljust(60), str(entry)))

        # look for removed hashes
        if dbxfile_old:
            for entry in dbxfile_old.entries:
                if not dbxfile_new.find_entry_from_hash(entry.checksum):
                    print("{} DEL {}".format(dbxfile_fns.ljust(60), str(entry)))


if __name__ == "__main__":

    if len(sys.argv) > 1:
        print_stats(sys.argv[1:])
    else:
        fns: List[str] = []
        for arch in ["ia32", "aa64", "x64"]:
            for fn in glob.glob("DBXUpdate*.{}.bin".format(arch)):
                fns.append(fn)
        print_stats(sorted(fns))
    sys.exit(0)
