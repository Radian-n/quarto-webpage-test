process_row_strings_into_days <- function(
	Service,
	`Develop Only`,
	`Dev + Scan`,
	`Prints Add On`
) {
	
	# Convert "2 Working Days" -> 2
	dev_only <- convert_string_to_days(`Develop Only`)
	dev_and_scan <- convert_string_to_days(`Dev + Scan`)
	# Prints are +1 days, so need to add on to dev_and_scan.
	prints_add_on <- dev_and_scan + convert_string_to_days(`Prints Add On`)

	result_df <- tibble::tibble(
		"Service" = Service,
		"Develop Only" = dev_only,
		"Dev + Scan" = dev_and_scan,
		"Prints Add On" = prints_add_on
	)

	return(result_df)
}
