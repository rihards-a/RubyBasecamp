# The Model View Controller (MVC) Pattern 
- where rails finds how to process requests, where to find information in DB, how to render responses


## Route
Matchers for the URL request
GET /about 
- gives the appropriate AboutController handle (handles requests and responses)

## Models
Database wrapper
User
* Query for records/database
* Wrap indivial records - compartmentalize

## Views
Response content:
HTML, CSV, PDF, XML, etc.
- gets sent back to the browser and displayed

## Controllers
Decide how to process a request and define a response
