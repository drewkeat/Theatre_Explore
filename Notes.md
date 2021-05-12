# Project Requirements
- Provide a CLI
- CLI application must provide access to data from a web page.
- Data provided must go at least one level deep.
    - A "level" is where a user can make a choice and then get detailed information about their choice. 
- Should not be too similar to the Ruby final projects (Music Library CLI, Tic-Tac-Toe with AI, Student Scraper).
- Use good OO design patterns. 
- Create a collection of objects, not hashes, to store your data. 
    - Pro Tip: Avoid scraping data more than once per web page - utilize objects you have already created. It will speed up your program!

- Additional Items:
    - Record 30 minutes of coding
    - Record video walkthrough of final app
    - Create blog and blog entry

## Checklist

### README file contains the following sections:
- A short description
- Install instructions
- A contributor's guide
- A link to the license for your code
### CLI Essentials
- Have a CLI for interfacing with the application
- Pull data from an external source
- Implement both list and detail views. The data provided must go at least one level deep.
- The application is pretty DRY
### Ruby Essentials
- Basic control flow - how "if" statements work
- Variable scopes - method, instance and class
- Object instantiation - #new (and possibly #initialize)
- The meaning of the "self" keyword
- Method types - class vs. instance methods
- Method return types - knowing what methods return
- Iterating through collections - at least using #each with a block

## Process Notes

User will enter Theatre_Explore

CLI displays options 

    How would you like to search?
    1) Productions by year
    2) Productions by show title

Input the corresponding number for your selection.

When user selects how to search
    Item Specific Query Prompt
        1. What year would you like to explore?
            - Query Year
            - Scrape all productions for year and create Year Object
            - Display all Broadway productions for that year
            - Production Selection Prompt

        2. What show would you like to explore?
            -Query Show Title
            -Scraper searches BroadwayWorld for show title and Creates Show Object
            -Display all Broadway productions of this title
            - Production Selection Prompt

Production Selection Prompt
    -Ask users if they wish to explore a specific production?
    -User inputs integer to select which production to investigate further.
    -Scraper pulls production url and creates production object
    -Display Production Details
    -Final Prompt

Final prompt
    -Ask users if they wish to explore more
    -Y => Initial Prompt
    -N => Exit


### Mechanize notes

`var = Mechanize.new`  Instantiates new Mechanize object

`page = var.get(URL)` Saves a Mechanize::Page object with data from the webpage

### Fix notes

Todo:
- ShowScraper won't work on "Year Links"
- 




