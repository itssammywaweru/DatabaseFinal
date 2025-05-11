# DatabaseFinal
# Movie Database Project

## Project Title: MovieDB

### Description:
The Movie Database (MovieDB) is a relational database designed to manage and store information about movies, actors, directors, and genres. It is implemented using MySQL, and it tracks the relationships between:
- Movies (with title, release year, and genre)
- Directors (with name)
- Actors (with name)
- Genres (with name)

The project includes tables to manage the data and establishes relationships such as:
- One-to-Many (1:M) relationship between Directors and Movies.
- Many-to-One (M:1) relationship between Movies and Genres.
- Many-to-Many (M:M) relationship between Movies and Actors (handled via a join table).

This database allows you to easily add, query, and manage movie-related data.

### How to Run/Setup the Project:

1. **Install MySQL**:
   - Ensure you have MySQL installed on your system. 

2. **Create the Database**:
   - Download the SQL script (provided below) and run it in your MySQL client.

   
3. **Test the Database**:
   - After running the script, you can query the database to retrieve information about movies, directors, actors, and genres. For example:
     ```sql
     SELECT * FROM Movies;
     ```

4. **Accessing the Database**:
   - You can access the database through your MySQL client by connecting to the database `movie_db`.

### ERD (Entity-Relationship Diagram):

Here is the link to the ERD for the MovieDB project, showing the tables and their relationships:
![ERD Image](https://shorturl.at/ZjM8H) 


### Database Structure Overview:
1. **Directors**: Holds data about directors (id, name).
2. **Actors**: Stores data about actors (id, name).
3. **Genres**: Contains information about genres (id, name).
4. **Movies**: Stores movies with references to directors and genres.
5. **Movie_Actor**: A junction table representing the many-to-many relationship between Movies and Actors.

### Example Queries:
- **List all Movies**:
  ```sql
  SELECT * FROM Movies;
