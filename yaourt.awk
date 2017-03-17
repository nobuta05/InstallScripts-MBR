/^[1-9]/{
    regexp = INP"$";
    if ($2 ~ regexp) {
	print $1
    }
}
