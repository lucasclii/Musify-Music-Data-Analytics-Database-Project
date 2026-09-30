# Musify-Music-Data-Analytics-Database-Project-Northeastern-University

## Project Overview

**Musify** is a database-driven music platform developed as a team project at Northeastern University. The project combines **SQL, MySQL, Python, Pandas, and Matplotlib** to manage and analyze music-related data and generate insights into music trends and user activity.

The project was designed around a relational database containing information about **artists, bands, albums, songs, genres, users, playlists, and reviews**.

Beyond database management, the project demonstrates an end-to-end data workflow:

**Database → SQL Queries → Python/Pandas → Data Analysis → Visualization → Insights**

---

## Project Objectives

The project focused on:

* Designing and managing a complex relational database
* Writing SQL queries to retrieve and analyze data
* Connecting Python applications to MySQL
* Transforming database results into analysis-ready datasets
* Creating visualizations to identify trends
* Generating data-driven insights from music and user activity
* Developing a functional application that allows users to interact with the database

---

## 🗄️ Data & Database Design

The database models relationships across several entities, including:

* Entertainment companies
* Artists / members
* Bands
* Albums
* Record labels
* Songs
* Genres
* Users
* Playlists
* Reviews

The relational structure allows analysis across multiple dimensions, such as **genre, album, artist/band, release year, and user activity**.

The database was implemented using **MySQL**, with SQL used for database creation, management, and analytical queries.

---

## Data Analysis

Several analytical questions were developed using the data stored in the database.

### Music Trends

The project analyzes:

* Distribution of bands by founding year
* Distribution of albums by release year
* Most popular genres based on number of songs
* Albums with the longest total playtime
* Latest albums released by bands

### User Engagement

The database also supports analysis of user activity, including:

* Number of reviews submitted by users
* Most active users based on review activity
* User playlist activity

These analyses demonstrate how relational data can be transformed into meaningful metrics and insights.

---

## Data Visualization

Python was used to retrieve and process database data for visualization.

**Libraries:**

* Python
* PyMySQL
* Pandas
* Matplotlib

Visualizations include:

### Band Founding-Year Distribution

A visualization showing how bands in the database are distributed according to their founding years.

### Album Release-Year Distribution

A visualization showing the distribution of albums across different release years.

These visualizations provide a more intuitive way to identify patterns and trends in the underlying data.


