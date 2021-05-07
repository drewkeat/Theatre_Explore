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
    2) Productions by venue
    3) Productions by show title

Input the corresponding number for your selection.

When user selects how to search
    Item Specific Query Prompt
        1. What year would you like to explore?
            - Query Year
            - Display all Broadway productions for that year

        2. What venue would you like to explore?
            - Query Venue Name
            - Display all Broadway productions held at that venue

        3. What show would you like to explore?
            -Query Show Title
            -Display all Broadway productions of this title



