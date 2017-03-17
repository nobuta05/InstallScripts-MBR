BEGIN {
	FS="=";
}

{
	if ($1 ~ /^GRUB_CMDLINE_LINUX$/) {
		printf("%s=\"cryptdevice=/dev/sda2:lvm\"\n", $1);
	}
	else {
		print $0;
	}
}
