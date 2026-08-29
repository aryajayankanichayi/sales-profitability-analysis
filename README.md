# Why was profit falling even though sales looked fine?

I was going through a retail sales dataset (5,009 orders, 2014-2017) and something didn't add up - total sales looked healthy at ₹22.97L but the profit margin was only 12.47%. That gap is what got me digging into this in the first place.

This repo is that investigation, done three ways - Excel, SQL, and Python.

## The short version

Discounts above 20% were quietly killing profit. Sales in that range didn't really drop, but profit went negative, which basically means the business was paying customers to buy at that point.

| Discount Range | Sales | Profit |
|---|---|---|
| 0% | ₹10.87L | ₹3.2L |
| 1-20% | ₹8.4L | ₹1L |
| 21-30% | ₹1.03L | -₹10,369 |
| 31%+ | ₹2.6L | -₹1.25L |

Once I saw that pattern I checked a few other things too. Technology and Office Supplies were doing most of the work profit-wise, Furniture barely moved the needle, and West region was ahead of everyone else by a decent margin.

My take - cap discounts at 20%, or at least put anything above that behind manager approval. Simple rule, and based on this data it would've protected somewhere around ₹1.35L over the period.

## What's in here

- excel/ - the dashboard itself, pivot tables + slicers
- sql/ - same analysis, written as queries
- python/ - same thing again, pandas + a quick correlation check
- data/ - the cleaned csv everything else runs on

I did the same analysis three times on purpose instead of picking one tool. In a real job you don't usually get to choose - sometimes it's a spreadsheet someone emailed you, sometimes it's a database, sometimes the data's too big for Excel and you need Python. Wanted to show I could move between all three without it being a struggle.

### Excel

Started here. Used pivot tables to find the pattern, then built a combo chart (bar + line) so you can actually see sales staying flat while profit drops off. Added slicers for Region and Category so it's not just static numbers.

### SQL

Rebuilt the main queries the way I'd write them if this data lived in an actual database - discount buckets, profit by category, profit by region. Kept the SQL simple and commented so it's easy to follow.

### Python

Same analysis again in a notebook, plus I ran a quick correlation between discount % and profit margin to check if the relationship was actually strong or just a coincidence (it's strong). Used pandas and matplotlib.

## How I got here

1. Cleaned the raw data first - mainly built a discount bucket column so I could group orders instead of dealing with a dozen different discount percentages
2. Pivoted sales and profit against that bucket column, that's where the negative profit thing first showed up
3. Cross checked it against category and region to make sure it wasn't a fluke
4. Built the dashboard around that one finding instead of just throwing every possible chart on a page
5. Redid it in SQL and Python to double check the number held up outside Excel

Tools used - Excel(pivot tables, slicers, charts), SQL(SQLite), Python(pandas, matplotlib, scipy)

If you just want the quickest look at the finding, the Excel dashboard screenshot below is the fastest way in - everything else here is the same conclusion proven a different way.
