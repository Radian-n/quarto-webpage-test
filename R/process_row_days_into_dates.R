process_row_days_into_dates <- function(
  Service,
  `Develop Only`,
  `Dev + Scan`,
  `Prints Add On`,
  current_date = CURRENT_DATETIME,
  biz_calendar = bawb_biz_calendar
) {

  # Get the string of the business calendar name
  biz_calendar_name = biz_calendar$name

  # Calculate dev only due date
  dev_only <- bizdays::offset(
    current_date,
    `Develop Only`,
    biz_calendar_name
  )

  # Calculate dev and scan due date
  dev_and_scan <- bizdays::offset(
    current_date, 
    `Dev + Scan`, 
    biz_calendar_name
  )

  # Calculate print add on due date
  prints_add_on <- bizdays::offset(
    current_date,
    `Prints Add On`,
    biz_calendar_name
  )

  result_df <- tibble::tibble(
    "Service" = Service,
    "Develop Only" = dev_only,
    "Dev + Scan" = dev_and_scan,
    "Prints Add On" = prints_add_on
  )

  return(result_df)
}
