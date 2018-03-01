# Specifications for the CLI Assessment

Specs:

- [x] Have a CLI for interfacing with the application

The #call method hosts all the other methods that allow the CLI to run. #greeting welcomes the user. #create_fishing_location_and_report calls the method that scrapes information. #run_program_interface pulls up a main menu that is interactive via user input. From the #run_program_interface a user can choose to see the list of fishing locations or quit the program. Finally, within the #run_program_interface is the #goodbye method that prints a good bye message upon program termination.


- [X] Pull data from an external source

I have created a BASE_PATH that pulls up a New Jersey Fishing Report website. The two scraping methods use Nokogiri and Open URI to scrape relevant information from the website--and one level deep in the website(fishing_report is one level deep).

- [X] Implement both list and detail views

I have implemented the list view by allowing users to select the list of fishing locations from the main menu. If the user choose to view the list, there is a list of updated fishing locations. Further, by selecting the number of an individual fishing location the user can see the details of that selection. In this case, the details are the actual fishing report of the individual fishing location.
