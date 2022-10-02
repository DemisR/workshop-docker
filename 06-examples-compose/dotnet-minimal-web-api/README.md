HTTP VERB ENDPOINT STATUS CODE(S) DESCRIPTION
POST /notes 201 Created Creates a Note
GET /notes/{id:int} 200 OK, 404 Not Found Read a Note given its id
GET /notes 200 OK Retrieves all Notes
PUT /notes/{id:int} 200 OK, 404 Not Found, 400 Bad Request Updates a Note given its id
DELETE /notes 204 No Content Deletes a Note given its id

# Credits

Navule Pavan Kumar Rao
https://github.com/windson/minimal-web-api-tutorials
