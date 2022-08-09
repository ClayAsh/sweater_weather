# SWEATER WEATHER
![Screen Shot 2022-08-09 at 2 35 11 PM](https://user-images.githubusercontent.com/99059063/183756407-e34c736d-c383-47c2-a62a-496d29de5e7c.png)
![Screen Shot 2022-08-09 at 2 33 58 PM](https://user-images.githubusercontent.com/99059063/183756417-a942732e-6375-4da0-b8c6-345f28f45e4b.png)
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-sweater-weather">About Sweater Weather</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
        <li><a href="#tested-with">Tested With</a></li>
      </ul>
    </li>
    <li>
    <a href="#api-end-points">API End Points</a>
      <ul>
      <li><a href="#how-to-use-sweater-weather-on-your-local">How to use Sweater Weather on your local</a></li>
      </ul>
    </li>
  </ol>  
</details>

<!-- ABOUT SWEATER WEATHER -->
### About Sweater Weather
---

Sweater Weather is a back-end Ruby on Rails project that utilizes the MapQuest and Open Weather API to provide weather data and travel-time JSON packages for a front-end application.

The learning goals for Sweater Weather are as follows:

* Expose an API that aggregates data from multiple external APIs
* Expose an API that requires an authentication token
* Expose an API for CRUD functionality
* Determine completion criteria based on the needs of other developers
* Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).

<br>

### Built With

  * [Rails v5.2.8](https://rubyonrails.org/)
  * [Ruby v2.7.4](https://www.ruby-lang.org/en/)

### Tested With

* [RSpec v3.11](https://rspec.info/)
* [PostMan](https://www.postman.com/)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- API END POINTS -->
### API End Points
---

Sweater Weather provides the following end points: 

* GET /api/v1/forecast?location=#{location}</br>
-This endpoint requires the headers {Content-Type: application/json, Accept: application/json}</br>
-Returns JSON response containing hourly, daily and current weather data.

* POST /api/v1/users</br>
-This endpoint requires the headers {Content-Type: application/json, Accept: application/json}</br>
-Returns API key for use in accessing Trip Weather data</br>
-This enpoint requires user data be sent in the body of the request and requires the following keys: </br>
{</br>
  "email": "whatever@example.com",</br>
  "password": "password",</br>
  "password_confirmation": "password"</br>
}</br>

* POST /api/v1/sessions</br>
-This endpoint requires the headers {Content-Type: application/json, Accept: application/json}</br>
-This enpoint requires user data be sent in the body of the request and requires the following keys:</br>
{</br>
  "email": "whatever@example.com",</br>
  "password": "password"</br>
}</br>

* POST /api/v1/road_trip</br>
-This endpoint requires the headers {Content-Type: application/json, Accept: application/json}</br>
-Returns JSOn response containing start city, end city, travel time and weather at estimated time of arrival.</br>
-This enpoint requires user data be sent in the body of the request and requires the following keys:</br>
{</br>
  "origin": "Denver,CO",</br>
  "destination": "Pueblo,CO",</br>
  "api_key": "jgn983hy48thw9begh98h4539h4"</br>
}

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- HOW TO USE SWEATER WEATHER ON YOUR LOCAL -->
### How to use Sweater Weather on your local
---
- Fork and clone this repository. 
- Navigate into sweater_weather and run 'bundle install'
- Next, run 'bundle exec figaro install' in your terminal. 
- Visit https://developer.mapquest.com/documentation/geocoding-api/ to sign up for a MapQuest API key 
- Visit https://openweathermap.org/api/one-call-api to sign up for an OpenWeather API key 
- Put your API keys in the config/application.yml file as follows:
map_key: < mapquest api key here >
ow_key: < openweather api key here >
- Run 'bundle exec rspec' to run the RSpec test suite 

<br>
<p align="right">(<a href="#top">back to top</a>)</p>




