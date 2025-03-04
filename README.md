# Black and White Box Turnaround Times Page

## Description

This project creates a static web page that displays the turnaround times for various services provided by [The Black and White Box photo lab](https://theblackandwhitebox.co.nz/) in Auckland, NZ.

The page is designed for staff (or anyone really) to be able to, at a glance, determine the expected due date of a specific service.

## How it works

The expected due dates are pulled from the [current turnaround times](https://theblackandwhitebox.co.nz/turn-around-times/) webpage. These turnaround times are updated by Black and White Box staff.

The dates of any upcoming holidays are pulled from the [NZ Public Holidays API](https://www.public-holidays.nz/).

The due dates are calculated based on the current date, the current lab turnaround times published on the website, and any public holidays (NZ and Auckland).

Each day at 4:30pm UTC (4:30am or 5:30am NZT depending on daylight savings), the webpage is rebuilt, and the new due dates are re-calcaulted.

## Limitations

### Currently a work in progress

Website isnt fully implemented yet. It's currently just a proof of concept.

### Page is only updated daily.

Therefore, if the turnaround times webpage is updated at 2pm so that all turnaround times are 1 working day longer, then the new expected due dates won't be calculated until the website is rebuilt the following day at 4am.