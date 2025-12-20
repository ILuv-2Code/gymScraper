# UConn Rec Center Occupancy Analysis

## Overview

This project analyzes occupancy data collected from the UConn Recreation Center over several weeks (October - December 2025), correcting for time zone differences and daylight saving time (DST). The goal is to determine trends in gym usage by weekday, weekend, and hour of the day, enabling better understanding of peak hours and facility usage patterns.

## Features

- **Automated time zone correction** (handles 3:45 hour offset)
- **DST-aware timestamp processing** using pytz
- **Filtering for operational hours** (weekdays 6 AM - 10 PM, weekends 10 AM - 5 PM)
- **Multiple visualization types**:
  - Average occupancy by day of week
  - Average occupancy by hour of day
  - Weekday vs weekend hourly comparison
- **Summary statistics** including mean, median, and peak occupancy

## Requirements

- Python 3.7+
- pandas
- pytz
- matplotlib

## Installation

```bash
pip install pandas pytz matplotlib
```

## Usage

1. Ensure your data file `cordGraph.csv` is in the same directory as the script
2. Run the analysis:

```bash
python gymGraph.py
```

3. The script will display three graphs and print summary statistics to the console

## Data Format

The input CSV file (`cordGraph.csv`) should have the following columns:

| Column | Description | Example |
|--------|-------------|---------|
| `Month` | Three-letter month abbreviation | Oct, Nov, Dec |
| `day` | Day of month | 13 |
| `weekday` | Three-letter weekday (unused in processing) | Mon |
| `time` | Time in HH:MM:SS format | 10:15:04 |
| `occupancy` | Number of people in the gym | 151 |

**Note:** Rows with `Month == "Error"` are automatically filtered out.

## Methodology

### 1. Data Cleaning and Parsing
- Read CSV data using pandas
- Remove error rows where data was missing or invalid
- Convert separate date and time columns into a single datetime object
- Apply the year (2025) explicitly to ensure proper DST handling

### 2. Time Zone Correction
The collected data timestamps are **3 hours and 45 minutes ahead** of Eastern Time. The correction process:
- Subtract 3:45 from raw timestamps
- Localize to `America/New_York` timezone using pytz
- Handle DST transition (November 2, 2025) with `is_dst=False` parameter

### 3. Feature Extraction
- Extract weekday names and hours using pandas `.dt` accessor
- Create `within_hours` flag to identify timestamps within operational hours:
  - **Weekdays (Mon-Fri):** 6 AM - 10 PM
  - **Weekends (Sat-Sun):** 10 AM - 5 PM
- Create `day_type` field (Weekday/Weekend) for comparative analysis

### 4. Aggregation
- Convert weekday column to Categorical type to preserve natural order (Mon → Sun)
- Group by weekday and hour to compute average occupancy
- Ensure all weekdays/hours appear in final aggregation, even with missing data

### 5. Visualization
- Use matplotlib to create three analytical graphs:
  1. **Bar chart:** Average occupancy by day of week
  2. **Line plot:** Average occupancy by hour (0-23)
  3. **Comparative line plot:** Weekday vs weekend hourly patterns
- Format axes and gridlines for readability
- Maintain consistent ordering for clear interpretation

## Output

The script generates:

### Graphs
1. **Average Occupancy by Day of Week** - Bar chart showing which days are busiest
2. **Average Occupancy by Hour of Day** - Line plot showing hourly patterns across all days
3. **Weekday vs Weekend Hourly Comparison** - Overlaid line plots comparing weekday and weekend patterns

### Console Statistics
```
=== Gym Occupancy Summary ===
Total data points: [count]
Valid hours data points: [count]

Overall Statistics:
  Mean occupancy: [value]
  Median occupancy: [value]
  Max occupancy: [value]
  Min occupancy: [value]

By Day Type:
[Statistics table for Weekday vs Weekend]

Busiest Hours (Top 5):
[Top 5 hours with highest average occupancy]

Busiest Days (Top 3):
[Top 3 days with highest average occupancy]
```

## Key Findings

Based on the analysis, typical patterns observed:

- **Peak weekday hours:** Late afternoon/evening (4-9 PM)
- **Morning rush:** 6:30-8:00 AM on weekdays
- **Quietest times:** Early morning (6-7 AM) and late evening (9-10 PM)
- **Weekend patterns:** More concentrated midday usage (10 AM - 5 PM)

## Important Notes

- **DST Handling:** The DST transition on November 2, 2025 (fall back) is handled by assuming standard time for ambiguous timestamps
- **Time Zone Offset:** The 3:45 offset appears to be constant across both EDT and EST periods
- **Data Validation:** Always verify a sample of corrected timestamps against known gym visits to ensure accuracy
- **Operational Hours:** Data outside operational hours is filtered out to focus on actual gym usage

## Troubleshooting

**Problem:** Graph shows unexpected peak times  
**Solution:** Verify the time zone offset direction. If patterns don't match observed reality, try changing the offset sign in line 24.

**Problem:** Missing data for certain days/times  
**Solution:** This is normal. The script handles missing data gracefully and only plots available data points.

**Problem:** Negative or invalid occupancy values  
**Solution:** These are converted to NaN automatically by `pd.to_numeric(errors='coerce')` and excluded from calculations.

## Future Enhancements

Potential improvements to consider:

- [ ] Add heatmap visualization (day of week × hour of day)
- [ ] Compare trends across different months
- [ ] Identify special events or holidays affecting occupancy
- [ ] Add rolling average for smoother trend lines
- [ ] Export results to CSV for further analysis
- [ ] Add command-line arguments for custom operational hours

## Author

Data collection and analysis for UConn Recreation Center

## License

This project is for educational and analytical purposes.