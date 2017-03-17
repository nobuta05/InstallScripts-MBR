BEGIN {
	FS="=";
}

{
	if ($0 ~ /^HOOKS/) {
		printf("%s=%s encrypt lvm2\"\n", $1, substr($2, 1, length($2)-1));
	}
	else {
		print $0;
	}
}
