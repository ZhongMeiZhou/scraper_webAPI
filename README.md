#LPTours Webservice [ ![Codeship Status for ZhongMeiZhou/scraper_webAPI](https://codeship.com/projects/5a3f7fb0-62aa-0133-fec9-1af77e49650b/status?branch=master)](https://codeship.com/projects/112659)

## Endpoint
  
  ```sh
 http://zmztours.herokuapp.com/
 ```


## Description

A simple version of web service that scrapes Lonely Planet data using the [lonely_planet_tours](https://github.com/ZhongMeiZhou/scraper_project)


## Usage and Examples

Handles:

- GET /
  - It tells us the current API version and Github homepage of API.
  - Example: http://localhost:9292

- GET /api/v1/taiwan_tours
  - Returns JSON data using (Taiwan tours) your web scraping gem.
  - Example: http://localhost:9292/api/v1/taiwan_tours

- GET /api/v1/tours/[:param].json
  - Takes a [:param] as the country of interest to get the scraped data
  - Returns tours information of the provided country in JSON format.
  - Example: http://localhost:9292/api/v1/tours/Japan.json

- POST /api/v1/tours
  - Takes JSON: country parameter
  - returns JSON: Redirect to Get Route /api/v1/tours/[:param].json
  - Example: curl -v -H "Accept: application/json" -H "Content-type: application/json" \ -X POST -d "{\"country\":\"Honduras\"}" http://localhost:9292/api/v1/tours
