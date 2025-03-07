convert_string_to_days <- function(turnaround_string) {

  turnaround_string_lower <- stringr::str_to_lower(turnaround_string)

  # TODO: Convert all these inner 'if' statements into separate functions for testing
  
  # E.g  '2 Working Days' or '10 Working days'
  if (stringr::str_detect(turnaround_string_lower, "^\\d{1,2}.*$")) {
    days <- stringr::str_extract(turnaround_string_lower, "\\d{1,2}")
    days <- as.numeric(days)
    return(days)
  } 

  # E.g '+ 1 working days
  else if (stringr::str_detect(turnaround_string_lower, "^+.*$")) {
    days <- stringr::str_extract(turnaround_string_lower, "\\d{1,2}")
    days <- as.numeric(days)
    return(days)
  }

  # E.g 'Processed Wednesday'
  else if (stringr::str_detect(turnaround_string_lower, "(monday|tuesday|wednesday|thursday|friday|saturday|sunday)")) {
    weekday <- stringr::str_extract(turnaround_string_lower, "\\b(monday|tuesday|wednesday|thursday|friday|saturday|sunday)\\b")

    if (weekday %in% c("wednesday", "thursday", "friday")) {
      # These are days when E-6 will be processing. 
      # Therefore any new orders coming in on these days will not be due until next week.
      # Returned days need to be from next week
      days <- get_days_until_weekday(weekday)
      return(days)
    }
    
    # Otherwise days are this week
    days <- get_days_until_weekday(weekday)
    return(days)
  }

  return(NA)

}




# Function to find the next date for a given weekday
get_days_until_weekday <- function(weekday) {

  # Convert input weekday to lowercase for matching
  target_weekday <- tolower(weekday)

  # Check that the weekday parameter is correct
  assertthat::assert_that(
    target_weekday %in% c("monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"),
    msg = glue::glue("`weekday` must be a named weekday, not {weekday}")
  )

  # Get todays date
  current_date <- lubridate::today(tzone = "Pacific/Auckland")
  
  # List of weekdays for matching
  weekdays_list <- tolower(weekdays(current_date + 1:7))
  
  # Get the index of the target weekday
  target_index <- match(target_weekday, weekdays_list)

  return(target_index)
}


