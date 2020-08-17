# UEFI Revocation

DBXUpdate files from Microsoft, specifically from https://uefi.org/revocationlistfile

These files are used to update the Secure Boot Forbidden Signature Database, dbx.

Example usage:

    SetVariable("dbx", EFI_IMAGE_SECURITY_DATABASE_GUID, NV+BS+RT+AT+AppendWrite, sz, buf);

The dbx files already contains a Microsoft KEK signature, encoded as specified
by the UEFI specification.

UEFI Revocation List files contain the, now-revoked, signatures of previously
approved and signed firmware and software used in booting systems with UEFI
Secure Boot enabled.

Distribution of the data in these files to running systems could cause
instability and should only be attempted by security experts and professionals.

System OEMs can use these files to test their platform firmware.
