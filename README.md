##Overview##

This project analyzes occupancy data collected from a gym over several weeks, correcting for time zone differences and daylight saving time (DST). The goal is to determine trends in gym usage by weekday, weekend, and hour of the day, enabling better understanding of peak hours and facility usage patterns at the UConn Rec Center.

##Methodology

Data Cleaning and Parsing

Read CSV data using pandas.

Remove error rows where data was missing or invalid.

Convert separate date and time columns into a single datetime object.

Apply the year explicitly to ensure proper DST handling.

Time Zone Correction

Subtract the raw offset (3 hours 45 minutes) to align with local EST.

Localize timestamps using pytz to handle daylight saving time.

Feature Extraction

Extract weekday names and hours using pandas .dt accessor.

Use a function to flag whether each timestamp falls within valid operational hours.

Aggregation

Convert weekday column to a Categorical type to preserve natural order (Mon → Sun).

Group by weekday and compute average occupancy.

Ensure all weekdays appear in the final aggregation, even if some have no valid data.

Visualization

Use matplotlib to create bar plots of average occupancy by weekday.

Format axes and gridlines for readability.

Maintain consistent ordering for clear interpretation.
